module maybeok_game::maybeok_game;
use my_coin::maybeOk_Faucet::{Self, MAYBEOK_FAUCET};
use sui::coin::{Self,Coin,into_balance,from_balance};
use sui::balance::{Self,Balance};
use sui::random::{Self, Random};
use sui::transfer::{share_object, public_transfer, transfer};



public struct Game has key{
    id:UID,
    amt:Balance<MAYBEOK_FAUCET>
}


public struct AdminCap has key{
    id:UID,
}

fun init(ctx: &mut TxContext){
    let game = Game{
        id:object::new(ctx),
        amt:balance::zero(),
    };

    let admin=AdminCap{id:object::new(ctx)};
    transfer(admin,ctx.sender());

    share_object(game);
}

entry fun play(game:&mut Game,rand: &Random,in: bool , in_amt: Coin<MAYBEOK_FAUCET> , ctx: &mut TxContext){

    let amt_value: u64=in_amt.value();
    let game_amt:u64=game.amt.value();

    assert!(game_amt>amt_value*10,0);

    let mut gen=random::new_generator(rand,ctx);
    let flip_value : bool =random::generate_bool(&mut gen);

    if(in== flip_value){
        let out_balance=game.amt.split(amt_value);
        let out_coin=coin::from_balance(out_balance,ctx);
        public_transfer(out_coin,ctx.sender());
        public_transfer(in_amt,ctx.sender());

    }else{
        let in_amt_balance=coin::into_balance(in_amt);
        game.amt.join(in_amt_balance);
    }

}

public entry fun add_maybeok(game: &mut Game,in:Coin<MAYBEOK_FAUCET>, _: &mut TxContext){
    let in_amt_balance=coin::into_balance(in);
    game.amt.join(in_amt_balance);
}

public entry fun  remove_maybeok(_:&AdminCap,game: &mut Game, out_coin:u64,ctx: &mut TxContext){
    
    let game_amt:u64=game.amt.value();
    assert!(game_amt>out_coin,0);

    let out_balance=game.amt.split(out_coin);
    let out=coin::from_balance(out_balance,ctx);

    public_transfer(out,ctx.sender());
}