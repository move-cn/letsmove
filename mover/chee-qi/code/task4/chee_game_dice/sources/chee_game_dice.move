/*
/// Module: chee_game_dice
module chee_game_dice::chee_game_dice;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module chee_game_dice::chee_game_dice;


// === Imports ===
use sui::balance;
use sui::random;
use sui::random::Random;
use sui::balance::Balance;
use sui::transfer::{share_object,public_transfer};
use sui::coin;
use sui::coin::Coin; 
// === Errors ===

// === Constants ===

// === Structs ===

public struct Game<phantom T> has key {
    id: UID,
    balance: Balance<T>, 
    admin: address,
}

// === Events ===

// === Method Aliases ===


public entry fun create_game<T>(ctx: &mut TxContext) {
    let game = Game<T> {
        id: object::new(ctx),
        balance: balance::zero(), 
        admin: tx_context::sender(ctx),
    };
    share_object(game);
}

// === Public Functions ===
entry fun play<T>(
    game: &mut Game<T>, 
    rand: &Random, 
    bet: bool, 
    in_coin: Coin<T>, 
    amount: u64, 
    ctx: &mut TxContext
) {
    let amt_value = coin::value(&in_coin);
    let game_amt = balance::value(&game.balance);

    // 检查输入的数量是否大于0且不超过Coin的总值
    assert!(amount > 0 && amount <= amt_value, 0x111);

    // 检查游戏余额是否足够
    assert!(game_amt >= amount * 10, 0x112);

    let mut gen = random::new_generator(rand, ctx);
    let dice_roll = random::generate_u8_in_range(&mut gen,1,6); // 生成1到6之间的随机数
    let is_big = is_big_or_small(dice_roll);

    // 因为Coin是一个资源，所以需要先判断是否是flip_value，如果是，需要先将coin转换为balance，再进行split操作
    // Coin没有drop方法，所以需要手动释放
    if (bet == is_big) {
        // 押对了 翻倍出去
        let out_balance = balance::split(&mut game.balance, amount);
        let out_coin = coin::from_balance(out_balance, ctx);
        public_transfer(out_coin, tx_context::sender(ctx));
        public_transfer(in_coin, tx_context::sender(ctx));
    } else {
        // 押错了扣钱
        let mut in_balance = coin::into_balance(in_coin);
        let in_amt_balance = balance::split(&mut in_balance, amount);
        balance::join(&mut game.balance, in_amt_balance);
        let remaining_coin = coin::from_balance(in_balance, ctx);
        public_transfer(remaining_coin, tx_context::sender(ctx));
            
    }
}

/// Add Coin to the game
/// * `game` - 游戏实例
/// * `in_coin` - 要添加的代币
/// * `ctx` - 交易上下文
public entry fun add_coin<T>(
    game: &mut Game<T>, 
    in_coin: Coin<T>, 
    amount: u64, 
    ctx: &mut TxContext
) {
    // 检查输入代币金额大于0
    let coin_value = coin::value(&in_coin);
    assert!(amount > 0 && amount <= coin_value, 0x113);
    
    // 将指定数量的代币转换为余额
    let mut _in_balance = coin::into_balance(in_coin);
    let in_balance = balance::split(&mut _in_balance, amount);
    balance::join(&mut game.balance, in_balance);

    // 将剩余的代币转换回 Coin 并返回给用户
    let _remaining_balance = balance::value(&_in_balance);
    if (_remaining_balance > 0) {
        let remaining_coin = coin::from_balance(_in_balance, ctx);
        public_transfer(remaining_coin, tx_context::sender(ctx));
    } else {
       balance::destroy_zero(_in_balance);
    }

    // 可以在这里添加事件通知
    // emit(CoinAddedEvent { amount: amount, sender: tx_context::sender(ctx) });
}
// === View Functions ===

// === Admin Functions ===

entry fun remove_coin<T>(game:&mut Game<T>, balance:u64, ctx : &mut TxContext){
    assert!(ctx.sender() == game.admin, 0x112);

    let out_balance  = balance::split(&mut game.balance, balance);
    let out_coin = coin::from_balance(out_balance,ctx);
    public_transfer(out_coin,ctx.sender());
}

// === Package Functions ===

// === Private Functions ===

fun is_big_or_small(_num:u8): bool {
    _num >= 3 
}

// === Test Functions ===




