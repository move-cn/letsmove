module mycoin::mycoin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct MYCOIN has drop {}

    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MYCOIN>(
            witness, 
            9, 
            b"MYCOIN", 
            b"My Test Coin", 
            b"A test coin for faucet", 
            option::none(), 
            ctx
        );
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        transfer::public_freeze_object(metadata);
    }
} 