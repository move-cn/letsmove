/*
/// Module: xiaodi_game
module xiaodi_game::xiaodi_game {

}
*/

module xiaodi_game::xiaodi_game {
    use std::string::{Self, String};
    use sui::event;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::tx_context::sender;
    use sui::random;
    use sui::random::{Random};
    use xiaodi_game::xiaodi007_faucet_coin::XIAODI007_FAUCET_COIN;


    const EInvalidNumber: u64 = 0;
    const EPoolNotEnough: u64 = 1;
    const EInputNotEnough: u64 = 2;

    public struct GameResult has copy, drop {
        your_choice: u8,
        npc_choice: u8,
        result: String,
        is_winner: bool,
    }

    public struct Game  has key {
        id: UID,
        pool: Balance<XIAODI007_FAUCET_COIN>,
        ticket: u64,
        reward: u64,
    }


    fun choice9(rng: &random::Random, ctx: &mut TxContext): u8 {
        // Initialize the random number generator
        let mut generator = random::new_generator(rng, ctx);

        // Generate a randomnumber
        let rand_num = random::generate_u8_in_range(&mut generator, 0, 9);

        rand_num
    }

    fun init(ctx: &mut TxContext) {
    }

    entry fun creat_game(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            pool: balance::zero<XIAODI007_FAUCET_COIN>(),
            ticket: 2_000_000,
            reward: 4_000_000,
        };
        transfer::share_object(game);

    }

    public entry fun play(choice: u8, game: &mut Game, input: Coin<XIAODI007_FAUCET_COIN>, rng: &Random, ctx: &mut TxContext) {
        assert!(balance::value(&game.pool) >= game.reward - game.ticket, EPoolNotEnough);
        assert!(choice >= 0 && choice < 10, EInvalidNumber);

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

        let npc_choice = choice9(rng, ctx);
        let (result, is_winner) = if (
            npc_choice < choice
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
            your_choice: choice,
            npc_choice: npc_choice,
            result,
            is_winner,
        });
    }
    public entry fun deposit(game: &mut Game, input: Coin<XIAODI007_FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
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

    public entry fun withdraw(game: &mut Game, amount: u64, ctx: &mut TxContext) {
        let output_balance = balance::split(&mut game.pool, amount);
        let output = coin::from_balance(output_balance, ctx);
        transfer::public_transfer(output, sender(ctx));
    }
}