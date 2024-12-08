/*
/// Module: my_game
module my_game::my_game;
*/
module my_game::my_game;
use my_coin::jethro_coin::{JETHRO_COIN};
use sui::balance;
use sui::random::{Self, Random, RandomGenerator};
use sui::balance::Balance;
use sui::coin::{Self, Coin};

public struct GameCap has key{
    id: UID,
}

public struct JethrozzGame has key {
    id: UID,
    amt: Balance<JETHRO_COIN>,
}


fun init(ctx: &mut TxContext){
    let game_cap = GameCap {
        id: object::new(ctx),
    };
    let game = JethrozzGame {
        id: object::new(ctx),
        amt: balance::zero(),
    };
    transfer::share_object(game);
    //权限校验
    transfer::transfer(game_cap, ctx.sender());
}
//石头剪刀布 3：石头，2：剪刀 1：布

entry fun play(in: u8, rand: &Random, in_amt: Coin<JETHRO_COIN>, game: &mut JethrozzGame,ctx: &mut TxContext){
    //输入合法校验
    assert!(in > 4, 0x001);

    let in_amt_value = in_amt.value();
    let game_amt_value = game.amt.value();
    //输入的钱必须大于池子的钱的10分之1
    assert!(game_amt_value >= (in_amt_value * 10 ), 0x002);

   let mut generator: RandomGenerator = random::new_generator(rand, ctx);
   let game_rand = random::generate_u8_in_range(&mut generator, 1, 3);

    if((game_rand > in && game_rand - in == 1) || (in < game_rand && game_rand - in == 2)){
        //石头 beats 剪刀
        //剪刀 beats 布
        // 布 beats 石头
        //从池子中取出来
        let out_balance :Balance<JETHRO_COIN> = game.amt.split(in_amt_value);
        //转换成COIN
        let out_coin = coin::from_balance(out_balance, ctx);
        //将这个COIN转账给发起者
        transfer::public_transfer(out_coin, ctx.sender());
        //退回原来的钱
        transfer::public_transfer(in_amt, ctx.sender());
    }else {
        //输了
        let in_amt_balance = coin::into_balance(in_amt);
        game.amt.join(in_amt_balance);
    }
}

public entry fun add_coin(game: &mut JethrozzGame, coin :Coin<JETHRO_COIN>, _: &mut TxContext){
    let balance = coin::into_balance(coin);
    game.amt.join(balance);
}

public entry fun remove_coin(_: &GameCap, game: &mut JethrozzGame, amt: u64, ctx : &mut TxContext){
    let balance = game.amt.split(amt);
    //转换成COIN
    let coin = coin::from_balance(balance, ctx);
    transfer::public_transfer(coin, ctx.sender())
}