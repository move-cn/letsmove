module mygame::mygame;
use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::Coin;
use sui::random;
use sui::random::Random;
use sui::transfer::{share_object, public_transfer, transfer};

public struct Game_dryan07<phantom T> has key{
    id:UID,
    // 合约存钱用Balance
    poolBal:Balance<T>
}

public struct AdminCap has key{
    id:UID,
}

fun init(_ctx: &mut TxContext){

}

entry fun creat_game<T>(ctx: &mut TxContext) {
    let game = Game_dryan07{
        id:object::new(ctx),
        poolBal:balance::zero<T>(),
    };

    // 所有人都可以玩
    share_object(game);

    let admin = AdminCap{
        id:object::new(ctx)
    };
    transfer(admin, ctx.sender());
}

entry fun play<T>(game:&mut Game_dryan07<T>,rand: &Random, in: bool, in_coin:Coin<T>, ctx: &mut TxContext){
    // 正面 反面
    let amt_value = in_coin.value();
    let game_amt = balance::value(&game.poolBal);
    // 用户输入值必须小于池子里面的钱
    // 避免连续玩10次掏空池子, 每次最多下注池子的1/10
    assert!(game_amt >= amt_value * 10, 0x991);

    let mut gen = random::new_generator(rand, ctx);
    let flip_value = random::generate_bool(&mut gen);

    if (in == flip_value){
        // 赢了加倍
        let out_balance = game.poolBal.split(amt_value);
        let out_coin = coin::from_balance(out_balance, ctx);
        public_transfer(out_coin, ctx.sender());
        public_transfer(in_coin, ctx.sender());
    }else{
        // 输了归零
        let in_amt_balance = coin::into_balance(in_coin);
        game.poolBal.join(in_amt_balance);
    }
}

public entry fun addPool<T>(game: &mut Game_dryan07<T>, in:Coin<T>, _:&mut TxContext){
    let in_amt_balance = coin::into_balance(in);
    game.poolBal.join(in_amt_balance);
}

public entry fun removePool<T>(_:&AdminCap, game:&mut Game_dryan07<T>, amt:u64, ctx:&mut TxContext){
    let out_balance = game.poolBal.split(amt);
    let out_coin = coin::from_balance(out_balance, ctx);
    public_transfer(out_coin, ctx.sender());
}