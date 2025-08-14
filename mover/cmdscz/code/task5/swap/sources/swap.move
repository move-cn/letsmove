module swap::swap;

use cmdscz_coin::cmdscz_coin::CMDSCZ_COIN;
use cmdscz_faucet_coin::cmdscz_faucet_coin::CMDSCZ_FAUCET_COIN;
use sui::balance::{Self, Balance};
use sui::coin::{Self, Coin};

const EInputNotEnough: u64 = 0;
const EPoolNotEnough: u64 = 1;

public struct AdminCap has key { id: UID }

public struct Pool has key {
    id: UID,
    cmdscz_coin: Balance<CMDSCZ_COIN>,  // 代币A - CMDSCZ_COIN
    cmdscz_faucet_coin: Balance<CMDSCZ_FAUCET_COIN>,  // 代币B - CMDSCZ_FAUCET_COIN
}

fun init(ctx: &mut TxContext) {
    let pool = Pool {
        id: object::new(ctx),
        cmdscz_coin: balance::zero<CMDSCZ_COIN>(),  // 初始化为0
        cmdscz_faucet_coin: balance::zero<CMDSCZ_FAUCET_COIN>(),  // 初始化为0
    };
    transfer::share_object(pool);  // pool需要公开，通过AdminCap给予自己额外的管理员权限
    transfer::transfer(AdminCap { id: object::new(ctx) }, tx_context::sender(ctx));
}

// 存入CMDSCZ_COIN
public entry fun deposit_cmdscz_coin(
    pool: &mut Pool,
    input: Coin<CMDSCZ_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let caller = tx_context::sender(ctx);
    let input_value = coin::value(&input);
    assert!(input_value >= amount, EInputNotEnough);
    let mut input_balance = coin::into_balance(input);
    if (input_value > amount) {
        balance::join(
            &mut pool.cmdscz_coin,
            balance::split(&mut input_balance, amount),
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.cmdscz_coin, input_balance);
    };
}

// 存入CMDSCZ_FAUCET_COIN
public entry fun deposit_cmdscz_faucet_coin(
    pool: &mut Pool,
    input: Coin<CMDSCZ_FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let caller = tx_context::sender(ctx);
    let input_value = coin::value(&input);
    assert!(input_value >= amount, EInputNotEnough);
    let mut input_balance = coin::into_balance(input);
    if (input_value > amount) {
        balance::join(
            &mut pool.cmdscz_faucet_coin,
            balance::split(&mut input_balance, amount),
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.cmdscz_faucet_coin, input_balance);
    };
}

// 只有管理员才能提取 CMDSCZ_COIN
public entry fun withdraw_cmdscz_coin(
    _: &AdminCap,
    pool: &mut Pool,
    amount: u64,
    ctx: &mut TxContext,
) {
    let cmdscz_coin_balance = balance::split(&mut pool.cmdscz_coin, amount);
    let cmdscz_coin = coin::from_balance(cmdscz_coin_balance, ctx);
    transfer::public_transfer(cmdscz_coin, tx_context::sender(ctx));
}

// 只有管理员才能提取 CMDSCZ_FAUCET_COIN
public entry fun withdraw_cmdscz_faucet_coin(
    _: &AdminCap,
    pool: &mut Pool,
    amount: u64,
    ctx: &mut TxContext,
) {
    let cmdscz_faucet_coin_balance = balance::split(&mut pool.cmdscz_faucet_coin, amount);
    let cmdscz_faucet_coin = coin::from_balance(cmdscz_faucet_coin_balance, ctx);
    transfer::public_transfer(cmdscz_faucet_coin, tx_context::sender(ctx));
}

// 交换 CMDSCZ_FAUCET_COIN 到 CMDSCZ_COIN
public entry fun swap_cmdscz_faucet_coin_to_cmdscz_coin(
    pool: &mut Pool,
    input: Coin<CMDSCZ_FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let caller = tx_context::sender(ctx);
    let input_value = coin::value(&input);
    let output_value = amount * 1000 / 2000;  // 根据比例计算输出
    assert!(input_value >= amount, EInputNotEnough);
    let mut input_balance = coin::into_balance(input);
    assert!(balance::value(&pool.cmdscz_coin) >= output_value, EPoolNotEnough);
    // 如果输入金额多于指定金额，退还多余部分
    if (input_value > amount) {
        balance::join(
            &mut pool.cmdscz_faucet_coin,
            balance::split(&mut input_balance, amount),
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.cmdscz_faucet_coin, input_balance);
    };
    let output_balance = balance::split(&mut pool.cmdscz_coin, output_value);
    let output = coin::from_balance(output_balance, ctx);
    transfer::public_transfer(output, caller);
}

// 交换 CMDSCZ_COIN 到 CMDSCZ_FAUCET_COIN
public entry fun swap_cmdscz_coin_to_cmdscz_faucet_coin(
    pool: &mut Pool,
    input: Coin<CMDSCZ_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let caller = tx_context::sender(ctx);
    let input_value = coin::value(&input);
    let output_value = amount * 2000 / 1000;  // 根据比例计算输出
    assert!(input_value >= amount, EInputNotEnough);
    let mut input_balance = coin::into_balance(input);
    assert!(balance::value(&pool.cmdscz_faucet_coin) >= output_value, EPoolNotEnough);
    if (input_value > amount) {
        balance::join(
            &mut pool.cmdscz_coin,
            balance::split(&mut input_balance, amount),
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.cmdscz_coin, input_balance);
    };
    let output_balance = balance::split(&mut pool.cmdscz_faucet_coin, output_value);
    let output = coin::from_balance(output_balance, ctx);
    transfer::public_transfer(output, caller);
}
