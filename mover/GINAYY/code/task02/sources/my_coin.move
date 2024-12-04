/// Module: my_coin
module task02::my_coin {
    // use std::option;
    use sui::coin::{Self,Coin,TreasuryCap};
    // use sui::transfer;
    // use sui::tx_context::{Self, TxContext};

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut sui::tx_context::TxContext) {
        let (treasuryCap, metadata) = coin::create_currency(
            witness, 
            9,
            b"GINAYY_COIN", 
            b"GINAYY", 
            b"GINAYY token", 
            option::none(), 
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasuryCap, tx_context::sender(ctx));
    }

    public entry fun mint(treasuryCap: &mut TreasuryCap<MY_COIN>, value: u64, recipient: address, ctx: &mut TxContext) {
       coin::mint_and_transfer(treasuryCap, value, recipient, ctx);
    }

     public entry fun burn(treasuryCap: &mut TreasuryCap<MY_COIN>, coin : Coin<MY_COIN>, _ctx: &mut TxContext) {
        coin::burn(treasuryCap, coin);
    }
}
