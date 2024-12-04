module my_swap::my_swap;

use my_coin::huahuahua1223_coin::HUAHUAHUA1223_COIN;
use my_coin::huahuahua1223_faucet_coin::HUAHUAHUA1223_FAUCET_COIN;
use sui::balance::{Self, Balance};
use sui::coin::{Self, Coin, from_balance, into_balance};
use sui::transfer::{share_object, transfer, public_transfer};

const EInputNotEnough: u64 = 1000;
const EPoolNotEnough: u64 = 1001;

public struct AdminCap has key {
    id: UID
}

public struct Pool has key {
    id: UID,
    huahuahua1223_faucet_coin: Balance<HUAHUAHUA1223_FAUCET_COIN>,
    huahuahua1223_coin: Balance<HUAHUAHUA1223_COIN>,
}

fun init(ctx: &mut TxContext) {
    let pool = Pool {
        id: object::new(ctx),
        huahuahua1223_faucet_coin: balance::zero<HUAHUAHUA1223_FAUCET_COIN>(),
        huahuahua1223_coin: balance::zero<HUAHUAHUA1223_COIN>(),
    };

    let admin = AdminCap { id: object::new(ctx) };

    // 公开swap池
    share_object(pool);
    // 管理员权限给合约部署者
    transfer(admin, ctx.sender());
}

// 存储my_coin代币
public entry fun deposit_my_coin(
    pool: &mut Pool,
    user_coin: Coin<HUAHUAHUA1223_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    // 验证钱包代币是否比输入金额多
    let coin_value = user_coin.value();
    assert!(coin_value >= amount, EInputNotEnough);

    // 把Coin转换为Balance
    let mut input_balance = into_balance(user_coin);
    if (coin_value == amount) {
        // 输入的amount就是所有的代币
        balance::join(&mut pool.huahuahua1223_coin, input_balance);
    } else {
        balance::join(
            &mut pool.huahuahua1223_coin,
            balance::split(&mut input_balance, amount),
        );
        // 退回多余的代币
        let surplus_coin = from_balance(input_balance, ctx);
        public_transfer(surplus_coin, ctx.sender());
    };
}

// 存储水龙头代币
public entry fun deposit_faucet_coin(
    pool: &mut Pool,
    user_coin: Coin<HUAHUAHUA1223_FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    // 验证钱包代币是否比输入金额多
    let coin_value = user_coin.value();
    assert!(coin_value >= amount, EInputNotEnough);

    // 把Coin转换为Balance
    let mut input_balance = into_balance(user_coin);
    if (coin_value == amount) {
        // 输入的amount就是所有的代币
        balance::join(&mut pool.huahuahua1223_faucet_coin, input_balance);
    } else {
        balance::join(
            &mut pool.huahuahua1223_faucet_coin,
            balance::split(&mut input_balance, amount),
        );
        // 退回多余的代币
        let surplus_coin = from_balance(input_balance, ctx);
        public_transfer(surplus_coin, ctx.sender());
    };
}

// 管理员提取my_coin代币
public entry fun withdraw_coin(
    _: &AdminCap,
    pool: &mut Pool,
    amount: u64,
    ctx: &mut TxContext,
) {
    assert!(pool.huahuahua1223_coin.value() >= amount, EPoolNotEnough );

    // 用 from_balance 将balance转换为coin类型
    let withdrawn_balance = balance::split(&mut pool.huahuahua1223_coin, amount);
    let withdrawn_coin = from_balance(withdrawn_balance, ctx);
    public_transfer(withdrawn_coin, ctx.sender());
}

// 管理员提取faucet_coin代币
public entry fun withdraw_faucet_coin(
    _: &AdminCap,
    pool: &mut Pool,
    amount: u64,
    ctx: &mut TxContext,
) {
    assert!(pool.huahuahua1223_faucet_coin.value() >= amount, EPoolNotEnough );

    // 用 from_balance 将balance转换为coin类型
    let withdrawn_balance = balance::split(&mut pool.huahuahua1223_faucet_coin, amount);
    let withdrawn_coin = from_balance(withdrawn_balance, ctx);
    public_transfer(withdrawn_coin, ctx.sender());
}

// 将 2个 faucet_coin 转换成 1个 my_coin
public entry fun swap_faucet_coin_to_my_coin(
    pool: &mut Pool,
    user_coin: Coin<HUAHUAHUA1223_FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    // 验证swap池子是否能兑换出这么多的huahuahua1223_coin
    let output_value = amount * 1000 / 2000;
    assert!(pool.huahuahua1223_coin.value() >= output_value, EPoolNotEnough);

    // 将 faucet_coin 存入到swap池子里等待交换
    deposit_faucet_coin(pool, user_coin, amount, ctx);

    // 交换一半数量的 huahuahua1223_coin
    let output_balance = balance::split(&mut pool.huahuahua1223_coin, output_value);
    let output_coin = from_balance(output_balance, ctx);
    public_transfer(output_coin, ctx.sender());
}

// 将 1个 my_coin 转换成 2个 faucet_coin
public entry fun swap_my_coin_to_faucet_coin(
    pool: &mut Pool,
    user_coin: Coin<HUAHUAHUA1223_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    // 验证swap池子是否能兑换出这么多的huahuahua1223_faucet_coin
    let output_value = amount * 2000 / 1000;
    assert!(pool.huahuahua1223_faucet_coin.value() >= output_value, EPoolNotEnough);

    // 将 my_coin 存入到swap池子里等待交换
    deposit_my_coin(pool, user_coin, amount, ctx);

    // 交换两倍的 huahuahua1223_faucet_coin
    let output_balance = balance::split(&mut pool.huahuahua1223_faucet_coin, output_value);
    let output = from_balance(output_balance, ctx);
    public_transfer(output, ctx.sender());
}