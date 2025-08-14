/// Module: task2
module task2::SOONOGOCOIN {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};    
    use sui::url::{Url,Self};

    public struct SOONOGOCOIN has drop {}

    fun init(witness: SOONOGOCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency( witness, 8, b"Soonogo", b"Soonogo's coin", b"Soonogo's coin", option::none(), ctx );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }


    public entry fun mint(
        treasury_cap: &mut coin::TreasuryCap<SOONOGOCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

}