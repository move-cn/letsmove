module task2::fcoin {
    use std::option;
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct FCOIN has drop {}

    fun init(witness: FCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6, 
            b"FCOIN", 
            b"FC", 
            b"faucet coin for test", 
            option::none(), 
            ctx
        );
        // freeze the currency
        transfer::public_freeze_object(metadata);
        // transfer the treasury to the sender
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<FCOIN>, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, 1000000, ctx);
        transfer::public_transfer(coin, recipient)
    }
}
