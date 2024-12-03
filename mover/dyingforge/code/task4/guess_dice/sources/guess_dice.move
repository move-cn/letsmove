/*
/// Module: guess_dice
module guess_dice::guess_dice;
*/
/*
/// Module: guess_number
module guess_number::guess_number;
*/
module guess_dice::guess_dice;

use sui::balance::{Self, Balance};
use sui::coin::{Self, Coin};
use sui::random::{Self, Random};
use sui::transfer::{public_transfer, share_object, transfer};
use task2::my_token_faucet::MY_TOKEN_FAUCET;

const INERROR: u64 = 0x2222;
const GUESSERROR: u64 = 0x111;

public struct GuessDice has key {
    id: UID,
    amt: Balance<MY_TOKEN_FAUCET>,
}

public struct AdminCap has key {
    id: UID,
}

//游戏初始化
fun init(ctx: &mut TxContext) {
    let game = GuessDice { id: object::new(ctx), amt: balance::zero() };
    let admin = AdminCap { id: object::new(ctx) };
    share_object(game);
    transfer(admin, ctx.sender());
}

entry fun play(
    guess: u8,
    in_coin: Coin<MY_TOKEN_FAUCET>,
    rand: &Random,
    game: &mut GuessDice,
    ctx: &mut TxContext,
) {
    //设定投入资金不能超过游戏池的一半
    let in_value = in_coin.value();
    let game_value = game.amt.value();
    assert!(game_value>=in_value*2, INERROR);

    //随机数，设置筛子的大小
    let min: u8 = 1;
    let max: u8 = 6;
    let mut gen = random::new_generator(rand, ctx);
    let dice = random::generate_u8_in_range(&mut gen, min, max);

    //设定猜测的数字在1——6之间
    assert!(guess>6, GUESSERROR);

    //游戏规则，如果猜测正确，则带走与投入金额相同的SUI，错误则没收
    if (guess == dice) {
        let out_balance = game.amt.split(in_value);
        let out_coin = out_balance.into_coin(ctx);
        public_transfer(in_coin, ctx.sender());
        public_transfer(out_coin, ctx.sender());
    } else {
        let in_bal = coin::into_balance(in_coin);
        game.amt.join(in_bal);
    };
}

//向游戏池里面加资金
public entry fun add(in_coin: Coin<MY_TOKEN_FAUCET>, game: &mut GuessDice, _: &mut TxContext) {
    let in_balance = coin::into_balance(in_coin);
    game.amt.join(in_balance);
}

//转移游戏池资金到自己账户
public entry fun remove(_: &AdminCap, amt: u64, game: &mut GuessDice, ctx: &mut TxContext) {
    let out_balance = game.amt.split(amt);
    let out_coin = coin::from_balance(out_balance, ctx);
    public_transfer(out_coin, ctx.sender());
}
