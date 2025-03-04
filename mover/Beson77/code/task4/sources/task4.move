/*
/// Module: task4
module task4::task4;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module task4::task4;

use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::{Coin, TreasuryCap};
use sui::object;
use sui::object::UID;
use sui::random;
use sui::random::Random;
use sui::transfer::{share_object, transfer, public_transfer};
use sui::tx_context::TxContext;
use task2::beson77;
use task2::beson77::BESON77;
use task2::faucet_beson77;
use task2::faucet_beson77::FAUCET_BESON77;

const ErrorCode10:u64 = 10;
const ErrorCode11:u64 = 11;


public struct AdminCap has key { //权限
    id: UID
}

public struct GamePool has key { //奖池游戏数据
    id: UID,
    amount: Balance<FAUCET_BESON77>
}

fun init(ctx: &mut TxContext) {
    let adminCap = AdminCap{
      id:object::new(ctx)
    };

    transfer(adminCap, ctx.sender()); //将管理员权限给自己

    let gamePool = GamePool{
      id: object::new(ctx),
      amount: balance::zero()
    };

    share_object(gamePool); //游戏奖池共享
}

//用户玩游戏，赢了双倍奖励
public entry fun play(userCoin: &mut Coin<FAUCET_BESON77>, amount: u64, pool: &mut GamePool, in: bool, rand: &Random, ctx: &mut TxContext) {
    assert!(amount <= 5_000_000_000, ErrorCode10);
    assert!(amount <= pool.amount.value(), ErrorCode11);

    let mut gen = random::new_generator(rand, ctx);
    let ranRes = random::generate_bool(&mut gen); //生成随机值

    if(ranRes == in) { //赢
        let takeBalance = pool.amount.split(amount);
        userCoin.join(coin::from_balance(takeBalance, ctx));
    } else { //输
        let splitCoin = userCoin.split(amount, ctx);
        let  splitBalance = coin::into_balance(splitCoin);
        pool.amount.join(splitBalance);
    }
}

//往奖池充入余额
public entry fun save_coin(_: &AdminCap, userCoin: &mut Coin<FAUCET_BESON77>, amount: u64, pool: &mut GamePool, ctx: &mut TxContext) {
    let splitCoin =  userCoin.split(amount, ctx);
    let splitBalance = coin::into_balance(splitCoin);
    pool.amount.join(splitBalance);
}

//取出所有代币
public entry fun get_coin(_: &AdminCap, pool: &mut GamePool, ctx: &mut TxContext) {
    let takeBalance = pool.amount.withdraw_all();
    let takeCoin = coin::from_balance(takeBalance, ctx);
    public_transfer(takeCoin, ctx.sender());
}

//测试ptb
// public entry fun test_mint(cap: &mut TreasuryCap<BESON77>, value: u64, recipient: address, cap2: &mut TreasuryCap<FAUCET_BESON77>, ctx: &mut TxContext) {
//     beson77::mint(cap, value, recipient, ctx);
//     assert!(value < 10_000_000_000u64, 1001);
//     faucet_beson77::mint(cap2, value*2, recipient, ctx);
// }







