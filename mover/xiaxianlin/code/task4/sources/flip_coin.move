module task4::flip_coin;

use sui::balance::{Self, Balance};
use sui::coin::{Self, Coin};
use sui::random::{Self, Random};
use task2::faucet_coin::FAUCET_COIN;

public struct Game has key {
    id: UID,
    balance: Balance<FAUCET_COIN>,
}

public struct AdminCap has key {
    id: UID,
}

fun init(ctx: &mut TxContext) {
    let game = Game { id: object::new(ctx), balance: balance::zero() };
    transfer::share_object(game);

    let admin = AdminCap { id: object::new(ctx) };
    transfer::transfer(admin, ctx.sender());
}

entry fun play(
    game: &mut Game,
    rand: &Random,
    guess: bool,
    in_coin: Coin<FAUCET_COIN>,
    ctx: &mut TxContext,
) {
    let game_balance_value = game.balance.value();
    let player_balance_value = in_coin.value();
    assert!(game_balance_value >= player_balance_value * 10, 1);

    let flip_value = random::generate_bool(&mut rand.new_generator(ctx));

    if (guess == flip_value) {
        let out_balance = game.balance.split(player_balance_value);
        let out_coin = coin::from_balance(out_balance, ctx);
        transfer::public_transfer(out_coin, ctx.sender());
        transfer::public_transfer(in_coin, ctx.sender());
    } else {
        let in_amount_balance = coin::into_balance(in_coin);
        game.balance.join(in_amount_balance);
    }
}

public entry fun deposit(game: &mut Game, in_coin: Coin<FAUCET_COIN>, _: &mut TxContext) {
    let in_balance = in_coin.into_balance();
    game.balance.join(in_balance);
}

public entry fun withdraw(_: &AdminCap, game: &mut Game, amount: u64, ctx: &mut TxContext) {
    let out_balance = game.balance.split(amount);
    let out_coin = coin::from_balance(out_balance, ctx);
    transfer::public_transfer(out_coin, ctx.sender())
}
