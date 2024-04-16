module task4::drand_based_scratch_card {
    use std::string::{Self, String};
    use sui::object::{Self,UID, ID};
    use sui::tx_context::{Self, TxContext, sender};

    use sui::balance::Balance;
    use sui::balance::{Self};
    use sui::coin::{Self, Coin};
    use sui::hmac::hmac_sha3_256;

    use sui::sui::SUI;

    use task4::drand_lib;

    const GITHUB_ID: vector<u8> = b"twiagle";

    /// Error codes
    const EInvalidDeposit: u64 = 0;
    const EInvalidEpoch: u64 = 1;
    const EInvalidTicket: u64 = 2;
    const EInvalidReward: u64 = 4;
    const ETooSoonToRedeem: u64 = 5;
    const EInvalidGame: u64 = 6;

    /// Game represents a set of parameters of a single game.
    public struct Game has key {
        id: UID,
        game_name: String,
        creator: address,
        reward_amount: u64,
        reward_factor: u64,
        base_epoch: u64,
        base_drand_round: u64,
    }

    /// Reward that is attached to a specific game. Can be withdrawn once.
    public struct Reward has key {
        id: UID,
        game_id: ID,
        balance: Balance<SUI>,
    }

    /// Ticket represents a participant in a single game.
    /// Can be deconstructed only by the owner.
    public struct Ticket has key, store {
        id: UID,
        game_id: ID,
    }

    /// Winner represents a participant that won in a specific game.
    /// Can be consumed by the take_reward.
    public struct Winner has key, store {
        id: UID,
        game_id: ID,
    }

    /// Create a new game with a given reward.
    ///
    /// The reward must be a positive balance, dividable by reward_factor. reward/reward_factor will be the ticket
    /// price. base_drand_round is the current drand round.
    public entry fun create(
        reward: Coin<SUI>,
        reward_factor: u64,
        base_drand_round: u64,
        ctx: &mut TxContext
    ) {
        let reward_amount = coin::value(&reward);
        assert!(reward_amount > 0 && reward_amount % reward_factor == 0 , EInvalidReward);

        let game = Game {
            id: object::new(ctx),
            game_name: string::utf8(GITHUB_ID),
            reward_amount: reward_amount,
            creator: sender(ctx),
            reward_factor,
            base_epoch: tx_context::epoch(ctx),
            base_drand_round,
        };
        let reward = Reward {
            id: object::new(ctx),
            game_id: object::id(&game),
            balance: coin::into_balance(reward),
        };
        transfer::freeze_object(game);
        transfer::share_object(reward);
    }

    /// Buy a ticket for a specific game, costing reward/reward_factor SUI. Can be called only during the epoch in which
    /// the game was created.
    /// Note that the reward might have been withdrawn already. It's the user's responsibility to verify that.
    public entry fun buy_ticket(coin: Coin<SUI>, game: &Game, ctx: &mut TxContext) {
        assert!(coin::value(&coin) * game.reward_factor == game.reward_amount, EInvalidDeposit);
        assert!(tx_context::epoch(ctx) == game.base_epoch, EInvalidEpoch);
        let ticket = Ticket {
            id: object::new(ctx),
            game_id: object::id(game),
        };
        transfer::public_transfer(coin, game.creator);
        transfer::public_transfer(ticket, tx_context::sender(ctx));
    }

    public entry fun evaluate(
        ticket: Ticket,
        game: &Game,
        drand_sig: vector<u8>,
        ctx: &mut TxContext
    ) {
        assert!(ticket.game_id == object::id(game), EInvalidTicket);
        drand_lib::verify_drand_signature(drand_sig, end_of_game_round(game.base_drand_round));
        // The randomness for the current ticket is derived by HMAC(drand randomness, ticket id).
        // A solution like checking if (drand randomness % reward_factor) == (ticket id % reward_factor) is not secure
        // as the adversary can control the values of ticket id. (For this particular game this attack is not
        // devastating, but for similar games it might be.)
        let random_key = drand_lib::derive_randomness(drand_sig);
        let randomness = hmac_sha3_256(&random_key, &object::id_to_bytes(&object::id(&ticket)));
        let is_winner = (drand_lib::safe_selection(game.reward_factor, &randomness) == 0);

        if (is_winner) {
            let winner = Winner {
                id: object::new(ctx),
                game_id: object::id(game),
            };
            transfer::public_transfer(winner, tx_context::sender(ctx));
        };
        // Delete the ticket.
        let Ticket { id, game_id:  _} = ticket;
        object::delete(id);
    }

    public entry fun take_reward(winner: Winner, reward: &mut Reward, ctx: &mut TxContext) {
        assert!(winner.game_id == reward.game_id, EInvalidTicket);
        let full_balance = balance::value(&reward.balance);
        if (full_balance > 0) {
            transfer::public_transfer(coin::take(&mut reward.balance, full_balance, ctx), tx_context::sender(ctx));
        };
        let Winner { id, game_id:  _} = winner;
        object::delete(id);
    }

    /// Can be called in case the reward was not withdrawn, to return the coins to the creator.
    public entry fun redeem(reward: &mut Reward, game: &Game, ctx: &mut TxContext) {
        assert!(balance::value(&reward.balance) > 0, EInvalidReward);
        assert!(object::id(game) == reward.game_id, EInvalidGame);
        // Since we define the game to take 24h+25h, a game that is created in epoch x may be completed in epochs
        // x+2 or x+3.
        assert!(game.base_epoch + 3 < tx_context::epoch(ctx), ETooSoonToRedeem);
        let full_balance = balance::value(&reward.balance);
        transfer::public_transfer(coin::take(&mut reward.balance, full_balance, ctx), game.creator);
    }

    public entry fun delete_ticket(ticket: Ticket) {
        let Ticket { id, game_id:  _} = ticket;
        object::delete(id);
    }

    public fun get_game_base_drand_round(game: &Game): u64 {
        game.base_drand_round
    }

    public fun get_game_base_epoch(game: &Game): u64 {
        game.base_epoch
    }

    public fun end_of_game_round(round: u64): u64 {
        // Since users do not know when an epoch has began, they can only check if the game depends on a round that is
        // at least 24 hours from now. Since the creator does not know as well if its game is created in the beginning
        // or the end of the epoch, we define the end of the game to be 24h + 24h from when it started, +1h to be on
        // the safe side since epoch duration is not deterministic.
        round + 20 * 10
    }
}