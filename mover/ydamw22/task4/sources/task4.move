module task4::task4 {
  use sui::balance::{Self, Balance};
  use sui::coin::{Self, Coin};
  use task2::ydamwfaucet::YDAMWFAUCET as YDFC;
  use sui::transfer::{ share_object, transfer, public_transfer };
  use sui::random::{Random};

  // 游戏会话
  public struct Game has key {
    id: UID,
    balance: Balance<YDFC>,
  }

  // 管理员权限
  public struct AdminCap has key {
    id: UID,
  }

  // 初始化游戏
  fun init (ctx: &mut TxContext) {
    let game = Game {
      id: object::new(ctx),
      balance: balance::zero(),
    };

      // 选择所有权的时候 所以人都可以玩
    share_object(game);
    let adminCap = AdminCap {
      id: object::new(ctx)
    };
    transfer(adminCap, ctx.sender());
  }

  // 错误码
  const EInvalidPay: u64 = 100; // 投入金额不合法
  const EInvalidGuess: u64 = 101; // 猜测数字不合法

  // 玩游戏
  entry fun play (game: &mut Game, guess_num: u8, pay_coin: Coin<YDFC>, rnd: &Random, ctx: &mut TxContext) {
    // 判断用户投入的金额，最大只能投入奖池的1/10（避免玩家all in，导致奖池被清空）
    let pay_value = pay_coin.value();
    let game_value = game.balance.value();
    assert!(game_value >= pay_value * 10, EInvalidPay);

    // 提示用户数字只能在1-3之间
    if (guess_num < 1 || guess_num > 3) {
      abort(EInvalidGuess)
    };

    // 生成一个1-3的随机数
    let mut gen = rnd.new_generator(ctx);
    let rnd_num = gen.generate_u8_in_range(1, 3);
    // 输赢
    if (guess_num == rnd_num) {
      // 猜对了
      // 奖励投入的2被金额（获利100%，用户投入+奖池1份），并转账给用户
      let win_balance = game.balance.split(pay_value);
      let win_coin = coin::from_balance(win_balance, ctx);
      public_transfer(win_coin, ctx.sender());
      public_transfer(pay_coin, ctx.sender());
    } else {
      // 猜错了
      // 将用户投入金额加入奖池
      let pay_balance = coin::into_balance(pay_coin);
      game.balance.join(pay_balance);
    }
  }

  // 添加奖金
  public entry fun add_coin (game: &mut Game, add_coin: Coin<YDFC>, _: &mut TxContext) {
    let add_balance = coin::into_balance(add_coin);
    game.balance.join(add_balance);
  }

  // 清空奖金
  public entry fun remove_coin (_: &AdminCap, game: &mut Game, remove_num: u64, ctx: &mut TxContext) {
    let remove_balance = game.balance.split(remove_num);
    let remove_coin = coin::from_balance(remove_balance, ctx);
    public_transfer(remove_coin, ctx.sender());
  }
}
