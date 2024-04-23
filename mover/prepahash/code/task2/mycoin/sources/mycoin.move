module mycoin::prepahash_coin {
    use std::option;
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct PREPAHASH_COIN has drop {}

    fun init(witness: PREPAHASH_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 5, b"PREPAHASH_COIN", b"PB", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<PREPAHASH_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}