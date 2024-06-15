module 0x0::Xemold_coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct XEMOLD_COIN has drop {}

    fun init(witness: XEMOLD_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<XEMOLD_COIN>(
            witness,
            2,
            b"Xemold_COIN",
            b"hhh",
            b" ",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<XEMOLD_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<XEMOLD_COIN>, coin: Coin<XEMOLD_COIN>) {
        coin::burn(treasury_cap, coin);
    }

}
