module task2::MYCOIN {
    use std::option;
    use sui::coin::{Self, TreasuryCap,Coin};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct MYCOIN has drop {}

    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6, 
            b"SimonSui", 
            b"Simon", 
            b"simon sui for test", 
            option::none(), 
            ctx
        );
        // freeze the currency
        transfer::public_freeze_object(metadata);
        // transfer the treasury to the sender
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<MYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<MYCOIN>, coin: Coin<MYCOIN>){
        coin::burn(treasury_cap,coin);
    }


}



