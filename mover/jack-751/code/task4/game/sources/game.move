/*
/// Module: game
/// 翻轉遊戲模組 - 基於隨機數的猜正反面遊戲
*/

// 更多 Move 程式碼規範請參考
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module game::game;

use sui::coin::{Self, Coin};
use sui::balance::{Self, Balance};
use sui::random::{Self, Random};
use std::string::String;
use my_coin::jack_751_faucet_coin::JACK_751_FAUCET_COIN;

/// 翻轉遊戲物件 - 儲存遊戲的資金池
public struct FlipGame has key {
    id: UID,
    balance: Balance<JACK_751_FAUCET_COIN>,
}

/// 管理員物件 - 擁有特殊權限的角色
public struct Admin has key {
    id: UID,
    name: String,
}

/// 初始化函數 - 在模組部署時執行
fun init(ctx: &mut TxContext) {
    // 建立新的翻轉遊戲物件
    let flipgame = FlipGame {
        id: object::new(ctx),
        balance: balance::zero(),
    };
    
    // 建立管理員物件，管理員名稱為 Jack-751
    let admin = Admin {
        id: object::new(ctx),
        name: b"Jack-751".to_string(),
    };
    
    // 將管理員權限轉移給部署者
    transfer::transfer(admin, ctx.sender());
    
    // 將遊戲物件設為共享，讓所有人都可以參與遊戲
    transfer::share_object(flipgame);
}

// 錯誤代碼定義
const EUserInsufficientBalance: u64 = 1000;  // 使用者餘額不足
const EGameInsufficientBalance: u64 = 1001;  // 遊戲資金池餘額不足

/// 存款函數 - 使用者將代幣存入遊戲資金池
public entry fun deposit(
    flipgame: &mut FlipGame,
    in_coin: &mut Coin<JACK_751_FAUCET_COIN>,
    amount: u64,
) {
    // 檢查使用者餘額是否充足
    assert!(
        in_coin.value() >= amount,
        EUserInsufficientBalance
    );
    
    // 分割出指定金額並加入遊戲資金池
    let split_balance = coin::balance_mut(in_coin).split(amount);
    flipgame.balance.join(split_balance);
}

/// 提款函數 - 僅限管理員操作，從遊戲資金池提取代幣
public entry fun withdraw(
    flipgame: &mut FlipGame,
    _: &Admin,
    amount: u64,
    ctx: &mut TxContext,
) {
    // 檢查遊戲資金池餘額是否充足
    assert!(
        flipgame.balance.value() >= amount,
        EGameInsufficientBalance
    );
    
    // 提取代幣並轉移給管理員
    let cash = coin::take(&mut flipgame.balance, amount, ctx);
    transfer::public_transfer(cash, ctx.sender());
}

/// 開始遊戲 - 猜正反面的翻轉遊戲
entry fun play(
    flipgame: &mut FlipGame,
    rnd: &Random,
    guess: bool,
    in_coin: &mut Coin<JACK_751_FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    // 檢查遊戲資金池餘額是否充足
    assert!(
        flipgame.balance.value() >= amount,
        EGameInsufficientBalance
    );
    
    // 檢查使用者餘額是否充足
    assert!(
        in_coin.value() >= amount,
        EUserInsufficientBalance
    );
    
    // 使用者的投注不能超過遊戲資金池的 10%
    assert!(
        amount * 10 <= flipgame.balance.value(),
        EGameInsufficientBalance
    );

    // 生成隨機數種子，然後產生隨機布林值（類似猜正反面）
    let mut gen = random::new_generator(rnd, ctx);
    let flag = random::generate_bool(&mut gen);

    // 如果猜中了
    if (flag == guess) {
        // 獲得獎勵代幣
        let reward = coin::take(&mut flipgame.balance, amount, ctx);
        // 將獎勵轉移給玩家
        in_coin.join(reward);
    } else {
        // 投注失敗，代幣被轉入遊戲資金池
        deposit(flipgame, in_coin, amount);
    }
}