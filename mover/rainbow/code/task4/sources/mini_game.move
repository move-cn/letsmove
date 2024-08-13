//模拟双色球下注 小游戏
module mini_game::mini_game {
  use sui::coin::{Self,Coin};
  use std::string::{Self,String};
  use sui::event;
  use sui::balance::{Self,Balance};
  use sui::random::{Self,Random};
  use faucet_coin::faucet_coin::{FAUCET_COIN};
  

  public struct Game  has key {
      id: UID,
      balance: Balance<FAUCET_COIN>,
      ticket: u64,
      reward:u64
  }

  public struct GameRecord has key{
    id:UID,
    balls:vector<u64>,
    player:address,
    win_balls:vector<u64>,
    is_win:bool,
  }

  public struct AdaminCap has key {
      id: UID
  }

  public struct EventMessgage has copy,drop{
    code:u64,
    message:String,
    record_id:ID,
  }

  const BetBallMaxNumberLimit:u64 = 0;
  const PaycoinNotEnough:u64 = 1;
  const PoolLackOfFunds:u64 = 2;

  fun init(ctx:&mut TxContext){
    let game = Game{
      id:object::new(ctx),
      balance:balance::zero(),
      ticket: 10000,
      reward: 1000
    };
    transfer::share_object(game);

    let admin_cap = AdaminCap { id: object::new(ctx) };
    transfer::transfer(admin_cap, ctx.sender());
  }

  //双色球游戏
  public entry fun bet(balls:vector<u64>,game:&mut Game,pay_coin:&mut Coin<FAUCET_COIN>,rand: &Random,ctx:&mut TxContext){
    //校验下注输入双色球号码必须是7个数字
    assert!((vector::length(&balls)==7),BetBallMaxNumberLimit);

    //校验奖池里钱够不够
    let pool = balance::value(&game.balance);
    assert!(pool >= game.reward, PoolLackOfFunds);

    //每次下注需要支付 game.ticket 费用
    let input_value = coin::value(pay_coin);
    assert!(input_value >= game.ticket, PaycoinNotEnough);

    

    //检验红色球的数字不能大于33 前6个是红色球
    let mut i:u64=0;
    let length = vector::length(&balls);
    while(i < (length-1)){
      assert!((balls[i]<=33 && balls[i]>0),1);
      i=i+1;
    };

    //检查蓝色球的数字不能大于16 最后一个为蓝色球
    assert!((balls[length-1]<=16) && balls[length-1]>0,1);

    let win_balls = generate_win_numbers(rand,ctx);

    let (isWin,reward_level) = check_is_win(&balls,win_balls);
   

    let in_balance = balance::split(coin::balance_mut(pay_coin), game.ticket);
    balance::join(&mut game.balance, in_balance);
    let mut msg:String = string::utf8(b"");

    if(isWin){
      let mut num = 0;
      if(reward_level==1){
        num = game.reward;
        msg = string::utf8(b"恭喜，您获得一等奖，获得所有奖励！");
      }else if(reward_level==2){
        num = game.reward/100*70; //奖金70%
        msg = string::utf8(b"恭喜，您获得二等奖，获得70%的奖励！");
      }else if(reward_level==3){
        num = game.reward/2; //奖金50%
        msg = string::utf8(b"恭喜，您获得三等奖，获取得50%的奖励！");
      }else if(reward_level==4){
        num = game.reward/100*20; //奖金20%
        msg = string::utf8(b"恭喜，您获得四等奖，获取得20%的奖励！");
      }else if(reward_level==5){
        num = 2000; //奖金2000NB
        msg = string::utf8(b"恭喜，您获得五等奖，获取得2000NB！");
      }else if(reward_level==6){
        num = 1500; //奖金1500NB
        msg = string::utf8(b"恭喜，您获得六等奖，获取得1500NB！");
      };

      let win_balance = balance::split(&mut game.balance, num);
      let win_coin = coin::from_balance(win_balance, ctx);
      transfer::public_transfer(win_coin, ctx.sender());
    }else{
      msg = string::utf8(b"很遗憾,您没有中奖！");
    };

    let uid = object::new(ctx);
    let id = object::uid_to_inner(&uid);
    let payerRecord = GameRecord{
      id:uid,
      balls,
      player:ctx.sender(),
      win_balls,
      is_win:isWin,
    };
    event::emit( EventMessgage{
        code:if(isWin)0 else 1,
        message:msg,
        record_id:id
    });
    transfer::transfer(payerRecord,ctx.sender());
  }


  fun generate_win_numbers(rand: &Random,ctx:&mut TxContext):vector<u64>{
    let mut balls:vector<u64> = vector::empty();
    let mut i=0;
    //生成红色球号码
    while(i < 6){
      i=i+1;
      let mut num = get_random(33,rand,ctx);
      if(vector::contains(&balls,&num)){
        num = get_random(33,rand,ctx);
      };
      vector::push_back(&mut balls,num);
    };

    //生成蓝色球号码
    let mut num = get_random(16,rand,ctx);
    if(vector::contains(&balls,&num)){
      num = get_random(16,rand,ctx);
    };
    vector::push_back(&mut balls,num);

    balls
  }

  fun get_random(max:u64,rand: &Random,ctx:&mut TxContext) : u64 {
    let mut gen = random::new_generator(rand, ctx);
    random::generate_u64_in_range(&mut gen, 1, max)
  }
  
  fun check_is_win(bet_balls: &vector<u64>,win_balls:vector<u64>):(bool,u64){
    let length = vector::length(bet_balls);
    let mut i=0;
    let mut red_win_num=0;
    while(i < length){
      if(bet_balls[i] == win_balls[i]){
        red_win_num = red_win_num+1;
      };
      i=i+1;
    };
    let blue_win:bool = bet_balls[length-1] == win_balls[length-1];
    let mut _reward_level = 0;
    if(red_win_num==6 && blue_win){ //一等奖 获得所有奖励
      _reward_level = 1;
    }else if(red_win_num==6 && !blue_win){ // 二等奖 获得70%的奖励
      _reward_level =2;
    }else if(red_win_num==5 && blue_win){ // 三等奖取得50%的奖励
      _reward_level =3;
    }else if((red_win_num==4 && blue_win) || (red_win_num==5 && !blue_win)){ // 四等奖 获得 20%的奖励
      _reward_level =4;
    }else if((red_win_num==3 && blue_win) || (red_win_num==4 && !blue_win)){ // 五个等奖 获得2000个币奖励
      _reward_level =5;
    }else if((red_win_num==2 && blue_win) || (red_win_num==1 && blue_win)){ //六等奖 获得1500个币奖励
      _reward_level =6;
    }else{ //未中奖
      _reward_level =0;
    };
    (
      _reward_level>0,
      _reward_level
    )
  }


  public entry fun deposit(game: &mut Game, in: Coin<FAUCET_COIN>) {
      let in_balance = coin::into_balance(in);
      balance::join(&mut game.balance, in_balance);
  }

  public entry fun withdraw(_: &AdaminCap, game: &mut Game, amt: u64, ctx: &mut TxContext) {
      let win_balance = balance::split(&mut game.balance, amt);
      let win_coin = coin::from_balance(win_balance, ctx);
      transfer::public_transfer(win_coin, ctx.sender());
  }
}
