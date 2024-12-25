/*
/// Module: m2887_swap
module m2887_swap::m2887_swap;
*/

module m2887_swap::m2887_swap;

use m2887_faucet_coin::m2887_faucet_coin::M2887_FAUCET_COIN;
use m2887_coin::m2887_coin::M2887_COIN;
use sui::balance::{Self, Balance};
use sui::coin::{Self, Coin};

const EInputNotEnough: u64 = 0;
const EPoolNotEnough: u64 = 1;

public struct AdminCap has key { id: UID }

public struct Pool has key {
    // 如果需要，可以加上两种代币分别的存量属性，这里先不添加
    id: UID,
    faucet_coin: Balance<M2887_FAUCET_COIN>,
    //faucet_coin_balance: u64,
    my_coin: Balance<M2887_COIN>,
    //faucet_coin_balance: u64,
}

fun init(ctx: &mut TxContext) {
    let pool = Pool {
        id: object::new(ctx),
        faucet_coin: balance::zero<M2887_FAUCET_COIN>(),
        my_coin: balance::zero<M2887_COIN>(),
    };
    transfer::share_object(pool); // pool需要公开，通过AdminCap给予自己额外的管理员权限
    transfer::transfer(AdminCap { id: object::new(ctx) }, tx_context::sender(ctx));
}

public entry fun deposit_my_coin(
    pool: &mut Pool,
    input: Coin<M2887_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let caller = tx_context::sender(ctx);
    let input_value = coin::value(&input);
    assert!(input_value >= amount, EInputNotEnough);
    let mut input_balance = coin::into_balance(input);
    if (input_value > amount) {
        balance::join(
            &mut pool.my_coin,
            balance::split(&mut input_balance, amount),
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.my_coin, input_balance);
    };
}

public entry fun deposit__faucet_coin(
    pool: &mut Pool,
    input: Coin<M2887_FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let caller = tx_context::sender(ctx);
    let input_value = coin::value(&input);
    assert!(input_value >= amount, EInputNotEnough);
    let mut input_balance = coin::into_balance(input);
    if (input_value > amount) {
        balance::join(
            &mut pool.faucet_coin,
            balance::split(&mut input_balance, amount),
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.faucet_coin, input_balance);
    };
}

// 我们可以编写一个withdraw函数，并限制只有拥有管理员权限才能提取资金
public entry fun withdraw_zzf222_coin(
    _: &AdminCap,
    pool: &mut Pool,
    amount: u64,
    ctx: &mut TxContext,
) {
    let my_coin_balance = balance::split(&mut pool.my_coin, amount);
    let my_coin = coin::from_balance(my_coin_balance, ctx);
    transfer::public_transfer(my_coin, tx_context::sender(ctx));
}

public entry fun withdraw_zzf222_faucet_coin(
    _: &AdminCap,
    pool: &mut Pool,
    amount: u64,
    ctx: &mut TxContext,
) {
    let faucet_coin_balance = balance::split(&mut pool.faucet_coin, amount);
    let faucet_coin = coin::from_balance(faucet_coin_balance, ctx);
    transfer::public_transfer(faucet_coin, tx_context::sender(ctx));
}

// 在swap函数中，我们可以沿用部分上一节guess_game的代码
public entry fun swap_faucet_coin_to_my_coin(
    pool: &mut Pool,
    input: Coin<M2887_FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {


    let caller = tx_context::sender(ctx);
    // get the input value and assert
    let input_value = coin::value(&input);
    let output_value = amount * 1000 / 2000; // amount千万不要写成input_value!
    assert!(input_value >= amount, EInputNotEnough);
    // transection the input value to Balance
    let mut input_balance = coin::into_balance(input); 
    assert!(balance::value(&pool.my_coin) >= output_value, EPoolNotEnough);
    // if input value much than amount, change the excess
    if (input_value > amount) {
        balance::join(
            // join 函数用于接收代币
            &mut pool.faucet_coin,
            balance::split(&mut input_balance, amount), 
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.faucet_coin, input_balance);
    };
    let output_balance = balance::split(&mut pool.my_coin, output_value);
    let output = coin::from_balance(output_balance, ctx);
    transfer::public_transfer(output, caller);
}

public entry fun swap_my_coin_to_faucet_coin(
    pool: &mut Pool,
    input: Coin<M2887_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let caller = tx_context::sender(ctx);
    let input_value = coin::value(&input);
    let output_value = amount * 2000 / 1000;
    assert!(input_value >= amount, EInputNotEnough);
    let mut input_balance = coin::into_balance(input);
    assert!(balance::value(&pool.faucet_coin) >= output_value, EPoolNotEnough);
    if (input_value > amount) {
        balance::join(
            &mut pool.my_coin,
            balance::split(&mut input_balance, amount),
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.my_coin, input_balance);
    };
    let output_balance = balance::split(&mut pool.faucet_coin, output_value);
    let output = coin::from_balance(output_balance, ctx);
    transfer::public_transfer(output, caller);
}

