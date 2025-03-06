/// Module: game_greyhao
/// 游戏：掷骰子，用户下注并猜测点数，如果猜中则获取同下注数量相同的奖励，如果猜错则下注金额归游戏池所有
module game_greyhao::game_greyhao;

use sui::balance::{Self, Balance};
use sui::coin::{Self, Coin};
use sui::random::{Random, new_generator, generate_u8_in_range};
use coin_greyhao::greyhaofaucet::GREYHAOFAUCET;

const ErrorUserInsufficient: u64 = 0x101;
const ErrorGameInsufficient: u64 = 0x101;

public struct Game has key {
  id: UID,
  pool_amount: Balance<GREYHAOFAUCET>,
}

public struct Admin has key {
  id: UID,
}

fun init(ctx: &mut TxContext) {
  let game = Game {
    id: object::new(ctx),
    pool_amount: balance::zero()
  };
  transfer::share_object(game);

  let admin = Admin { id: object::new(ctx) };
  transfer::transfer(admin, ctx.sender());
}

public entry fun addCoinToGamePool(game: &mut Game, in_coin: &mut Coin<GREYHAOFAUCET>, amount: u64, _: &mut TxContext) {
  // coin 的总金额
  let value = coin::value(in_coin);
  assert!(amount <= value, ErrorUserInsufficient);
  // 拆分指定金额的 coin
  let coin_balance = in_coin.balance_mut().split(amount);
  // 添加到游戏奖池中
  game.pool_amount.join(coin_balance);
}

public entry fun removeCoinFromGamePool(_: &Admin, game: &mut Game, amount: u64, ctx: &mut TxContext) {
  // 池子里的余额是否大于要提取的数量
  assert!(game.pool_amount.value() >= amount, ErrorGameInsufficient);

  let coin = coin::take(&mut game.pool_amount, amount, ctx);
  transfer::public_transfer(coin, ctx.sender());
}

entry fun play(game: &mut Game, random: &Random, guess_num: u8, in_coin: &mut Coin<GREYHAOFAUCET>, amount: u64, ctx: &mut TxContext) {
  // 最大下注金额为奖池的 三分之一
  assert!(game.pool_amount.value() >= (amount * 3), ErrorGameInsufficient);
  // 用户余额数值是要大于下注金额
  assert!(in_coin.balance().value() >= amount, ErrorUserInsufficient);

  let mut g = new_generator(random, ctx);
  let win_num = generate_u8_in_range(&mut g, 1, 6);

  if(win_num == guess_num) {
    // 从奖池中拿出同下注金额相同的数量作为奖励
    let reward_coin = coin::take(&mut game.pool_amount, amount, ctx);
    // 将奖励返回给玩家
    in_coin.join(reward_coin);
  } else {
    // 下注金额放入池子里
    Self::addCoinToGamePool(game, in_coin, amount, ctx);
  }
}