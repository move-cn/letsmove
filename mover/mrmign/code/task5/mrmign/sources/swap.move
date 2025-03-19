module mrmign::swap;

use faucet_coin::faucet_coin::FAUCET_COIN;
use my_coin::qqb::QQB;
use std::string::String;
use sui::balance::{Self, Balance};
use sui::coin::{Self, Coin};
use sui::event;

const SWAP_INPUT_COIN_INVALID: u64 = 0x11;
const SWAP_COIN_NOT_ENOUGH: u64 = 0x12;

const POWER: u64 = 100_000_000;

public struct Pool has key {
    id: UID,
    coin_a: Balance<QQB>,
    coin_b: Balance<FAUCET_COIN>,
}

public struct AdminCap has key {
    id: UID,
}

public struct SwapEvent has copy, drop {
    swapper: address,
    in_amount: u64,
    out_amount: u64,
    in_coin_type: String,
    out_coin_type: String,
    time: u64,
}

fun init(ctx: &mut TxContext) {
    let pool = Pool {
        id: object::new(ctx),
        coin_a: balance::zero<QQB>(),
        coin_b: balance::zero<FAUCET_COIN>(),
    };
    transfer::share_object(pool);

    let adminCap = AdminCap {
        id: object::new(ctx),
    };
    transfer::transfer(adminCap, ctx.sender());
}

public entry fun add_liquidity(
    _: &AdminCap,
    pool: &mut Pool,
    coin_a: Coin<QQB>,
    coin_b: Coin<FAUCET_COIN>,
    _: &mut TxContext,
) {
    let a_amount = coin_a.value();
    let b_amount = coin_b.value();
    assert!(a_amount > 0 && b_amount > 0, SWAP_INPUT_COIN_INVALID);
    balance::join(&mut pool.coin_a, coin_a.into_balance());
    balance::join(&mut pool.coin_b, coin_b.into_balance());
}

/// 恒定乘积做市商（Constant Product Market Maker, CPMM）模型
/// 交换输入输出计算公式：x * y = k
/// x: 输入币种数量
/// y: 输出币种数量
/// k: 恒定乘积
public entry fun swap_a_to_b(pool: &mut Pool, coin_a: Coin<QQB>, ctx: &mut TxContext) {
    let a_amount = coin_a.value();
    assert!(a_amount > 0, SWAP_INPUT_COIN_INVALID);
    let pool_a_amount = pool.coin_a.value();
    assert!(pool_a_amount > 0, SWAP_COIN_NOT_ENOUGH);
    let pool_b_amount = pool.coin_b.value();
    assert!(pool_b_amount > 0, SWAP_COIN_NOT_ENOUGH);
    let b = (a_amount / POWER * pool_b_amount)/((pool_a_amount + a_amount)/POWER);
    assert!(pool_b_amount > b, SWAP_COIN_NOT_ENOUGH);
    balance::join(&mut pool.coin_a, coin_a.into_balance());
    let coin_b_out = coin::take(&mut pool.coin_b, b, ctx);
    transfer::public_transfer(coin_b_out, ctx.sender());

    let event = SwapEvent {
        swapper: ctx.sender(),
        in_amount: a_amount,
        out_amount: b,
        in_coin_type: b"QQB".to_string(),
        out_coin_type: b"FAUCET_COIN".to_string(),
        time: ctx.epoch_timestamp_ms(),
    };
    event::emit(event);
}

public entry fun swap_b_to_a(pool: &mut Pool, coin_b: Coin<FAUCET_COIN>, ctx: &mut TxContext) {
    let b_amount = coin_b.value();
    assert!(b_amount > 0, SWAP_INPUT_COIN_INVALID);
    let pool_a_amount = pool.coin_a.value();
    assert!(pool_a_amount > 0, SWAP_COIN_NOT_ENOUGH);
    let pool_b_amount = pool.coin_b.value();
    assert!(pool_b_amount > 0, SWAP_COIN_NOT_ENOUGH);
    let a = (b_amount / POWER * pool_a_amount)/((pool_b_amount + b_amount)/POWER);
    assert!(pool_a_amount > a, SWAP_COIN_NOT_ENOUGH);
    balance::join(&mut pool.coin_b, coin_b.into_balance());
    let coin_a_out = coin::take(&mut pool.coin_a, a, ctx);
    transfer::public_transfer(coin_a_out, ctx.sender());

    let event = SwapEvent {
        swapper: ctx.sender(),
        in_amount: b_amount,
        out_amount: a,
        in_coin_type: b"FAUCET_COIN".to_string(),
        out_coin_type: b"QQB".to_string(),
        time: ctx.epoch_timestamp_ms(),
    };
    event::emit(event);
}

/// Bf57zoEuY4Fx1kNd5UCYZ4qSCoNxfLiFJkahvLgP2rcJ
/// package id: 0xa07aee6c9fcece8f36819ca102e2b4a1ad067aea1cfb0fe9c96a49e2333781b0
///
