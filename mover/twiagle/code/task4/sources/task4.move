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

    public struct Game has key {
        id: UID,
        game_name: String,
        creator: address,
        reward_amount: u64,
        reward_factor: u64,
        base_epoch: u64,
        base_drand_round: u64,
    }

    public struct Reward has key {
        id: UID,
        game_id: ID,
        balance: Balance<SUI>,
    }

    public struct Ticket has key, store {
        id: UID,
        game_id: ID,
    }

    public struct Winner has key, store {
        id: UID,
        game_id: ID,
    }

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
        round + 20 * 10
    }
}