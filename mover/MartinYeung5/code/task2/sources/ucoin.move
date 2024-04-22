module fungible_tokens::ucoin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct UCOIN has drop {}

    fun init(witness: UCOIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<UCOIN>(witness, 2, b"UCOIN", b"UPC", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<UCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public fun burn(treasury_cap: &mut TreasuryCap<UCOIN>, coin: Coin<UCOIN>) {
        coin::burn(treasury_cap, coin);
    }

}