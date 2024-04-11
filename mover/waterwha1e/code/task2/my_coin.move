module my_coin::selfcoin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct SELFCOIN has drop {}

    fun init(witness: SELFCOIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<SELFCOIN>(witness, 6, b"SELFCOIN", b"SC", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata); 
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));    
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<SELFCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }
}
