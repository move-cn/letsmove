/// Module: game
module game::game;

use sui::balance::Balance;
use sui::balance;
use sui::random;
use sui::coin::{Coin, from_balance, into_balance};
use faucet_coin::faucetcoin::FAUCETCOIN;
use std::string::String;

public struct Game has key {
    id: UID,
    balance: Balance<FAUCETCOIN>,
    name: String,
    reward_rate: u64,
}

public struct GameCap has key {
    id: UID,
}

fun init(ctx: &mut TxContext) {
    let game = Game {
        id: object::new(ctx),
        balance: balance::zero(),
        name: b"zerokk246's Game".to_string(),
        reward_rate: 1,
    };

    let cap = GameCap {
        id: object::new(ctx),
    };

    transfer::share_object(game);
    transfer::transfer(cap, ctx.sender());
}

#[allow(lint(public_random))]
public entry fun play(game: &mut Game, flip_value: bool, in: Coin<FAUCETCOIN>,
                      rand: &random::Random, ctx: &mut TxContext) {
    let in_balance_v = in.value();
    assert!(in_balance_v > 0 && game.balance.value() >= in_balance_v * game.reward_rate, 100);

    let mut gen = random::new_generator(rand, ctx);
    let b = gen.generate_bool();
    if (b == flip_value) {
        let reward = in_balance_v * game.reward_rate;
        let b = game.balance.split(reward);
        let coin = from_balance<FAUCETCOIN>(b, ctx);
        transfer::public_transfer(coin, ctx.sender());
        transfer::public_transfer(in, ctx.sender());
    } else {
        game.balance.join(into_balance(in));
    }
}

public entry fun add_sui(game: &mut Game, in: Coin<FAUCETCOIN>, _ctx: &mut TxContext) {
    game.balance.join(into_balance(in));
}

public entry fun withdraw(_: &GameCap, game: &mut Game, amount: u64, ctx: &mut TxContext) {
    let b = game.balance.split(amount);
    let coin = from_balance<FAUCETCOIN>(b, ctx);
    transfer::public_transfer(coin, ctx.sender())
}

#[test_only]
public fun test_init(ctx: &mut TxContext) {
    init(ctx);
}

#[test_only]
public fun balance(game: &Game): u64 {
    game.balance.value()
}