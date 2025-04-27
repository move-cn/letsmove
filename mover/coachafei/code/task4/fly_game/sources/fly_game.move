/*
/// Module: fly_game
*/
module fly_game::fly_game;

use sui::coin::{Self, Coin};
use sui::balance::{Self, Balance};
use sui::random::{Self, Random};
use my_faucet_coin::faucet_fly::FAUCET_FLY;
use std::string::String;

// 游戏对象
public struct FlyGame has key {
    id: UID,
    balance: Balance<FAUCET_FLY>,
}

// 管理员
public struct Admin has key {
    id: UID,
    name: String,
}

// 初始化函数
fun init(ctx: &mut TxContext){
    // 初始化一个游戏对象
    let flygame = FlyGame{
        id: object::new(ctx),
        balance: balance::zero(),
    };
    // 初始化一个管理员对象，管理员名字是coachafei
    let admin = Admin{
        id: object::new(ctx),
        name: b"coachafei".to_string(),
    };
    // 发布者拥有管理员对象
    transfer::transfer(admin, ctx.sender());
    // 共享所有权，保证所有人都可以玩
    transfer::share_object(flygame)
}

// 存款
const EUserInsufficientBalance: u64 = 1000;
public entry fun Deposit(
    flygame: &mut FlyGame,
    in_coin: &mut Coin<FAUCET_FLY>,
    amount: u64,
){
    assert!(
        // 当前用户的余额是否充足
        coin::value(in_coin) >= amount,
        EUserInsufficientBalance
    );
    let split_balance = balance::split(coin::balance_mut(in_coin), amount);
    balance::join(&mut flygame.balance, split_balance);
}

// 取款，只有管理员操作，把余额降低到一定程度，禁止用户再玩这个游戏。
const EGameInsufficientBalance:u64 = 1001;
public entry fun Withdraw(
    flygame: &mut FlyGame,
    _: &Admin,
    amount: u64,
    ctx: &mut TxContext,
){
    // 当前游戏账户资金池余额要大于提款的额度
    assert!(
        flygame.balance.value() >= amount,
        EGameInsufficientBalance
    );
    // 提出来的钱转移给管理员
    let cash = coin::take(&mut flygame.balance, amount, ctx);
    transfer::public_transfer(cash, ctx.sender());
}

// 开始游戏
entry fun Play(
    flygame: &mut FlyGame,
    rnd: &Random,
    guess: bool,
    in_coin: &mut Coin<FAUCET_FLY>,
    amount: u64,
    ctx: &mut TxContext,
){
    // 检查合约账户余额是否充足
    assert!(
        flygame.balance.value() >= amount,
        EGameInsufficientBalance
    );
    // 检查用户的余额是否充足
    assert!(
        coin::value(in_coin) >= amount,
        EUserInsufficientBalance
    );
    // 用户的投入不能超过游戏账户的10%
    assert!(
        amount * 10 <= flygame.balance.value(),
        EGameInsufficientBalance
    );

    // 生成随机数种子，然后使用随机数种子生成随机的布尔值，这个游戏类似猜正反
    let mut gen = random::new_generator(rnd, ctx);
    let flag = random::generate_bool(&mut gen);

    // 如果获胜
    if (flag == guess) {
        // 获取奖励的新代币
        let reward = coin::take(&mut flygame.balance, amount, ctx);
        // 转移奖励给玩家
        coin::join(in_coin, reward);
    } else {
        // 投入的代币会被转移到游戏对象的余额里
        Self::Deposit(flygame, in_coin, amount);
    }
}