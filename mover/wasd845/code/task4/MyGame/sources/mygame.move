/// Module: task4
module mygame::wasd845_game {
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::tx_context::sender;
    use faucetcoin::faucetcoin::{Self, FAUCETCOIN};

    const EInvalidNumber: u64 = 0;
    const EPoolNotEnough: u64 = 1;
    const EInputNotEnough: u64 = 2;

    public struct GameResult has copy, drop {
        your_roll: u8,
        npc_roll: u8,
        result: String,
        is_winner: bool,
    }

    public struct Game has key {
        id: UID,
        pool: Balance<FAUCETCOIN>,
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
            pool: balance::zero<FAUCETCOIN>(),
            ticket: 1_000,
            reward: 2_000,
        };
        transfer::share_object(game);

        let admin_cap = AdminCap { id: object::new(ctx) };
        transfer::transfer(admin_cap, sender(ctx));
    }

    fun get_random_roll(clock: &Clock) : u8 {
        ((clock::timestamp_ms(clock) % 6) + 1) as u8
    }

    public entry fun play(choice: u8, game: &mut Game, input: Coin<FAUCETCOIN>, clock: &Clock, ctx: &mut TxContext) {
        assert!(choice < 7, EInvalidNumber);
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

        let player_roll = choice;
        let npc_roll = get_random_roll(clock);
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

    public entry fun deposit(game: &mut Game, input: Coin<FAUCETCOIN>, amount: u64, ctx: &mut TxContext) {
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

    public entry fun get_faucet_coin(treasury_cap: &mut TreasuryCap<FAUCETCOIN>, amount: u64, ctx: &mut TxContext) {
        faucetcoin::mint(treasury_cap, amount, sender(ctx), ctx);
    }
}
