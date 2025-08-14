module blazeleon_swap::blazeleon_swap;

use sui::coin::{Self, Coin};
use sui::tx_context::{sender};
use sui::balance::{Balance, zero};
use sui::transfer::{transfer, public_transfer, share_object};
use sui::event;
use std::string::{String};



const ENotEnough: u64 = 10000;

public struct Pool<phantom X, phantom Y> has key {
    id: UID,
    x: Balance<X>,
    y: Balance<Y>,
}

public struct AdminCap has key {
    id: UID,
}

public struct DepositEvent has copy, drop {
    deposit_from: address,
    deposit_amt: u64,
}

public struct WithdrawEvent has copy, drop {
    withdraw_to: address,
    withdraw_amt: u64,
}

public struct SwapEvent has copy, drop {
    user: address,
    swap_pair: String,
    swap_in_amt: u64,
    swap_out_amt: u64,
}

fun init(ctx: &mut TxContext) {
    let adminCap = AdminCap {
        id: object::new(ctx),
    };
    transfer(adminCap, sender(ctx));
}


// 向池子中存钱
fun deposit_into_pool<T>(pool_balance: &mut Balance<T>, in_coin: Coin<T>,  user: address) {
    let deposit_event = DepositEvent {
        deposit_from: user,
        deposit_amt: coin::value(&in_coin),
    };
    event::emit(deposit_event);
    let in_balance = coin::into_balance(in_coin);
    pool_balance.join(in_balance);
}

// 从池子中取钱
fun take_coin_from_pool<T>(pool_balance: &mut Balance<T>, amount: u64, ctx: &mut TxContext) :Coin<T> {
    // let pool_total_amt = balance::value(pool_balance);
    // assert!(pool_total_amt > amount, 0x1);
    // let out_balance = balance::split(pool_balance, amount);
    // coin::from_balance(out_balance, ctx)
    let withdraw_event = WithdrawEvent {
        withdraw_to: sender(ctx),
        withdraw_amt: amount,
    };
    event::emit(withdraw_event);
    coin::take(pool_balance, amount, ctx)
}

//创建一个新的池子
public entry fun create_pool<X, Y>(ctx: &mut TxContext) {
    let pool = Pool<X, Y> {
        id: object::new(ctx),
        x: zero<X>(),
        y: zero<Y>(),
    };
    share_object(pool);
}

// 存入x币
public entry fun deposit_x<X, Y>(pool: &mut Pool<X, Y>, x_in: &mut Coin<X>, amount: u64, ctx: &mut TxContext) {
    let new_coin = coin::split(x_in, amount, ctx);
    deposit_into_pool(&mut pool.x,  new_coin, sender(ctx));
}

// 存入y币
public entry fun deposit_y<X, Y>(pool: &mut Pool<X, Y>, y_in: &mut Coin<Y>, amount: u64, ctx: &mut TxContext) {
    let new_coin = coin::split(y_in, amount, ctx);
    deposit_into_pool(&mut pool.y,  new_coin, sender(ctx));
}

// 从池子中取出x币，验证权限
public entry fun withdraw_x<X, Y>(_:&AdminCap, pool: &mut Pool<X, Y>, amount: u64, ctx: &mut TxContext) {
    let out_coin = take_coin_from_pool(&mut pool.x, amount, ctx);
    public_transfer(out_coin, sender(ctx));
}

// 从池子中取出y币，验证权限
public entry fun withdraw_y<X, Y>(_:&AdminCap, pool: &mut Pool<X, Y>, amount: u64, ctx: &mut TxContext) {
    let out_coin = take_coin_from_pool(&mut pool.y, amount, ctx);
    public_transfer(out_coin, sender(ctx));
}

// 交换x币到y币，并发送 swap 事件
public entry fun swap_x_to_y<X, Y>(pool: &mut Pool<X, Y>, x_in: &mut Coin<X>, in_amt :u64, ctx: &mut TxContext) {
    let in_total = coin::value(x_in);
    assert!(in_total >= in_amt, ENotEnough);
    let in_coin = coin::split(x_in, in_amt, ctx);
    let out_amt = in_amt * 72 / 10;
    let swap_event = SwapEvent {
        user: sender(ctx),
        swap_pair: b"x -> y".to_string(), 
        swap_in_amt: in_amt,
        swap_out_amt: out_amt,
    };
    event::emit(swap_event);
    deposit_into_pool(&mut pool.x, in_coin, sender(ctx));
    let out_coin = take_coin_from_pool(&mut pool.y, out_amt, ctx);
    public_transfer(out_coin, sender(ctx));
}

// 交换y币到x币，并发送 swap 事件
public entry fun swap_y_to_x<X, Y>(pool: &mut Pool<X, Y>, y_in: &mut Coin<Y>, in_amt :u64, ctx: &mut TxContext) {
    let in_total = coin::value(y_in);
    assert!(in_total >= in_amt, ENotEnough);
    let in_coin = coin::split(y_in, in_amt, ctx);
    let out_amt = in_amt * 10 / 72;
    let swap_event = SwapEvent {
        user: sender(ctx),
        swap_pair: b"y -> x".to_string(),
        swap_in_amt: in_amt,
        swap_out_amt: out_amt,
    };
    event::emit(swap_event);
    deposit_into_pool(&mut pool.y, in_coin, sender(ctx));
    let coin_x = take_coin_from_pool(&mut pool.x, out_amt, ctx);
    public_transfer(coin_x, sender(ctx));
}