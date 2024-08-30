module task4::game {
    use sui::random::{Self, Random, new_generator};
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::tx_context::sender;
    use task2::guttail_faucet_coin::{Self, GUTTAIL_FAUCET_COIN};

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
        pool: Balance<GUTTAIL_FAUCET_COIN>,
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
            pool: balance::zero<GUTTAIL_FAUCET_COIN>(),
            ticket: 1_000,
            reward: 2_000,
        };
        transfer::share_object(game);

        let admin_cap = AdminCap { id: object::new(ctx) };
        transfer::transfer(admin_cap, sender(ctx));
    }

    fun get_random_roll(r: &Random, ctx: &mut TxContext) : u64 {
        let mut generator = new_generator(r, ctx);
        random::generate_u64_in_range(&mut generator, 0, 3)
    }

    fun get_random_roll_2(r: &Random, ctx: &mut TxContext) : u64 {
        let mut generator = new_generator(r, ctx);
        random::generate_u64_in_range(&mut generator, 0, 3)
    }

    public entry fun play(game: &mut Game, input: Coin<GUTTAIL_FAUCET_COIN>, r: &Random, ctx: &mut TxContext) {
        
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

        let player_roll = get_random_roll_2(r, ctx);
        let npc_roll = get_random_roll(r, ctx);
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

    public entry fun deposit(game: &mut Game, input: Coin<GUTTAIL_FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
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

    public entry fun get_faucet_coin(treasury_cap: &mut TreasuryCap<GUTTAIL_FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        guttail_faucet_coin::mint(treasury_cap, amount, sender(ctx), ctx);
    }
}
