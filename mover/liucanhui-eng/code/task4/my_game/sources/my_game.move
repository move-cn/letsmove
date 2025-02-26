module my_game::my_game;
use std::string;
use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::{Coin, from_balance, into_balance};
use sui::random;
use sui::random::Random;
use sui::transfer::{share_object,transfer, public_transfer};
use sui::tx_context::sender;
use rmb::rmb::RMB;

//游戏池子
public struct MyGame has key{
    id:UID,
    amount : Balance<RMB>,
    //作者
    author : string::String
}

//管理员权限
public struct AdminCap has key{
    id:UID
}


//初始化方法创建池子，并且创建管理员权限
fun init(ctx : &mut TxContext){
    let game = MyGame{
        id : object::new(ctx),
        amount: balance::zero(),
        author : b"liucanhui-eng".to_string()
    };
    share_object(game);

    let admin = AdminCap{
        id : oobject::new(ctx)
    };
    transfer(admin,sender(ctx))
}

const INSUFFICIENT_BALANCE_ERROR:u64 = 500;

entry fun play (game : &mut MyGame,input : bool,pay_coin : Coin<RMB>,rand:&Random,ctx : &mut TxContext){
    let pay_value = pay_coin.value();
    let game_balance = game.amount.value();
    if(pay_value > (game_balance/10)){
        abort INSUFFICIENT_BALANCE_ERROR
    };
    let mut gen = random::new_generator(rand,ctx);
    let random_b = gen.generate_bool();

    if (random_b == input){//user win
        let win_balance = game.amount.split(pay_value);
        let win_coin = from_balance<RMB>(win_balance,ctx);
        public_transfer(win_coin,sender(ctx));
        public_transfer(pay_coin,sender(ctx));
    }else {// user lose
        let lose_balance = pay_coin.into_balance();
        game.amount.join(lose_balance);
    }
}


public entry fun withdraw(_:&AdminCap,game : &mut MyGame,withdraw_value : u64,ctx : &mut TxContext){
    let game_balanc_value = game.amount.value();
    if(withdraw_value > game_balanc_value){
        abort INSUFFICIENT_BALANCE_ERROR
    };

    let withdraw_coin = coin::from_balance(game.amount.split(withdraw_value),ctx);
    public_transfer(withdraw_coin,sender(ctx))
}

public entry fun deposit(_:&AdminCap,game : &mut MyGame,deposit_coin : Coin<RMB>,_: &mut TxContext){
    game.amount.join(into_balance(deposit_coin));
}




