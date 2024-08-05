module game::julieeking_game {
    use std::string::{Self, String};
    use sui::event;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::tx_context::sender;
    use coin::julieeking_faucet_coin::{Self, JULIEEKING_FAUCET_COIN};
    use std::hash;
    use std::vector;

    use sui::bcs;
    use sui::object;
    use sui::tx_context::TxContext;
    
    const ERR_HIGH_ARG_GREATER_THAN_LOW_ARG: u64 = 101;
    const EInvalidNumber: u64 = 0;
    const EPoolNotEnough: u64 = 1;
    const EInputNotEnough: u64 = 2;

    public struct GameResult has copy, drop {
        your_roll: u64,
        npc_roll: u64,
        result: String,
        is_winner: bool,
    }

    public struct Game has key {
        id: UID,
        pool: Balance<JULIEEKING_FAUCET_COIN>,
        ticket: u64,
        reward: u64,
    }

    public fun game_pool(game: &Game): u64 {
        balance::value(&game.pool)
    }

    public fun game_ticket(game: &Game): u64 {
        game.ticket
    }

    public fun game_reward(game: &Game): u64 {
        game.reward
    }

    public struct AdminCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            pool: balance::zero<JULIEEKING_FAUCET_COIN>(),
            ticket: 1_000,
            reward: 2_000,
        };
        transfer::share_object(game);

        let admin_cap = AdminCap { id: object::new(ctx) };
        transfer::transfer(admin_cap, sender(ctx));
    }

    fun get_random_roll(ctx: &mut TxContext) : u64 {
        rand_u64_range(0, 3, ctx)
    }

    fun get_random_roll_2(ctx: &mut TxContext) : u64 {
        rand_u64_range(0, 3, ctx)
    }

    public entry fun play(game: &mut Game, input: Coin<JULIEEKING_FAUCET_COIN>, ctx: &mut TxContext) {
        
        assert!(balance::value(&game.pool) >= game.reward - game.ticket, EPoolNotEnough);

        let input_value = coin::value(&input);
        assert!(input_value >= game.ticket, EInputNotEnough);

        let mut input_balance = coin::into_balance(input);
        if (input_value > game.ticket) {
            balance::join(
                &mut game.pool,
                balance::split(&mut input_balance, game.ticket)
            );
            let change = coin::from_balance(input_balance, ctx);
            transfer::public_transfer(change, sender(ctx));
        } else {
            balance::join(&mut game.pool, input_balance);
        };

        let player_roll = get_random_roll_2(ctx);
        let npc_roll = get_random_roll(ctx);
        let (result, is_winner) = if (player_roll > npc_roll) {
            (string::utf8(b"Win"), true)
        } else if (player_roll == npc_roll) {
            (string::utf8(b"Draw"), false)
        } else {
            (string::utf8(b"Lose"), false)
        };

        if (is_winner) {
            let reward_balance = balance::split(&mut game.pool, game.reward);
            let reward = coin::from_balance(reward_balance, ctx);
            transfer::public_transfer(reward, sender(ctx));
        };

        event::emit(GameResult {
            your_roll: player_roll,
            npc_roll: npc_roll,
            result,
            is_winner,
        });
    }

    public entry fun deposit(game: &mut Game, input: Coin<JULIEEKING_FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        let input_value = coin::value(&input);
        assert!(input_value >= amount, EInputNotEnough);

        let mut input_balance = coin::into_balance(input);
        if (input_value > amount) {
            balance::join(
                &mut game.pool,
                balance::split(&mut input_balance, amount)
            );
            let change = coin::from_balance(input_balance, ctx);
            transfer::public_transfer(change, sender(ctx));
        } else {
            balance::join(&mut game.pool, input_balance);
        }
    }

    public entry fun withdraw(_: &AdminCap, game: &mut Game, amount: u64, ctx: &mut TxContext) {
        let output_balance = balance::split(&mut game.pool, amount);
        let output = coin::from_balance(output_balance, ctx);
        transfer::public_transfer(output, sender(ctx));
    }

    public entry fun set_ticket(_: &AdminCap, game: &mut Game, ticket: u64, _: &mut TxContext) {
        game.ticket = ticket;
    }

    public entry fun set_reward(_: &AdminCap, game: &mut Game, reward: u64, _: &mut TxContext) {
        game.reward = reward;
    }

    public entry fun get_faucet_coin(treasury_cap: &mut TreasuryCap<JULIEEKING_FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        julieeking_faucet_coin::mint(treasury_cap, amount, sender(ctx), ctx);
    }

    fun seed(ctx: &mut TxContext): vector<u8> {
        let ctx_bytes = bcs::to_bytes(ctx);
        let uid = object::new(ctx);
        let uid_bytes: vector<u8> = object::uid_to_bytes(&uid);
        object::delete(uid);

        let mut info: vector<u8> = vector::empty<u8>();
        vector::append<u8>(&mut info, ctx_bytes);
        vector::append<u8>(&mut info, uid_bytes);

        let hash: vector<u8> = hash::sha3_256(info);
        hash
    }

    fun bytes_to_u64(bytes: vector<u8>): u64 {
        let mut value = 0u64;
        let mut i = 0u64;
        while (i < 8) {
            value = value | ((*vector::borrow(&bytes, i) as u64) << ((8 * (7 - i)) as u8));
            i = i + 1;
        };
        return value
    }

    fun rand_u64_with_seed(_seed: vector<u8>): u64 {
        bytes_to_u64(_seed)
    }

    fun rand_u64_range_with_seed(_seed: vector<u8>, low: u64, high: u64): u64 {
        assert!(high > low, ERR_HIGH_ARG_GREATER_THAN_LOW_ARG);
        let value = rand_u64_with_seed(_seed);
        (value % (high - low)) + low
    }

    public fun rand_u64_range(low: u64, high: u64, ctx: &mut TxContext): u64 {
        rand_u64_range_with_seed(seed(ctx), low, high)
    }
}
