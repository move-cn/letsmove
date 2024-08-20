module my_coin::my_coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = 
        coin::create_currency<MY_COIN>(
            witness, 
            6, 
            b"MY_COIN", 
            b"KFC", 
            b"V me 50", 
            option::none(), 
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<MY_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<MY_COIN>, coin: Coin<MY_COIN>) {
      coin::burn(treasury_cap, coin);
    }

}