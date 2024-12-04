module sony9997_game::sony9997_game {
    use std::string::{Self, String};
    use sui::tx_context::{Self, TxContext};
    use sui::balance::{Self, Balance};
    use sui::object::{Self, UID};
    use sui::coin::{Self, Coin,TreasuryCap};
    use sui::clock::{Self, Clock};
    use sony9997_faucet::sony9997_faucet::{Self,SONY9997_FAUCET};
    use sui::transfer;
    use sui::event;

    const EInvalidNumber: u64 = 0;
    const EPoolNotEnough: u64 = 1;
    const EInputNotEnough: u64 = 2;


    public struct AdminCap has key {
        id: UID
    }

    public struct Game has key {
        id: UID,
        pool: Balance<SONY9997_FAUCET>,
    }

    public struct GameResult has copy, drop {
        your_choice: String,
        npc_choice: String,
        result: String,
        is_winner: bool,
    }

    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            pool: balance::zero<SONY9997_FAUCET>(),
        };
        transfer::share_object(game);
        let admin_cap = AdminCap {
            id: object::new(ctx)
        };
        transfer::transfer(admin_cap, tx_context::sender(ctx))
    }

    

    public entry fun deposit(game: &mut Game, input: Coin<SONY9997_FAUCET>, amount: u64, ctx: &mut TxContext) {
        let input_value = coin::value(&input);
        assert!(input_value >= amount, EInputNotEnough);

        let mut input_balance = coin::into_balance(input);
        if (input_value > amount) {
            balance::join(
                &mut game.pool,
                balance::split(&mut input_balance, amount)
            );
            let change = coin::from_balance(input_balance, ctx);
            transfer::public_transfer(change, tx_context::sender(ctx));
        } else {
            balance::join(&mut game.pool, input_balance);
        }
    }

    public entry fun withdraw(_: &AdminCap, game: &mut Game, amount: u64, ctx: &mut TxContext) {
        let output_balance = balance::split(&mut game.pool, amount);
        let output = coin::from_balance(output_balance, ctx);
        transfer::public_transfer(output, tx_context::sender(ctx));
    }

    fun get_random_choice(clock: &Clock) : u8 {
        ((clock::timestamp_ms(clock) % 3) as u8)
    }

    fun get_choice_desc(choice: u8) : String {
        if (choice == 0) {
            string::utf8(b"Mouse")
        } else if (choice == 1) {
            string::utf8(b"Elephant")
        } else if (choice == 2) {
            string::utf8(b"Cat")
        } else {
            string::utf8(b"Invalid")
        }
    }

 
    public entry fun guess_fists(choice: u8, game: &mut Game, input: Coin<SONY9997_FAUCET>,clock: &Clock, ctx: &mut TxContext) {
        assert!(choice < 3, EInvalidNumber);

        let input_value = coin::value(&input);
        assert!(input_value >1000, EInputNotEnough);
        let reward=input_value*2;
        assert!(reward < balance::value(&game.pool), EPoolNotEnough);
        let mut input_balance = coin::into_balance(input);
        balance::join(&mut game.pool, input_balance);

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
            let reward_balance = balance::split(&mut game.pool, reward);
            let reward = coin::from_balance(reward_balance, ctx);
            transfer::public_transfer(reward, tx_context::sender(ctx));
        };

        event::emit(GameResult {
            your_choice: get_choice_desc(choice),
            npc_choice: get_choice_desc(npc_choice),
            result,
            is_winner,
        });
    }

    public entry fun get_faucet_coin(treasury_cap: &mut TreasuryCap<SONY9997_FAUCET>, amount: u64, ctx: &mut TxContext) {
        sony9997_faucet::mint(treasury_cap, amount, tx_context::sender(ctx), ctx);
    }
}