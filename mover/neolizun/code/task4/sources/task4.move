// Module: task4
module task4::neolizun_game {
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::tx_context::sender;

    const EInvalidNumber: u64 = 0;
    const EPoolNotEnough: u64 = 1;
    const EInputNotEnough: u64 = 2;
    const SymbolRange: u8 = 5;
    
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

    fun init(ctx: &mut TxContext) {
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

    fun get_spin_result(clock: &Clock) : SpinResult {
        let timestamp = clock::timestamp_ms(clock);
        let spin1 = ((timestamp % (SymbolRange as u64 + 1)) as u8);
        let spin2 = (((timestamp / 100) % (SymbolRange as u64 + 1)) as u8);
        let spin3 = (((timestamp / 10000) % (SymbolRange as u64 + 1)) as u8);
        SpinResult { spin1, spin2, spin3 }
    }

    public entry fun play<T>(choice: u8, game: &mut Game<T>, input: Coin<T>, clock: &Clock, ctx: &mut TxContext) {
        assert!(balance::value(&game.pool) >= game.reward - game.ticket, EPoolNotEnough);

        let player_spins = get_spin_result(clock);
        let winning_combination = SpinResult { spin1: 2, spin2: 2, spin3: 2 };  // 设置一个中奖组合

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
}