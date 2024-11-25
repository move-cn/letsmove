/*
/// Module: task4*/
module task4::game;

use sui::balance::{Balance};
use sui::balance;
use sui::coin::{Coin, into_balance};
use sui::coin;
// use sui::{from_balance,into_balance};
use sui::random;
use sui::random::Random;
use sui::transfer::{share_object,transfer,public_transfer};
use sui::tx_context::sender;
use task2::faucet_coin::FAUCET_COIN;
const EGameInsufficientBalance: u64 = 1001;
const EUserInsufficientBalance: u64 = 1002;

public struct AdminCap has key{
    id:UID
}

public struct CryptoCtl_Game has key, store{
    id:UID,
    balance: Balance<FAUCET_COIN>,
}

public struct GAME has drop {}

fun init(_otw:GAME, ctx: &mut TxContext) {
    let game = CryptoCtl_Game {
        id: object::new(ctx),
        balance: balance::zero<FAUCET_COIN>()
    };
    share_object(game);

    let admin = AdminCap {id: object::new(ctx)};
    transfer(admin, sender(ctx));
}

public entry fun deposit(
    game: &mut CryptoCtl_Game,
    coin:&mut Coin<FAUCET_COIN>,
    amount: u64,
    ctx:&mut TxContext
){
    assert!(
        coin.value() >= amount,
        EUserInsufficientBalance
    );
    let split_coin = coin.split(amount, ctx);

    game.balance.join(into_balance(split_coin));

    //let into_balance = into_balance(coin);
    //game.balance.join(into_balance);
}

public entry fun withdraw(_admin:&AdminCap, game:&mut CryptoCtl_Game, amount:u64, to:address, ctx:&mut TxContext){

    assert!(
        game.balance.value() >= amount,
        EGameInsufficientBalance
    );

    let cash = coin::take(&mut game.balance, amount, ctx);
    public_transfer(cash, to);
}

// 如果用户猜对了，获得双倍奖励。如果用户猜错了，损失投入的代币

public entry fun play(
    game: &mut CryptoCtl_Game,
    rnd: &Random,
    guess: bool,
    coin: &mut Coin<FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext
) {
    // 检查合约余额是否充足，确保用户获胜时有足够金额奖励
    assert!(
        game.balance.value() >= amount,
        EGameInsufficientBalance
    );
    // 检查用户的余额是否充足
    assert!(
        coin.value() >= amount,
        EUserInsufficientBalance
    );


    // 生成随机数
    let mut gen = random::new_generator(rnd, ctx);
    let flag = random::generate_bool(&mut gen);

    // 如果获胜
    if (flag == guess) {
        // 投入的代币不变，另外奖励等额的代币
        let reward = coin::take(&mut game.balance, amount, ctx);
        coin.join(reward);
    }
        // 猜错了就损失投入的代币
    else {
        Self::deposit(game, coin, amount, ctx)
    }
}

