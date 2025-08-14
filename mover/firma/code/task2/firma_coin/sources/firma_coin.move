
// Module: firma_coin
#[allow(duplicate_alias)]
module firma_coin::firma_coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    public struct FIRMA_COIN has drop {}
    fun init(witness: FIRMA_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"FIRAM COIN",           // symbol
            b"FIRAM COIN",       // name
            b"Amazing Coin", // description
            option:: none(),   // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FIRMA_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<FIRMA_COIN>, coin: Coin<FIRMA_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}

