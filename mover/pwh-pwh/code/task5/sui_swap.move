module sui_swap::sui_swap;

use my_coin::my_coin::MY_COIN;
use faucet_coin::faucet_coin::FAUCET_COIN;
use sui::balance::{Self, Balance};
use sui::coin::{Self, Coin};
use std::string::String;


public struct Admin has key {
    id: UID,
    name: String
}

public struct Pool has key {
    id: UID,
    my_coin: Balance<MY_COIN>,
    my_faucet_coin: Balance<FAUCET_COIN>,
}

// 初始化函数，初始化池对象和管理员对象，共享池对象，管理员对象转给调用者
fun init(ctx: &mut TxContext){
    let pool = Pool {
        id: object::new(ctx),
        my_coin: balance::zero<MY_COIN>(),
        my_faucet_coin: balance::zero<FAUCET_COIN>(),
    };
    let admin = Admin {
        id: object::new(ctx),
        name: b"pwh-pwh".to_string()
    };
    transfer::share_object(pool);
    transfer::transfer(admin, ctx.sender())
}

// 定义两个错误码，分别表示池子里的余额不足和币对象里的余额不足
const EPoolInsufficientValue: u64 = 1000;
const ECoinInsufficientValue: u64 = 1001;
// 往池子对象里存入MY_COIN币
public entry fun deposit_MY_COIN(
    pool: &mut Pool,
    in_coin: &mut Coin<MY_COIN>,
    amount: u64,
){
    let in_value = coin::value(in_coin);
    // 需要币对象里的余额大于等于存入的金额，否则报错。
    assert!(
        in_value >= amount,
        ECoinInsufficientValue
    );
    // 从币对象上取出存入的金额并存入池子对象的my_coin余额
    let split_balance = balance::split(coin::balance_mut(in_coin), amount);
    balance::join(&mut pool.my_coin, split_balance);
}

// 往池子对象里存入FAUCET_COIN币
public entry fun deposit_FAUCET_COIN(
    pool: &mut Pool,
    in_coin: &mut Coin<FAUCET_COIN>,
    amount: u64,
){
    let in_value = coin::value(in_coin);
    assert!(
        in_value >= amount,
        EPoolInsufficientValue
    );
    // 从币对象上取出存入的金额并存入池子对象的my_faucet_coin余额
    let split_balance = balance::split(coin::balance_mut(in_coin), amount);
    balance::join(&mut pool.my_faucet_coin, split_balance);
}

// 管理员从池子里提取MY_COIN币资金，需要具备管理员权限
public entry fun WithdrawMY_COIN(
    pool: &mut Pool,
    _: &Admin,
    amount: u64,
    ctx: &mut TxContext,
) {
    // 需要池子里的MY_COIN币余额大于等于提取的金额，否则报错。
    assert!(
        pool.my_coin.value() >= amount,
        EPoolInsufficientValue
    );
    // 从池子余额里取出对应的金额并转换为币对象，然后把币对象转移给用户
    let my_coin_balance = balance::split(&mut pool.my_coin, amount);
    let my_coin = coin::from_balance(my_coin_balance, ctx);
    transfer::public_transfer(my_coin, ctx.sender())
}

// 管理员从池子里提取FAUCET_COIN币资金
public entry fun WithdrawFAUCET_COIN(
    pool: &mut Pool,
    _: &Admin,
    amount: u64,
    ctx: &mut TxContext,
) {
    // 从池子余额里取出对应的金额并转换为币对象，然后把币对象转移给用户
    let faucet_balance = balance::split(&mut pool.my_faucet_coin, amount);
    let faucet_coin = coin::from_balance(faucet_balance, ctx);
    transfer::public_transfer(faucet_coin, ctx.sender())
}

// 上面两个函数需要考虑合并成一个函数，因为逻辑相似，只是操作的币种不同

// 交换函数，从池子里存入MY_COIN币，取出FAUCET_COIN币
public entry fun swap_MY_COIN_to_FAUCET_COIN(
    pool: &mut Pool,
    in_coin: &mut Coin<MY_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let in_value = coin::value(in_coin);
    // 如果币对象里没有足够的MY_COIN币，就报错。
    assert!(
        in_value >= amount*1000/2000,
        ECoinInsufficientValue
    );
    let out_value = amount;
    let faucet_balance = pool.my_faucet_coin.value();
    // 如果取出的FAUCET_COIN币金额大于池子里的余额，就报错。
    assert!(
        out_value <= faucet_balance,
        EPoolInsufficientValue
    );
    // 往池子里存入MY_COIN币，先从币对象上切分出指定数量的余额，然后存入池子对象的my_coin余额
    // 设置兑换比例为1:2，即每1000个MY_COIN币兑换2000个FAUCET_COIN币，因此在扣除MY_COIN币时要除以2
    let split_balance = balance::split(coin::balance_mut(in_coin), amount*1000/2000);
    balance::join(&mut pool.my_coin, split_balance);

    // 从池子里取出FAUCET_COIN币并转移给调用者
    let split_balance = balance::split(&mut pool.my_faucet_coin, out_value);
    let faucet_coin = coin::from_balance(split_balance, ctx);
    transfer::public_transfer(faucet_coin, ctx.sender())
}

// 交换函数，从池子里存入FAUCET_COIN币，取出MY_COIN币
public entry fun swap_FAUCET_COIN_to_MY_COIN(
    pool: &mut Pool,
    in_coin: &mut Coin<FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let in_value = coin::value(in_coin);
    // 如果币对象里没有足够的FAUCET_COIN币，就报错。
    assert!(
        in_value >= amount*2000/1000,
        ECoinInsufficientValue
    );
    let out_value = amount;
    let my_coin_balance = pool.my_coin.value();
    // 如果取出的FAUCET_COIN币金额大于池子里的余额，就报错。
    assert!(
        out_value <= my_coin_balance,
        EPoolInsufficientValue
    );
    // 往池子里存入FAUCET_COIN币，先从币对象上切分出指定数量的余额，然后存入池子对象的my_faucet_coin余额
    // 设置兑换比例为2:1，即每2000个FAUCET_COIN币兑换1000个FAUCET_COIN币，因此在扣除FAUCET_COIN币时要乘以2
    let split_balance = balance::split(coin::balance_mut(in_coin), amount*2000/1000);
    balance::join(&mut pool.my_faucet_coin, split_balance);

    // 从池子里取出MY_COIN币并转移给调用者
    let split_balance = balance::split(&mut pool.my_coin, out_value);
    let my_coin = coin::from_balance(split_balance, ctx);
    transfer::public_transfer(my_coin, ctx.sender())
}

//package id: 0x029f22347e66594e6080fb9cac4be9b554d75f4a9f9dcbfa730696a53bf42735
//swap m to f:EqnqLDFCUxaa8vfetKyV1x7Yp3KFZ61BCCzTv7yJ3Soi
//swap f to m:8cE6AMcgsW7x4ohfjR1PWu6MJWeXBcmsxdBmuiWT83P6
