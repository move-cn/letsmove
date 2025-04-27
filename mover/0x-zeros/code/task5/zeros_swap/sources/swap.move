module zeros_swap::swap;

use zeros_swap::global::{Self, Global, exist_pool};
use zeros_swap::pool::{Self, Pool, LPCoin};
use sui::coin::{Self, Coin};
use sui::pay;
use sui::transfer;
use sui::tx_context::{Self, TxContext};

const EHaveSlippage: u64 = 1;
const EPoolExist: u64 = 2;

/// create pool
public entry fun create_pool<X, Y>(global: &mut Global, lp_fee: u64, ctx: &mut TxContext) {
    assert!(!exist_pool<X, Y>(global) || !exist_pool<Y, X>(global), EPoolExist);
    let id = pool::create_pool<X, Y>(lp_fee, ctx);
    global::add_pool_flag<X, Y>(global, id);
}


/// add liquidity
public entry fun add_liquidity<X, Y>(
    pool: &mut Pool<X, Y>,
    coin_x: vector<Coin<X>>,
    coin_y: vector<Coin<Y>>,
    coin_x_amount: u64,
    coin_x_min: u64,
    coin_y_amount: u64,
    coin_y_min: u64,
    ctx: &mut TxContext) {
    let mut coin_x_in = coin::zero<X>(ctx);
    pay::join_vec(&mut coin_x_in, coin_x);

    let mut coin_y_in = coin::zero<Y>(ctx);
    pay::join_vec(&mut coin_y_in, coin_y);

    let (lp_coin, rest_x, rest_y) = pool::add_liquidity(pool,
        coin_x_in,
        coin_y_in,
        coin_x_amount,
        coin_x_min,
        coin_y_amount,
        coin_y_min,
        ctx);

    transfer::public_transfer(lp_coin, tx_context::sender(ctx));
    transfer::public_transfer(rest_x, tx_context::sender(ctx));
    transfer::public_transfer(rest_y, tx_context::sender(ctx));
}

/// remove liquidit
public entry fun remove_liquidity<X, Y>(
    pool: &mut Pool<X, Y>,
    lp: vector<Coin<LPCoin<X, Y>>>,
    lp_amount: u64,
    min_x: u64,
    min_y: u64,
    ctx: &mut TxContext)
{
    let mut lp_in = coin::zero<LPCoin<X, Y>>(ctx);
    pay::join_vec(&mut lp_in, lp);

    let lp_real = coin::split(&mut lp_in, lp_amount, ctx);

    let (coin_c, coin_y, x_removed, y_removed) = pool::remove_liquidity(pool, lp_real, min_x, min_y, ctx);

    assert!(x_removed >= min_x && y_removed >= min_y, EHaveSlippage);
    let sender = tx_context::sender(ctx);
    transfer::public_transfer(lp_in, sender);
    transfer::public_transfer(coin_c, sender);
    transfer::public_transfer(coin_y, sender);
}


/// swap x => y
public entry fun swap_x_to_y<CoinIn, CoinOut>(pool: &mut Pool<CoinIn, CoinOut>, in: vector<Coin<CoinIn>>, in_amount: u64, min_out: u64, ctx: &mut TxContext) {
    let mut in_coin = coin::zero<CoinIn>(ctx);
    pay::join_vec(&mut in_coin, in);

    let real = coin::split(&mut in_coin, in_amount, ctx);

    let (out, out_amount) = pool::swap_x_to_y(pool, real, min_out, ctx);
    assert!(out_amount >= min_out, EHaveSlippage);

    let sender = tx_context::sender(ctx);
    transfer::public_transfer(in_coin, sender);
    transfer::public_transfer(out, sender);
}


/// swap y => x
public entry fun swap_y_to_x<CoinIn, CoinOut>(pool: &mut Pool<CoinOut, CoinIn>, in: vector<Coin<CoinIn>>, in_amount: u64, min_out: u64, ctx: &mut TxContext) {
    let mut in_coin = coin::zero<CoinIn>(ctx);
    pay::join_vec(&mut in_coin, in);
    let real = coin::split(&mut in_coin, in_amount, ctx);
    let (out, out_amount) = pool::swap_y_to_x(pool, real, min_out, ctx);

    assert!(out_amount >= min_out, EHaveSlippage);

    let sender = tx_context::sender(ctx);
    transfer::public_transfer(in_coin, sender);
    transfer::public_transfer(out, sender);
}
