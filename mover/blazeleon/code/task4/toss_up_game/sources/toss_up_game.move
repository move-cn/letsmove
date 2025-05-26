module toss_up_game::toss_up_game;

use sui::tx_context::{sender};
use sui::balance::{Self, Balance};
use sui::coin::{Self,Coin};
use blazeleon_faucet::blazeleon_faucet::BLAZELEON_FAUCET;
use sui::transfer::{share_object, transfer, public_transfer};
use sui::random::{Self,Random};
use sui::event;

// 定义奖池结构体
public struct Jackpot has key {
    id: UID,
    prize: Balance<BLAZELEON_FAUCET>,
}

// 定义管理员权限
public struct AdminCap has key {
    id: UID,
}

// 定义游戏结果的事件，便于在区块链上记录游戏结果
public struct GameResultEvent has copy, drop {
    user_address: address,
    bet_content: bool,
    bet_amt: u64,
    game_result: bool
}

// 定义错误码
// ENotEnough: 余额不足
const ENotEnough: u64 = 0;
// EBetTooLarge: 投注金额过大
const EBetTooLarge: u64 = 1;
// EJackpotNotEnough: 奖池金额不足
const EJackpotNotEnough: u64 = 2;

// 初始化函数
fun init (ctx:&mut TxContext) {
    // 创建管理员权限实例
    let adminCap = AdminCap {
        id:object::new(ctx),
    };
    // 给当前账户分配管理员权限
    transfer(adminCap, sender(ctx));
    
    //创建奖池实例
    let jackpot = Jackpot {
        id: object::new(ctx),
        prize: balance::zero<BLAZELEON_FAUCET>(),
    };
    // 共享权限
    share_object(jackpot);
}


// 用户投注
entry fun bet(
    bet_content: bool,
    coin_obj: &mut Coin<BLAZELEON_FAUCET>,
    bet_amt: u64,
    in_random: &Random,
    jackpot: &mut Jackpot,
    ctx: &mut TxContext
) {
    // 获取 object 的余额，与传入的投注金额进行校验
    let object_amt = coin::value(coin_obj);
    assert!(object_amt >= bet_amt, ENotEnough);

    let bet_coin = coin::split(coin_obj, bet_amt, ctx);

    // 获取奖池的金额
    let jackpot_balance = balance::value(&jackpot.prize);

    // 检查下注金额是否大于奖池的10%
    assert!(bet_amt * 10 <= jackpot_balance, EBetTooLarge);

    // 调用 random 模块生成随机数
    let mut gen_val = random::new_generator(in_random,ctx);
    let game_result = random::generate_bool(&mut gen_val);

    // 记录游戏结果事件
    event::emit(GameResultEvent {
        user_address: sender(ctx),
        bet_content: bet_content,
        bet_amt: bet_amt,
        game_result: game_result
    });
    
    // 玩家下注结果判别
    if (bet_content == game_result){
        // 玩家赢了。奖励金额是投注金额1:1，另外投注金额归还
        // 从奖池中取出相应的奖金
        let reward_balance = balance::split(&mut jackpot.prize, bet_amt);
        // 将奖励转换为 coin
        let reward_coin = coin::from_balance(reward_balance,ctx);
        //归还下注的金额
        public_transfer(bet_coin, sender(ctx));
        // 将奖励转移给玩家
        public_transfer(reward_coin, sender(ctx));
    }else{
        // 玩家输了，将下注金额追加到奖池
        let in_balance = coin::into_balance(bet_coin);
        balance::join(&mut jackpot.prize,in_balance);
    }

}

// 向奖池存入金额
public entry fun deposit(
    coin_obj: &mut Coin<BLAZELEON_FAUCET>,
    deposit_amt: u64,
    jackpot: &mut Jackpot,
    ctx: &mut TxContext
) {
    let object_amt = coin::value(coin_obj);
    assert!(object_amt >= deposit_amt, ENotEnough);

    let deposit_coin = coin::split(coin_obj, deposit_amt, ctx);
    balance::join(&mut jackpot.prize, coin::into_balance(deposit_coin));
}

// 从奖池中提取指定的金额，调用者必须拥有管理员权限
public entry fun make_withdrawal(
    _: &AdminCap,
    out_amt: u64,
    jackpot: &mut Jackpot,
    ctx: &mut TxContext
){
    // 检查奖池金额是否足够
    let total_prize = balance::value(& jackpot.prize);
    assert!(total_prize >= out_amt, EJackpotNotEnough);
    // 从奖池中取出相应的金额
    let out_balance = balance::split(&mut jackpot.prize, out_amt);
    let out_coin_amt = coin::from_balance(out_balance,ctx);
    public_transfer(out_coin_amt, sender(ctx));
}

// 从奖池中提取指定金额至指定的地址，调用者必须拥有管理员权限
public entry fun withdraw_and_transfer(
    _: &AdminCap,
    out_amt: u64,
    receiver: address,
    jackpot: &mut Jackpot,
    ctx: &mut TxContext
){
    // 检查奖池金额是否足够
    let total_prize = balance::value(& jackpot.prize);
    assert!(total_prize >= out_amt, EJackpotNotEnough);
    // 从奖池中取出相应的金额
    let out_balance = balance::split(&mut jackpot.prize, out_amt);
    let out_coin_amt = coin::from_balance(out_balance,ctx);
    // 将金额转移到指定地址
    public_transfer(out_coin_amt, receiver);
}