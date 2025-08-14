
/// Module: task4
module task4::yibinjay_game {
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::tx_context::sender;
    use task2::yibinjay_faucet_coin::{Self, YIBINJAY_FAUCET_COIN};

    const EInvalidNumber: u64 = 0;
    const EPoolNotEnough: u64 = 1;
    const EInputNotEnough: u64 = 2;

    /* ================= events ================= */

    public struct GameResult has copy, drop {
        your_choice: String,
        npc_choice: String,
        result: String,
        is_winner: bool,
    }

    /* ================== game ================== */

    public struct Game has key {
        id: UID,
        pool: Balance<YIBINJAY_FAUCET_COIN>,
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

    /* ================ admin_cap =============== */

    public struct AdminCap has key {
        id: UID,
    }

    /* =============== main logic ================ */

    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            pool: balance::zero<YIBINJAY_FAUCET_COIN>(),
            ticket: 100_000_000,
            reward: 200_000_000,
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

    public entry fun play(choice: u8, game: &mut Game, input: Coin<YIBINJAY_FAUCET_COIN>, clock: &Clock, ctx: &mut TxContext) {
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

    public entry fun deposit(game: &mut Game, input: Coin<YIBINJAY_FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
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

    public entry fun get_faucet_coin(treasury_cap: &mut TreasuryCap<YIBINJAY_FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        yibinjay_faucet_coin::mint(treasury_cap, amount, sender(ctx), ctx);
    }
}
