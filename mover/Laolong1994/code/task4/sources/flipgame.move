/*
/// Module: task4
module task4::task4;
*/

/// Module: task4
module task4::flipgame;
use sui::balance;
use sui::balance::Balance;
use sui::coin::{Coin, from_balance, into_balance};
use sui::random;
use sui::random::Random;
use sui::sui::SUI;
use sui::transfer::{share_object, public_transfer, transfer};
use sui::tx_context::sender;

public struct Game has key{
    id : UID,
    amt: Balance<SUI>
}

public struct AdminCap has key{
    id : UID
}

fun init(ctx:&mut TxContext){
    let game = Game{
        id : object::new(ctx),
        amt : balance::zero()

    };
    share_object(game);

    let admin = AdminCap{
        id : object::new(ctx)
    };

    transfer(admin,ctx.sender())

}

entry fun play(game : &mut Game , in:bool,in_coin:Coin<SUI>,rand:& Random,ctx:&mut TxContext){

    let amt_value = in_coin.value();
    let game_amt = game.amt.value();
    assert!(game_amt >= amt_value*10,0x111);
    let mut gen = random::new_generator(rand,ctx);
    let mut flip_value = random::generate_bool(&mut gen);

    if (in == flip_value){
        let out_balance = game.amt.split(amt_value);
        let out_coin = from_balance(out_balance,ctx);

        public_transfer(out_coin,ctx.sender());
        public_transfer(in_coin,ctx.sender());
    }else{
        let in_amt_balance = into_balance(in_coin);
        game.amt.join(in_amt_balance);

    }
}

public entry fun add_sui(game:&mut Game,in:Coin<SUI>,_:&mut TxContext){
    let in_balance = into_balance(in);
    game.amt.join(in_balance);
}

public entry fun remove_sui(_:&AdminCap,game: & mut Game,amt:u64,ctx : &mut TxContext){

    let out_balance = game.amt.split(amt);
    let out_coin = from_balance(out_balance,ctx);
    public_transfer(out_coin,ctx.sender());


}