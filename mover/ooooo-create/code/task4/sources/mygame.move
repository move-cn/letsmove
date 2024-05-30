module mygame::mygame {
    use std::string;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::tx_context::{Self, TxContext, sender};
    use hello_coins::faucetcoin::{Self, FAUCETCOIN};
    use sui::balance::{Self, Balance};
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::object;
    use sui::object::UID;
    use sui::transfer;
    use sui::transfer::public_transfer;

    const EInvalidNumber: u64 = 0;
    const EPoolNotEnough: u64 = 1;
    const EInputNotEnough: u64 = 2;

    public struct MyGame has key {
        id: UID,
        pool: Balance<FAUCETCOIN>,
        ticket: u64,
        reward: u64
    }

    public fun get_pool(game: &MyGame): u64 {
        balance::value(&game.pool)
    }

    public fun get_ticket(game: &MyGame): u64 {
        game.ticket
    }

    public fun get_reward(game: &MyGame): u64 {
        game.reward
    }

    public struct MyGameOver has copy, drop {
        player_guess: u64,
        machine_result: u64,
        result: string::String,
        is_winner: bool,
    }

    // 管理员权限
    public struct OwnerCapability has key { id: UID }


    public fun get_default_coins(
        treasury_cap: &mut TreasuryCap<FAUCETCOIN>,
        amount: u64,
        ctx: &mut TxContext
    ) {
        faucetcoin::mint(treasury_cap, amount, tx_context::sender(ctx), ctx);
    }

    fun init(ctx: &mut TxContext) {
        let game = MyGame {
            id: object::new(ctx),
            pool: balance::zero<FAUCETCOIN>(),
            ticket: 100_000,
            reward: 200_000
        };

        transfer::share_object(game);
        let admin_cap = OwnerCapability {
            id: object::new(ctx)
        };
        transfer::transfer(admin_cap, tx_context::sender(ctx));
    }

    fun get_random_result(clock: &Clock): u64 {
        clock::timestamp_ms(clock) % 2
    }

    public entry fun deposit(game: &mut MyGame, input_coin: Coin<FAUCETCOIN>, amount: u64, ctx: &mut TxContext) {
        let input_coin_value = coin::value(&input_coin);
        assert!(input_coin_value >= amount, EInputNotEnough);

        let mut coin_balance = coin::into_balance(input_coin);
        if (input_coin_value > amount) {
            balance::join(
                &mut game.pool,
                balance::split(
                    &mut coin_balance,
                    amount
                )
            );
            let back_coin = coin::from_balance(coin_balance, ctx);
            public_transfer(back_coin, tx_context::sender(ctx));
        }else {
            balance::join(
                &mut game.pool,
                coin_balance
            );
        }
    }

    public entry fun play(
        guess: u64,
        game: &mut MyGame,
        input_coin: Coin<FAUCETCOIN>,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        assert!(guess == 0 || guess == 1, EInvalidNumber);
        assert!(balance::value(&game.pool) >= game.reward - game.ticket, EPoolNotEnough);
        assert!(coin::value(&input_coin) >= game.ticket, EInputNotEnough);
        let input_coin_value = coin::value(&input_coin);

        let mut coin_balance = coin::into_balance(input_coin);
        if (input_coin_value > game.ticket) {
            balance::join(
                &mut game.pool,
                balance::split(
                    &mut coin_balance,
                    game.ticket
                )
            );
            let back_coin = coin::from_balance(coin_balance, ctx);
            public_transfer(back_coin, tx_context::sender(ctx));
        }else {
            balance::join(
                &mut game.pool,
                coin_balance
            );
        };

        let player_guess = guess;
        let machine_random_result = get_random_result(clock);
        let (result, is_winner) = if (player_guess == machine_random_result) {
            (string::utf8(b"ooooo-create WIN"), true)
        }else {
            (string::utf8(b"ooooo-create LOSE"), false)
        };
        if (is_winner) {
            let reward_balance = balance::split(
                &mut game.pool,
                game.reward
            );
            let reward = coin::from_balance(reward_balance, ctx);
            public_transfer(reward, tx_context::sender(ctx));
        };

        event::emit(MyGameOver {
            player_guess: player_guess,
            machine_result: machine_random_result,
            result: result,
            is_winner: is_winner,
        });
    }

    public entry fun withdraw(_: &OwnerCapability, game: &mut MyGame, amount: u64, ctx: &mut TxContext) {
        let output_balance = balance::split(&mut game.pool, amount);
        let output = coin::from_balance(output_balance, ctx);
        transfer::public_transfer(output, sender(ctx));
    }

    public entry fun set_ticket(_: &OwnerCapability, game: &mut MyGame, ticket: u64, _: &mut TxContext) {
        game.ticket = ticket;
    }

    public entry fun set_reward(_: &OwnerCapability, game: &mut MyGame, reward: u64, _: &mut TxContext) {
        game.reward = reward;
    }
}