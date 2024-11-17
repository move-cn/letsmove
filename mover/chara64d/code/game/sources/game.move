module game::game {
    use sui::random::{Self, Random, new_generator};
    use std::string::{Self, String};
    use sui::event;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    use sui::tx_context::sender;

    const EPoolNotEnough: u64 = 1;
    const EInputNotEnough: u64 = 2;

    public struct GameResult has copy, drop {
        your_roll: u64,
        npc_roll: u64,
        result: String,
        is_winner: bool,
    }

    public struct Game<phantom T>  has key {
        id: UID,
        pool: Balance<T>,
        ticket: u64,
        reward: u64
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
            ticket: 588,
            reward: 1000,
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
    #[allow(lint(public_random))]
    public entry fun play<T>(game: &mut Game<T>, input: Coin<T>, r: &Random, ctx: &mut TxContext) {
        
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
