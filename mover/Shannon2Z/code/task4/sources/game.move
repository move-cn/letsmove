module task4::shannon2z_game {
    use std::string::{Self, String};
    use sui::event;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    use sui::tx_context::sender;
    use std::hash;
    use sui::bcs;

    const EPoolNotEnough: u64 = 1;
    const EInputNotEnough: u64 = 2;
    const ERR_HIGH_ARG_GREATER_THAN_LOW_ARG: u64 = 101;

    public struct GameResult has copy, drop {
        result: String,
        is_winner: bool,
    }

    public struct Game<phantom T>  has key {
        id: UID,
        pool: Balance<T>,
        ticket: u64,
        reward: u64,
    }

    public struct SpinResult has copy, drop, store {
        spin1: u8,
        spin2: u8,
        spin3: u8,
    }

    public fun game_pool<T>(game: &Game<T>): u64 {
        balance::value(&game.pool)
    }

    public fun game_ticket<T>(game: &Game<T>): u64 {
        game.ticket
    }

    public fun game_reward<T>(game: &Game<T>): u64 {
        game.reward
    }

    public struct AdminCap has key {
        id: UID,
    }

    fun init(_ctx: &mut TxContext) {
    }
    
    entry fun creat_game<T>(ctx: &mut TxContext) {
        let game = Game<T> {
            id: object::new(ctx),
            pool: balance::zero<T>(),
            ticket: 1000,
            reward: 2000,
        };
        transfer::share_object(game);

        let admin_cap = AdminCap { id: object::new(ctx) };
        transfer::transfer(admin_cap, sender(ctx));
    }

    fun get_spin_result(ctx: &mut TxContext) : SpinResult {
        let spin1 = (rand_u64_range(0, 5, ctx) as u8);
        let spin2 = (rand_u64_range(0, 5, ctx) as u8);
        let spin3 = (rand_u64_range(0, 5, ctx) as u8);
        SpinResult { spin1, spin2, spin3 }
    }

    public entry fun play<T>(game: &mut Game<T>, input: Coin<T>, ctx: &mut TxContext) {
        assert!(balance::value(&game.pool) >= game.reward - game.ticket, EPoolNotEnough);

        let player_spins = get_spin_result(ctx);
        let winning_combination = SpinResult { spin1: 2, spin2: 2, spin3: 2 }; 

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

        let (result, is_winner) = if (player_spins.spin1 == winning_combination.spin1 && player_spins.spin2 == winning_combination.spin2 && player_spins.spin3 == winning_combination.spin3) {
            ( string::utf8(b"Congratulations, you hit the jackpot! Collect your coins😄"), true)
        } else {
            ( string::utf8(b"Try again, better luck next time!💔"), false)
        };

        if (is_winner) {
            let reward_balance = balance::split(&mut game.pool, game.reward);
            let reward = coin::from_balance(reward_balance, ctx);
            transfer::public_transfer(reward, sender(ctx));
        };

        event::emit(GameResult {
            result,
            is_winner,
        });
    }

    public entry fun deposit<T>(game: &mut Game<T>, input: Coin<T>, amount: u64, ctx: &mut TxContext) {
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

    public entry fun withdraw<T>(_: &AdminCap, game: &mut Game<T>, amount: u64, ctx: &mut TxContext) {
        let output_balance = balance::split(&mut game.pool, amount);
        let output = coin::from_balance(output_balance, ctx);
        transfer::public_transfer(output, sender(ctx));
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