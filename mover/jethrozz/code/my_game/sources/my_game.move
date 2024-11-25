/*
/// Module: my_game
module my_game::my_game;
*/
module my_game::my_game;
use my_coin::jethro_coin::{JETHRO_COIN};
use sui::coin::Coin;

public struct GameCap has key{
    id: UID,
}

public struct MyGame has key {
    id: UID,
    balance: Coin<JETHRO_COIN>,
}


fun init(ctx: &mut TxContext){
    let game_cap = GameCap {
        id: object::new(ctx),
    };
    let my_game = MyGame {
        id: object::new(ctx),
        balance: Coin::new(0, JETHRO_COIN),
    };
}