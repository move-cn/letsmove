module task4::supersodawater_game {
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::tx_context::sender;

    const EInvalidNumber: u64 = 0;
    const EPoolNotEnough: u64 = 1;
    const EInputNotEnough: u64 = 2;

    public struct GameResult has copy, drop {
        your_choice: String,
        npc_choice: String,
        result: String,
        is_winner: bool,
    }

    public struct Game<phantom T>  has key {
        id: UID,
        pool: Balance<T>,
        ticket: u64,
        reward: u64,
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
            ticket: 666,
            reward: 1888,
        };
        transfer::share_object(game);

        let admin_cap = AdminCap { id: object::new(ctx) };
        transfer::transfer(admin_cap, sender(ctx));
    }

    fun get_random_choice(clock: &Clock) : u8 {
        ((clock::timestamp_ms(clock) % 3) as u8)
    }

    fun map_choice_to_string(choice: u8) : String {
        if (choice == 0) {
            string::utf8(b"Rock")
        } else if (choice == 1) {
            string::utf8(b"Scissors")
        } else if (choice == 2) {
            string::utf8(b"Paper")
        } else {
            string::utf8(b"Invalid")
        }
    }

    public entry fun play<T>(choice: u8, game: &mut Game<T>, input: Coin<T>, clock: &Clock, ctx: &mut TxContext) {
        assert!(balance::value(&game.pool) >= game.reward - game.ticket, EPoolNotEnough);

        assert!(choice < 3, EInvalidNumber);

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

        let npc_choice = get_random_choice(clock);
        let (result, is_winner) = if (
            (choice == 0 && npc_choice == 1) || (choice == 1 && npc_choice == 2) || (choice == 2 && npc_choice == 0)
        ) {
            (string::utf8(b"Win"), true)
        } else if (choice == npc_choice) {
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
            your_choice: map_choice_to_string(choice),
            npc_choice: map_choice_to_string(npc_choice),
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