module game::game;

use faucet_coin::faucet_coin::FAUCET_COIN;
use sui::balance::{Self, Balance};
use sui::coin::{Self, Coin};
use sui::event;
use sui::random::{Self, Random};

const EDEPOSITNOTENOUGH: u64 = 0x01; // deposit coin not enough
const EWITHDRAWNOTENOUGH: u64 = 0x02; // withdraw coin not enough
const EPLAYCOINNOTENOUGH: u64 = 0x03; // play coin not enough
const EGAMECOINNOTENOUGH: u64 = 0x04; // game coin not enough

public struct Game has key {
    id: UID,
    balance: Balance<FAUCET_COIN>,
}

public struct AdminCap has key {
    id: UID,
}

public struct PlayEvent has copy, drop {
    input: bool,
    rand: bool,
    bet_amount: u64,
}

fun init(ctx: &mut TxContext) {
    let game = Game {
        id: object::new(ctx),
        balance: balance::zero(),
    };
    transfer::share_object(game);

    let admin = AdminCap {
        id: object::new(ctx),
    };
    transfer::transfer(admin, ctx.sender());
}

entry fun play(
    game: &mut Game,
    rand: &Random,
    in: bool,
    in_coin: &mut Coin<FAUCET_COIN>,
    in_amount: u64,
    ctx: &mut TxContext,
) {
    let in_value = in_coin.value();
    assert!(in_value >= in_amount, EPLAYCOINNOTENOUGH);
    let game_value = game.balance.value();
    assert!(game_value >= in_amount, EGAMECOINNOTENOUGH);

    let mut gen = random::new_generator(rand, ctx);
    let flip_value = random::generate_bool(&mut gen);

    if (in == flip_value) {
        // win
        let reward_balance = game.balance.split(in_amount);
        let reward_coin = coin::from_balance(reward_balance, ctx);
        // transfer::public_transfer(reward_coin, ctx.sender());
        in_coin.join(reward_coin);
    } else {
        // lose
        let play_coin = in_coin.split(in_amount, ctx);
        let play_balance = coin::into_balance(play_coin);
        game.balance.join(play_balance);
    };
    event::emit(PlayEvent {
        input: in,
        rand: flip_value,
        bet_amount: in_amount,
    });
}

entry fun deposit(
    _: &AdminCap,
    game: &mut Game,
    in_coin: &mut Coin<FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let coin_value = in_coin.value();
    assert!(coin_value >= amount, EDEPOSITNOTENOUGH);
    let depoist_coin = in_coin.split(amount, ctx);
    let deposit_balance = coin::into_balance(depoist_coin);
    game.balance.join(deposit_balance);
}

entry fun withdraw(_: &AdminCap, game: &mut Game, amount: u64, ctx: &mut TxContext) {
    let game_value = game.balance.value();
    assert!(game_value >= amount, EWITHDRAWNOTENOUGH);
    let out_balance = game.balance.split(amount);
    let out_coin = coin::from_balance(out_balance, ctx);
    transfer::public_transfer(out_coin, ctx.sender());
}
