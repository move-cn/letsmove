/*
骰子游戏（Roll the Dice）

玩法：
玩家支付一定的代币并掷一个 6 面骰子，如果点数大于等于某个设定值（如 4），玩家赢得奖励。

智能合约逻辑：
	•	生成 1~6 的随机数作为骰子结果。
	•	设定赢取条件，比如掷出 4 以上赢取 1.5 倍下注金额。
	•	如果骰子小于 4，则玩家损失下注金额。

适用场景： 适合用在娱乐场景，或者扩展为多人博弈模式。
*/

module roll_the_dice::roll_the_dice;


use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::Coin;
use sui::random;
use sui::random::Random;
use sui::transfer::{share_object, public_transfer, transfer};
// use sui::sui::SUI;

// 导入 ZEROS_FAUCET 代币类型
use my_coin::zeros_faucet::ZEROS_FAUCET;

// 游戏回顾
// 第一 你必须掌握怎么存钱   Balance    Coin -> Balance
// 第二 你必须掌握怎么取钱    from_balance  Balance -> Coin
// 第三 就是你要学会怎么交换


const ErrGameAmtNotEnough: u64 = 0x1;


public struct Game<phantom T> has key {
    id: UID,
    amt: Balance<T>,
}

public struct GameAdminCap has key {
    id: UID,
}

fun init(ctx: &mut TxContext) {
    let admin_cap = GameAdminCap {
        id: object::new(ctx),
    };
    transfer(admin_cap, ctx.sender());

    let game = Game<ZEROS_FAUCET> {
        id: object::new(ctx),
        amt: balance::zero(),
    };

    // 人人都可以玩
    share_object(game);
}


/// const SUI_RANDOM_ID: address = @0x8;
/// 0x8
entry fun play(game: &mut Game<ZEROS_FAUCET>, rand: &Random, in_coin: Coin<ZEROS_FAUCET>, ctx: &mut TxContext) {

    let amt_in = in_coin.value();
    let amt_game = game.amt.value();

    // 每次最多只能输入池子的 10分之一
    assert!(amt_game >= amt_in * 10, ErrGameAmtNotEnough);

    let mut gen = random::new_generator(rand, ctx);
    // 生成随机数
    let dice = random::generate_u8_in_range(&mut gen, 1, 6);
    
    if (dice >= 4) {
        // 掷出 4 以上赢取 1.5 倍下注金额。
        let balance_out = game.amt.split(amt_in * 5 / 10);
        let out_coin = coin::from_balance(balance_out, ctx);
        public_transfer(out_coin, ctx.sender());
        public_transfer(in_coin, ctx.sender());
    }
    else {
        // 如果小于4，则玩家损失下注金额。
        let balance_in = coin::into_balance(in_coin);
        game.amt.join(balance_in);
    }
}

public entry fun add_game_coin(game: &mut Game<ZEROS_FAUCET>, in_coin: Coin<ZEROS_FAUCET>, ctx: &mut TxContext) {
    let balance_in = coin::into_balance(in_coin);
    game.amt.join(balance_in);
}

public entry fun remove_game_coin(_: &GameAdminCap, game: &mut Game<ZEROS_FAUCET>, amt: u64, ctx: &mut TxContext) {
    let balance_out = game.amt.split(amt);
    let out_coin = coin::from_balance(balance_out, ctx);
    public_transfer(out_coin, ctx.sender());
}

