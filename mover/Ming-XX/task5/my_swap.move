module ming_xx::my_swap;

use my_coin::ming_xx_coin::MING_XX_COIN;
use my_coin::ming_xx_faucet_coin::MING_XX_FAUCET_COIN;

use sui::balance::{Self, Balance, split};
use sui::coin::{Coin, into_balance, from_balance};
use sui::transfer::{share_object, transfer, public_transfer};

const EExceedBalance: u64 = 0x0;

public struct Pool has key {
    id: UID,
    my_coin_balance: Balance<MING_XX_COIN>,
    faucet_coin_balance: Balance<MING_XX_FAUCET_COIN>,
}

public struct AdminCap has key {
    id: UID,
}

fun init(ctx: &mut TxContext) {
    let admin_cap = AdminCap {
        id: object::new(ctx),
    };
    let pool = Pool {
        id: object::new(ctx),
        my_coin_balance: balance::zero<MING_XX_COIN>(),
        faucet_coin_balance: balance::zero<MING_XX_FAUCET_COIN>(),
    };

    transfer(admin_cap, ctx.sender());
    share_object(pool);
}

public entry fun deposit_my_coin(pool: &mut Pool, coins: Coin<MING_XX_COIN>, _ctx: &mut TxContext) {
    balance::join(&mut pool.my_coin_balance, into_balance(coins));
}

public entry fun deposit_faucet_coin(pool: &mut Pool, coins: Coin<MING_XX_FAUCET_COIN>, _ctx: &mut TxContext) {
    balance::join(&mut pool.faucet_coin_balance, into_balance(coins));
}


fun withdraw_my_coin(pool: &mut Pool, amount: u64, receiver: address, ctx: &mut TxContext) {
    let coins = from_balance(split(&mut pool.my_coin_balance, amount), ctx);
    public_transfer(coins, receiver);
}

fun withdraw_faucet_coin(pool: &mut Pool, amount: u64, receiver: address, ctx: &mut TxContext) {
    let coins = from_balance(split(&mut pool.faucet_coin_balance, amount), ctx);
    public_transfer(coins, receiver);
}

public entry fun swap_my_coin(pool: &mut Pool, coins: Coin<MING_XX_FAUCET_COIN>, ctx: &mut TxContext) {
    let swap_address = ctx.sender();
    let swap_value = coins.value() / 10;
    assert!(swap_value <= pool.my_coin_balance.value(), EExceedBalance);
    deposit_faucet_coin(pool, coins, ctx);
    withdraw_my_coin(pool, swap_value, swap_address, ctx);
}


public entry fun swap_faucet_coin(pool: &mut Pool, coins: Coin<MING_XX_COIN>, ctx: &mut TxContext) {
    let swap_address = ctx.sender();
    let swap_value = coins.value() * 10;
    assert!(swap_value <= pool.faucet_coin_balance.value(), EExceedBalance);
    deposit_my_coin(pool, coins, ctx);
    withdraw_faucet_coin(pool, swap_value, swap_address, ctx);
}

