module game::flip_coin;

use sui::balance::{Self, Balance};
use sui::coin::{Self, Coin};
use sui::transfer::{transfer, share_object, public_transfer};
use sui::random::{Self, new_generator, Random};
use std::string::String;

use my_coin::meme::MEME;

public struct Game has key {
    id: UID,
    balance: Balance<MEME>,
    desc: String,
}

public struct AdminCap has key {
    id: UID,
}

const ETooMuchMoney: u64 = 0;
const ENotEnoughBalance: u64 = 1;

fun init(ctx: &mut TxContext) {
    let game = Game {
        id: object::new(ctx),
        balance: balance::zero(),
        desc: b"sahab328's flip coin game".to_string(),
    };

    share_object(game);

    let cap = AdminCap {
        id: object::new(ctx), 
    };
    transfer(cap, ctx.sender());
}

entry fun play(game: &mut Game, rand: &Random, guess: bool, in_coin: Coin<MEME>, ctx: &mut TxContext) {
    let in_value = in_coin.value();
    let game_value = game.balance.value();
    // 最多玩池子的1/10
    assert!(game_value >= in_value * 10, ETooMuchMoney);

    let mut rand_gen = new_generator(rand, ctx);
    let result: bool = random::generate_bool(&mut rand_gen);
    
    if (guess == result) { // win
        let out_coin = coin::from_balance(game.balance.split(in_value), ctx);
        public_transfer(out_coin, ctx.sender());
        public_transfer(in_coin, ctx.sender());
    } else { // loss
        game.balance.join(coin::into_balance(in_coin));
    }
}

public entry fun add_balance(game: &mut Game, in_coin: Coin<MEME>, _ctx: &mut TxContext) {
    game.balance.join(coin::into_balance(in_coin));
}

public entry fun remove_balance(_:&AdminCap, game: &mut Game, out_value: u64, ctx: &mut TxContext) {
    let game_value = game.balance.value();
    assert!(game_value >= out_value, ENotEnoughBalance);
    let out_coin = coin::from_balance(game.balance.split(out_value), ctx);
    public_transfer(out_coin, ctx.sender());
}
