/// Module: task2
module task2::SOONOGO_FAUCET_COIN {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};    
    use sui::url::{Url,Self};

    public struct SOONOGO_FAUCET_COIN has drop {}

    fun init(witness: SOONOGO_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency( witness, 8, b"Soonogo faucet", b"Soonogo's faucet coin", b"Soonogo's faucet coin", option::none(), ctx );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }


    public fun mint(
        treasury_cap: &mut coin::TreasuryCap<SOONOGO_FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

}