module mycoin::simple_game {
  use sui::balance::{Self, Balance};
  use sui::sui::SUI;
  use sui::coin::{Self, Coin};
  use sui::clock::{Self, Clock};
  use sui::event::{Self};

  //0.1 - 1 SUI
  const MIN_PLAY_AMOUNT:u64 = 100000000;
  const MAX_PLAY_AMOUNT:u64 = 1*1000000000;

  //硬币正反面
  const COIN_HEADS:u8 = 1;
  const COIN_TAILS:u8 = 2;

  //errors code
  const ERROR_PLAY_AMOUNT:u64 = 1;
  const ERROR_ENOUGH_POOL:u64 = 2;
  const ERROR_PASUE_GAME:u64 = 3;

  public struct Game has key {
    id: UID,
    play_time: u64, //简单记录一下玩的次数
    pause: bool, //暂停
    balance: Balance<SUI>
  }

  public struct AdminCap has key {
    id: UID
  }

  
  public struct EventGuess has copy, drop {
    random: u8,
    win: bool,
    amount: u64
  }


  public struct SIMPLE_GAME has drop {}

  fun init(_witness: SIMPLE_GAME, ctx: &mut TxContext) {
    let game = Game {
      id: object::new(ctx),
      play_time: 0,
      pause: false,
      balance: balance::zero()
    };

    transfer::share_object(game);
    transfer::transfer(AdminCap{id: object::new(ctx)}, ctx.sender());
  }


  fun get_rand_num(clock: &Clock, len: u32):u8 {
    let current_timestamp = clock::timestamp_ms(clock);
    (current_timestamp % (len as u64) + 1) as u8
  }


  //只让rpc调用，防止合约间调用安全问题
  entry fun play(game: &mut Game, payment: Coin<SUI>, clock: &Clock, ctx: &mut TxContext) {

    assert!(!game.pause, ERROR_PASUE_GAME);

    game.play_time = game.play_time + 1;
    
    let pool_amount = game.balance.value();
    let amount = payment.value();
    assert!(amount >= MIN_PLAY_AMOUNT && amount <= MAX_PLAY_AMOUNT, ERROR_PLAY_AMOUNT);
    assert!(amount <= pool_amount, ERROR_ENOUGH_POOL);
   
   
    coin::put(&mut game.balance, payment);

    //获取随机数
    let random = get_rand_num(clock,2);
    if(random == COIN_HEADS) {
      //正面奖励2倍
      let win_balance = game.balance.split(amount*2);
  
      event::emit(EventGuess{
        random: random,
        win: true,
        amount: amount*2
      });

      transfer::public_transfer(coin::from_balance(win_balance, ctx), ctx.sender())
    } else if(random == COIN_TAILS){
      //反面不给奖励
      event::emit(EventGuess{
        random: random,
        win: false,
        amount: amount
      });
    }
  }

  //管理员

  //添加初始资金
  public entry fun add_pool(_: &AdminCap, game: &mut Game, payment: Coin<SUI>, _ctx: &mut TxContext) {
    coin::put(&mut game.balance, payment);
  }

  //设置暂停游戏
  public entry fun pause_game(_: &AdminCap,game: &mut Game, pause: bool, _ctx: &mut TxContext) {
    game.pause = pause;
  }

  //紧急提取资金
  public entry fun emgency_withdraw(_: &AdminCap,game: &mut Game, amount: u64, ctx: &mut TxContext) {
    let balance = game.balance.split(amount);
    transfer::public_transfer(coin::from_balance(balance, ctx), ctx.sender());
  }


}