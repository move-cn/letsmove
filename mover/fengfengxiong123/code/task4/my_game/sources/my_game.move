/*
/// Module: my_game
module my_game::my_game;
*/
module my_game::my_game;
use sui::balance;
use std::string::String;
use sui::coin::{Self, Coin};
use sui::object;
use sui::random;
use sui::random::Random;
use sui::transfer;
use sui::sui::SUI;


public struct Game has key {
    id: UID,
    name: String,
    amt: balance::Balance<SUI>
}

fun init(ctx: &mut TxContext) {
    transfer::share_object(
        Game { id: object::new(ctx), name: b"fengfengxiong123".to_string(), amt: balance::zero<SUI>() }
    );
}

entry fun play(b: bool, int_amt: Coin<SUI>, game: &mut Game, rand: &Random, ctx: &mut TxContext) {
    let mut gen = random::new_generator(rand, ctx);
    let rand_val: bool = random::generate_bool(&mut gen);

    assert!(int_amt.value() < game.amt.value() / 10, 0x11);
    if (b == rand_val) {
        let out_amt_balance = game.amt.split(int_amt.value());
        let out_coin: Coin<SUI> = coin::from_balance(out_amt_balance, ctx);
        transfer::public_transfer(int_amt, ctx.sender());
        transfer::public_transfer(out_coin, ctx.sender());
    }else {
        let in_amt_balance = coin::into_balance(int_amt);
        game.amt.join(in_amt_balance);
    }
}

public entry fun add(game: &mut Game, in_amt: Coin<SUI>) {
    game.amt.join(coin::into_balance(in_amt));
}

public entry fun remove(game: &mut Game, out_amt:u64, ctx: &mut TxContext) {
    let out_balance = game.amt.split(out_amt);
    let out_coin = coin::from_balance(out_balance, ctx);
    transfer::public_transfer(out_coin, ctx.sender())
}
