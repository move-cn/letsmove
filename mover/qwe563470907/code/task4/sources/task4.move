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
use task2::faucet_qwe;
use task2::faucet_qwe::FAUCET_QWE;

const ErrorCode10:u64 = 10;
const ErrorCode11:u64 = 11;


public struct AdminCap has key { //权限
    id: UID
}

public struct GamePool has key {
    id: UID,
    amount: Balance<FAUCET_QWE>
}

fun init(ctx: &mut TxContext) {
    let adminCap = AdminCap{
        id:object::new(ctx)
    };

    transfer(adminCap, ctx.sender());

    let gamePool = GamePool{
        id: object::new(ctx),
        amount: balance::zero()
    };

    share_object(gamePool);
}

public entry fun play(userCoin: &mut Coin<FAUCET_QWE>, amount: u64, pool: &mut GamePool, in: bool, rand: &Random, ctx: &mut TxContext) {
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

public entry fun save_coin(_: &AdminCap, userCoin: &mut Coin<FAUCET_QWE>, amount: u64, pool: &mut GamePool, ctx: &mut TxContext) {
    let splitCoin =  userCoin.split(amount, ctx);
    let splitBalance = coin::into_balance(splitCoin);
    pool.amount.join(splitBalance);
}

public entry fun get_coin(_: &AdminCap, pool: &mut GamePool, ctx: &mut TxContext) {
    let takeBalance = pool.amount.withdraw_all();
    let takeCoin = coin::from_balance(takeBalance, ctx);
    public_transfer(takeCoin, ctx.sender());
}