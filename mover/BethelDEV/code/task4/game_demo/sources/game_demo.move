/// Module: game_demo
module game_demo::game_demo;

use sui::coin::{Self, Coin};
use sui::balance::{Self, Balance};
use sui::random::{Self, Random};
use std::string::String;
use coin_demo::betheldev_faucetcoin::BETHELDEV_FAUCETCOIN;

// 游戏对象
public struct FlipGame has key {
    id: UID,
    balance: Balance<BETHELDEV_FAUCETCOIN>,
}

// 管理员
public struct Admin has key {
    id: UID,
    name: String,
}

// 初始化函数
fun init(ctx: &mut TxContext){
    // 初始化一个游戏对象
    let flipgame = FlipGame{
        id: object::new(ctx),
        balance: balance::zero(),
    };
    // 初始化一个管理员对象，管理员名字是 BethelDEV
    let admin = Admin{
        id: object::new(ctx),
        name: b"BethelDEV".to_string(),
    };
    // 发布者拥有管理员对象
    transfer::transfer(admin, ctx.sender());
    // 共享所有权，保证所有人都可以玩
    transfer::share_object(flipgame)
}

// 存款
const EUserInsufficientBalance: u64 = 1000;
public entry fun Deposit(
    flipgame: &mut FlipGame,
    in_coin: &mut Coin<BETHELDEV_FAUCETCOIN>,
    amount: u64,
){
    assert!(
        // 当前用户的余额是否充足
        in_coin.value() >= amount,
        EUserInsufficientBalance
    );
    let split_balance = coin::balance_mut(in_coin).split(amount);
    flipgame.balance.join(split_balance);
}

// 取款，只有管理员操作，把余额降低到一定程度，禁止用户再玩这个游戏。
const EGameInsufficientBalance:u64 = 1001;
public entry fun Withdraw(
    flipgame: &mut FlipGame,
    _: &Admin,
    amount: u64,
    ctx: &mut TxContext,
){
    // 当前游戏账户资金池余额要大于提款的额度
    assert!(
        flipgame.balance.value() >= amount,
        EGameInsufficientBalance
    );
    // 提出来的钱转移给管理员
    let cash = coin::take(&mut flipgame.balance, amount, ctx);
    transfer::public_transfer(cash, ctx.sender());
}

// 开始游戏
entry fun Play(
    flipgame: &mut FlipGame,
    rnd: &Random,
    guess: bool,
    in_coin: &mut Coin<BETHELDEV_FAUCETCOIN>,
    amount: u64,
    ctx: &mut TxContext,
){
    // 检查合约账户余额是否充足
    assert!(
        flipgame.balance.value() >= amount,
        EGameInsufficientBalance
    );
    // 检查用户的余额是否充足
    assert!(
        in_coin.value() >= amount,
        EUserInsufficientBalance
    );
    // 用户的投入不能超过游戏账户的10%
    assert!(
        amount * 10 <= flipgame.balance.value(),
        EGameInsufficientBalance
    );

    // 生成随机数种子，然后使用随机数种子生成随机的布尔值，这个游戏类似猜正反
    let mut gen = random::new_generator(rnd, ctx);
    let flag = random::generate_bool(&mut gen);

    // 如果获胜
    if (flag == guess) {
        // 获取奖励的新代币
        let reward = coin::take(&mut flipgame.balance, amount, ctx);
        // 转移奖励给玩家
        in_coin.join(reward);
    } else {
        // 投入的代币会被转移到游戏对象的余额里
        Self::Deposit(flipgame, in_coin, amount);
    }
}
