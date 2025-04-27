
module flip_coin::flip_coin;
use my_coin::faucetcoin::FAUCETCOIN;
use std::string::String;
use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::Coin;
use sui::object;
use sui::random;
use sui::random::Random;
use sui::sui::SUI;
use sui::transfer;
use sui::transfer::{share_object, public_transfer,transfer};


public  struct Game has key{
    id:UID,
    amt:Balance<FAUCETCOIN>
}

public struct AdminCap has key{
    id:UID,
    name:String,
}


fun init(ctx:&mut TxContext){
    let game =Game{
        id:object::new(ctx),
        amt:balance::zero<FAUCETCOIN>(),
    };
    share_object(game);
    let admin = AdminCap{
        id: object::new(ctx),
        name:b"FFclever".to_string()
    };
    transfer(admin,ctx.sender());
}




entry fun play(game:&mut Game,rand:&Random, in:bool, in_coin:Coin<FAUCETCOIN>, ctx: &mut TxContext){

    let amt_value = in_coin.value();
    let game_amt =balance::value(&game.amt);
    assert!(game_amt >= amt_value*10,0x111);

    let mut gen = random::new_generator(rand,ctx);
    let flip_value=random::generate_bool(&mut gen);

    if(in==flip_value){
    let out_blance  =game.amt.split(amt_value);
        let out_coin =coin::from_balance(out_blance,ctx);
        public_transfer(out_coin,ctx.sender());
        public_transfer(in_coin,ctx.sender());
    }else{
        let in_amt_balance=coin::into_balance(in_coin);
        game.amt.join(in_amt_balance);

    }

}


public entry fun add_sui(game:&mut Game,in:Coin<FAUCETCOIN>,ctx:&mut TxContext){
    let in_amt_balance=coin::into_balance(in);
    game.amt.join(in_amt_balance);

}

public entry fun remove_sui(_:&AdminCap,game: &mut Game,amt:u64,ctx:&mut TxContext){
    let out_balance =game.amt.split(amt);
    let out_coin=coin::from_balance(out_balance,ctx);
    public_transfer(out_coin,ctx.sender());
}