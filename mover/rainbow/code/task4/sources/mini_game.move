//模拟双色球下注 小游戏
module mini_game::mini_game {
  use sui::coin::{Self,Coin};
  use std::string::{Self,String};
  use sui::event;
  use sui::balance::{Balance};
  use sui::random::{Self,Random};
  use faucet_coin::faucet_coin::{FAUCET_COIN};
  

  public struct Game  has key {
      id: UID,
      val: Balance<FAUCET_COIN>
  }

  public struct AdaminCap has key {
      id: UID
  }

  public struct EventMessgage has copy,drop{
    code:u64,
    message:String,
  }

  const BetBallMaxNumberLimit:u64 = 0;

  fun init(ctx:&mut TxContext){
    
    
  }

  //双色球游戏
  public entry fun bet(balls:&mut vector<u64>,rand: &Random,ctx:&mut TxContext){
    assert!((vector::length(balls)==7),BetBallMaxNumberLimit);
    let mut i:u64=0;
    let length = vector::length(balls);

    //检验红色球的数字不能大于33 前6个是红色球
    while(i < (length-1)){
      i=i+1;
      assert!((balls[i]<=33 && balls[i]>0),1);
    };
    //检查蓝色球的数字不能大于16 最后一个为蓝色球
    assert!((balls[length-1]<=16) && balls[length-1]>0,1);
    let win_balls = generate_win_numbers(rand,ctx);
    check_is_win(balls,win_balls)
    
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
  
  fun check_is_win(bet_balls: &vector<u64>,win_balls:vector<u64>){
    let length = vector::length(bet_balls);
    let i=0;
    let mut red_win_num=0;
    while(i < length){
      if(bet_balls[i] == win_balls[i]){
        red_win_num = red_win_num+1;
      }
    };
    let blue_win:bool = bet_balls[length-1] == win_balls[length-1];
    
    let mut code = 0;
    let mut msg = b"";
    if(red_win_num==6 && blue_win){ //一等奖 获得所有奖励
      code=0;
      msg=b"恭喜🎉，您获得一等奖，获得所有奖励！";
    }else if(red_win_num==6 && !blue_win){ // 二等奖 获得70%的奖励
      code=0;
      msg=b"恭喜🎉，您获得二等奖，获得70%的奖励！";
    }else if(red_win_num==5 && blue_win){ // 三等奖取得50%的奖励
      code=0;
      msg=b"恭喜🎉，您获得三等奖，获取得50%的奖励！";
    }else if((red_win_num==4 && blue_win) || (red_win_num==5 && !blue_win)){ // 四等奖 获得 20%的奖励
      code=0;
      msg=b"恭喜🎉，您获得四等奖，获取得20%的奖励！";
    }else if((red_win_num==3 && blue_win) || (red_win_num==4 && !blue_win)){ // 五个等奖 获得20个币奖励
      code=0;
      msg=b"恭喜🎉，您获得五等奖，获取得20NB！";
    }else if((red_win_num==2 && blue_win) || (red_win_num==1 && blue_win)){ //六等奖 获得15个币奖励
      code=0;
      msg=b"恭喜🎉，您获得六等奖，获取得15NB";
    }else{ //未中奖
      code=1;
      msg=b"很抱歉，您未中奖";
    };
    event::emit(EventMessgage{
      code,
      message:string::utf8(msg),
    });
  }


  fun balance_transfer(from_wallet: &mut Coin<FAUCET_COIN>,amount:u64,to_wallet: &mut Coin<FAUCET_COIN>,ctx:&mut TxContext){
    let _self = coin::balance_mut(from_wallet);
    let coin = coin::from_balance(
      balance::split(_self, amount)
      , 
      ctx);
    coin::join( to_wallet, coin);
  }
}
