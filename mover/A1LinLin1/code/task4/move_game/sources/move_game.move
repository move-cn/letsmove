/*
/// Module: move_game
module move_game::move_game;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module move_game::moveGame {
    use sui::balance::{Self, Balance, zero, join, split, value};
    use sui::coin::{Coin, into_balance, from_balance};
    use sui::object::UID;
    use sui::random::{Random, new_generator, generate_bool};
    use sui::transfer::{share_object, public_transfer};
    use sui::tx_context::TxContext;
    use 0x1::vector;
    use faucet_coin::A1LinLin1_faucet_coin::A1LINLIN1_FAUCET_COIN; // 使用 faucet_coin 包名

    public struct Bet has store, drop {
        player: address,
        guess: bool,
    }

    public struct Game has key, store {
        id: UID,
        admin: address,
        bets: vector<Bet>,
        val: Balance<A1LINLIN1_FAUCET_COIN>,
    }

    fun init(ctx: &mut TxContext) {
        let admin = tx_context::sender(ctx);
        let game = Game {
            id: object::new(ctx),
            admin,
            bets: vector::empty(),
            val: zero(),
        };
        share_object(game);
    }

    public entry fun deposit(
        game: &mut Game, 
        guess: bool, 
        coin: Coin<A1LINLIN1_FAUCET_COIN>, 
        ctx: &mut TxContext
    ) {
        let player = tx_context::sender(ctx);
        let coin_balance = into_balance(coin);
        let bet = Bet {
            player,
            guess,
        };
        join(&mut game.val, coin_balance);
        vector::push_back(&mut game.bets, bet);
        assert!(vector::length(&game.bets) <= 2, 1000);
    }

    #[allow(lint(public_random))]
    public entry fun play(game: &mut Game, rand: &Random, ctx: &mut TxContext) {
        assert!(tx_context::sender(ctx) == game.admin, 1001);
        assert!(vector::length(&game.bets) == 2, 1002);

        let mut gen = new_generator(rand, ctx);
        let result = generate_bool(&mut gen);

        let bet0 = vector::borrow(&game.bets, 0);
        let bet1 = vector::borrow(&game.bets, 1);
        assert!(bet0.guess != bet1.guess, 1003);

        let winner_address = if (bet0.guess == result) { bet0.player } else { bet1.player };

        let total_value = value(&game.val);
        let win_balance = split(&mut game.val, total_value);
        let win_coin = from_balance<A1LINLIN1_FAUCET_COIN>(win_balance, ctx);
        public_transfer(win_coin, winner_address);

        vector::pop_back(&mut game.bets);
        vector::pop_back(&mut game.bets);
    }

    public entry fun withdraw(game: &mut Game, amount: u64, ctx: &mut TxContext) {
        assert!(tx_context::sender(ctx) == game.admin, 1001);
        assert!(value(&game.val) >= amount, 1004);
        let admin_balance = split(&mut game.val, amount);
        let admin_coin = from_balance<A1LINLIN1_FAUCET_COIN>(admin_balance, ctx);
        public_transfer(admin_coin, game.admin);
    }
}