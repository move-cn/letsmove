
module flip_coin::flip_coin;

use sui::balance;
use sui::balance::Balance;
use sui::coin;
use handsomepuddingfaucet::handsomepuddingfaucet::{HANDSOMEPUDDINGFAUCET};
use sui::coin::Coin;
use sui::random::Random;
use sui::random;
use sui::transfer::{share_object, public_transfer, transfer};

public struct Game has key {
    id : UID,
    value: Balance<HANDSOMEPUDDINGFAUCET>
}

public struct AdminCap has key {
    id : UID
}

fun init(ctx: &mut TxContext){
    let game = Game{
        id : object::new(ctx),
        value: balance::zero(),
    };
    share_object(game);

    let admin = AdminCap{
        id : object::new(ctx)
    };
    transfer(admin, ctx.sender())
}

entry fun play(game: &mut Game, rand: &Random , in:bool, in_value : Coin<HANDSOMEPUDDINGFAUCET>, ctx: &mut TxContext){
    let amt_value = in_value.value();
    let game_amt = game.value.value();

    if(game_amt >= amt_value * 10){
        abort 0x111
    };

    let mut gen = random::new_generator(rand, ctx);

    let bool = random::generate_bool(&mut gen);

    if(in == bool){
        //玩家赢了
        let out_balance = game.value.split(amt_value);
        let out_coin = coin::from_balance(out_balance, ctx);

        public_transfer(in_value, ctx.sender());
        public_transfer(out_coin, ctx.sender());
    }else{
        //玩家输了
        let in_balance = coin::into_balance(in_value);
        game.value.join(in_balance);
    }

}


public entry fun add_coin(game: &mut Game, in: Coin<HANDSOMEPUDDINGFAUCET>, _: &mut TxContext){
    let in_amt_balance = coin::into_balance(in);
    game.value.join(in_amt_balance);
}

public entry fun remove_coin(_: &AdminCap, game: &mut Game, amt: u64, ctx: &mut TxContext){
    let out_balance = game.value.split(amt);
    let out_coin = coin::from_balance(out_balance, ctx);
    public_transfer(out_coin, ctx.sender());
}


