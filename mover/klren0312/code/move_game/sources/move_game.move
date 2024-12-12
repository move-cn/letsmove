module move_game::klren0312_game {
  use sui::coin::{Self, Coin, value, from_balance};
  use sui::balance::{Self, Balance}; // 余额操作
  use faucet_coin::TRUMP_COIN::TRUMP_COIN; // 水龙头币
  use sui::tx_context::sender;
  // Random has a reserved address 0x8
  use sui::random::{ Random, new_generator, generate_u8_in_range };
  use sui::event::{emit};
  use std::string::{utf8, String};

  // 错误码
  const ErrorAddrBalanceInsufficient: u64 = 0; // 钱包余额不足
  const ErrorGameServerBalanceInsufficient: u64 = 1; // 游戏服务器余额不足


  // 管理员权限
  public struct AdminCap has key {
    id: UID
  }

  // 游戏服务
  public struct GameServer has key {
    id: UID,
    coin_pool: Balance<TRUMP_COIN>,
    need_coin_amount: u64, // 玩需要的钱
    reward_coin: u64 // 奖励的钱
  }

  // 游戏结果
  public struct GameResult has copy, drop {
    game_server_number: u8,
    player_guess_number: u8,
    play_status: bool,
    play_status_chinese: String,
    reward_coin_amount: u64
  }

  // 生成游戏服务
  entry fun gen_game(amount: u64, ctx: &mut TxContext) {
    // 共享gameserver
    let gameServer = GameServer {
      id: object::new(ctx),
      coin_pool: balance::zero<TRUMP_COIN>(),
      need_coin_amount: amount,
      reward_coin: amount * 2
    };
    transfer::share_object(gameServer);

    // 转移管理员权限给发送的人
    let admin_cap = AdminCap {
      id: object::new(ctx)
    };
    transfer::transfer(admin_cap, sender(ctx));
  }

  // 开始玩
  entry fun do_play (r: &Random, game_server: &mut GameServer, input_addr_coin_type: Coin<TRUMP_COIN>, guess: u8, ctx: &mut TxContext) {
    // 先把玩游戏的钱存到游戏服务器
    let amount = game_server.need_coin_amount; // 转一下 防止下面报错
    deposit(game_server, input_addr_coin_type, amount, ctx);

    let mut gen = new_generator(r, ctx);
    // 生成游戏服务器的随机数结果
    let server_number: u8 = generate_u8_in_range(&mut gen, 1, 10);

    // 游戏状态 true-赢 false-输
    let mut play_result: bool = false;
    // 相等，就是赢
    if (guess == server_number) {
      // 获取游戏服务器资金池的余额数量
      let coin_pool_amount = balance::value(&game_server.coin_pool);
      // 余额不够支付，报错
      assert!(game_server.reward_coin <= coin_pool_amount, ErrorGameServerBalanceInsufficient);
 
      // 从游戏服务器的资金池中分出来奖励的余额
      let reward_balance = balance::split(&mut game_server.coin_pool, game_server.reward_coin);
      let reward_coin = coin::from_balance(reward_balance, ctx);
      // 发给玩游戏的人
      transfer::public_transfer(reward_coin, sender(ctx));
      play_result = true;
    };
    let mut reward_coin_amount: u64 = 0;
    let mut play_status_chinese: String = utf8(b"输了");
    if (play_result == true) {
      reward_coin_amount = game_server.reward_coin;
      play_status_chinese = utf8(b"赢了");
    };
    // 发送游戏结果事件
    emit(GameResult{
      game_server_number: server_number,
      player_guess_number: guess,
      play_status: play_result,
      play_status_chinese: play_status_chinese,
      reward_coin_amount: reward_coin_amount
    });
  }


  // 给服务器存款
  entry fun deposit(game_server: &mut GameServer, input_addr_coin_type: Coin<TRUMP_COIN>, amount: u64, ctx: &mut TxContext) {
    // 获取存款账户当前TRUMP_COIN的余额
    let current_addr_coin = value(&input_addr_coin_type);
    // 存的钱大于自己本身的余额，报错
    assert!(current_addr_coin >= amount, ErrorAddrBalanceInsufficient);
    // 从存款账户中提取出余额
    let mut current_addr_balance = coin::into_balance(input_addr_coin_type);
    // 如果存款账户的余额大于存款的钱，需要分割存款账户余额，提取存的钱那部分余额，存到游戏服务器的资金池
    if (current_addr_coin > amount) {
      balance::join(
        &mut game_server.coin_pool,
        balance::split(&mut current_addr_balance, amount)
      );
      // 把剩下的余额转成coin，用于转发回存款账户的钱包里
      let finish_current_addr_coin = from_balance(current_addr_balance, ctx);
      transfer::public_transfer(finish_current_addr_coin, sender(ctx));
    } else {
      // 如果存款账户的余额等于存款的钱，直接放到游戏服务器资金池
      balance::join(
        &mut game_server.coin_pool,
        current_addr_balance
      );
    }
  }

  // 用于服务管理员从服务器提款
  entry fun admin_withdraw(_: &AdminCap, game_server: &mut GameServer, amount: u64, ctx: &mut TxContext) {
    // 获取游戏服务器资金池的余额数量
    let coin_pool_amount = balance::value(&game_server.coin_pool);
    // 余额不够支付，报错
    assert!(amount <= coin_pool_amount, ErrorGameServerBalanceInsufficient);
    // 提取出指定数量余额
    let withdraw_balance = balance::split(&mut game_server.coin_pool, amount);
    // 余额转成coin
    let withdraw_coin = from_balance(withdraw_balance , ctx);
    // 发给管理员账户
    transfer::public_transfer(withdraw_coin, sender(ctx));
  }

  #[test_only]
  entry fun get_random(r: &Random, ctx: &mut TxContext): u8 {
    let mut gen = new_generator(r, ctx);
    generate_u8_in_range(&mut gen, 10, 20)
  }
}
