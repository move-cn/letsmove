/// Module: hellogmegg_game
module hellogmegg_game::hellogmegg_game {
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::tx_context::sender;
    use faucet_coin::tmm_faucet::{Self, TMM_FAUCET};

    const EPoolNotEnough: u64 = 1;
    const EInputNotEnough: u64 = 2;

    public struct GameResult has copy, drop {
        result: String,
    }

    public struct Game has key {
        id: UID,
        pool: Balance<TMM_FAUCET>,
        ticket: u64,
        reward: u64,
    }

    public fun game_pool(game: &Game): u64 {
        balance::value(&game.pool)
    }

    public struct AdminCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            pool: balance::zero<TMM_FAUCET>(),
            ticket: 100_000_000,
            reward: 200_000_000,
        };
        transfer::share_object(game);

        let admin_cap = AdminCap { id: object::new(ctx) };
        transfer::transfer(admin_cap, sender(ctx));
    }

    fun get_random_choice(clock: &Clock) : u8 {
        ((clock::timestamp_ms(clock) % 2) as u8)
    }

    public entry fun play(choice: u8, game: &mut Game, input: Coin<TMM_FAUCET>, clock: &Clock, ctx: &mut TxContext) {
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

        let (result, win) = if (
            (choice % 2 == get_random_choice(clock))
        ) {
            (string::utf8(b"WIN"), true)
        } else {
            (string::utf8(b"LOSE"), false)
        };

        if (win) {
            let reward_balance = balance::split(&mut game.pool, game.reward);
            let reward = coin::from_balance(reward_balance, ctx);
            transfer::public_transfer(reward, sender(ctx));
        };

        event::emit(GameResult {
            result,
        });
    }

    public entry fun deposit(game: &mut Game, input: Coin<TMM_FAUCET>, amount: u64, ctx: &mut TxContext) {
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

    public entry fun get_faucet_coin(treasury_cap: &mut TreasuryCap<TMM_FAUCET>, amount: u64, ctx: &mut TxContext) {
        tmm_faucet::mint(treasury_cap, amount, sender(ctx), ctx);
    }
}
