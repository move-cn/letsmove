/*
/// Module: flip_coin
module flip_coin::flip_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions
module flip_coin::flip_coin;


// === Imports ===
use sui::balance;
use sui::random;
use sui::random::Random;
use sui::balance::Balance;
use sui::sui::SUI;
use sui::transfer::{share_object,public_transfer};
use sui::coin;
use sui::coin::Coin; 
// === Errors ===

// === Constants ===

// === Structs ===

public struct Game has key {
    id: UID,
    amt: Balance<SUI>,
    admin: address, 
}

// === Events ===

// === Method Aliases ===
fun init(ctx:&mut TxContext){
    let game = Game{
        id:object::new(ctx),
        amt:balance::zero<SUI>(),
        admin: ctx.sender(), // 初始化管理员字段
    };
    share_object(game);
}

// === Public Functions ===
entry fun play(game:&mut Game, rand:&Random, in:bool, in_coin:Coin<SUI>, ctx:&mut TxContext){
    let amt_value =in_coin.value();
    let game_amt = game.amt.value();

    assert!(game_amt >=amt_value * 10,0x111);
    let mut gen=random::new_generator(rand,ctx);
    let flip_value = random::generate_bool(&mut gen);
    // 因为Coin是一个资源，所以需要先判断是否是flip_value，如果是，需要先将coin转换为balance，再进行split操作
    // Coin没有drop方法，所以需要手动释放
    if (in == flip_value) {
        let out_balance: Balance<SUI> = game.amt.split(amt_value);
        let out_coin: Coin<SUI> = coin::from_balance(out_balance, ctx);
        public_transfer(out_coin, ctx.sender());
        public_transfer(in_coin, ctx.sender());
    } else {
        let in_amt_balance = coin::into_balance(in_coin);
        game.amt.join(in_amt_balance);
    }
}

/// Add SUI to the game
entry fun add_sui(game: &mut Game, in:Coin<SUI>, _: &mut TxContext){
    let in_amt_balance:Balance<SUI> = coin::into_balance(in);
    game.amt.join(in_amt_balance);
}



// === View Functions ===

// === Admin Functions ===

entry fun remove_sui(game:&mut Game, amt:u64, ctx : &mut TxContext){
    assert!(ctx.sender() == game.admin, 0x112);

    let out_balance  = game.amt.split(amt);
    let out_coin = coin::from_balance(out_balance,ctx);
    public_transfer(out_coin,ctx.sender());
}
// === Package Functions ===

// === Private Functions ===

// === Test Functions ===


