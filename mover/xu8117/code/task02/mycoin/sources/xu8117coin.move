module mycoin::xu8117coin {
    use std::option;

    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{sender, TxContext};

    public struct XU8117COIN has drop {}

    fun init(otw: XU8117COIN, ctx: &mut sui::tx_context::TxContext) {
        let (treasury, metadata) = coin::create_currency(
            otw,
            8,
            b"XU8117COIN",
            b"",
            b"",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, sender(ctx));
    }

    public fun mint(
        treasury: &mut TreasuryCap<XU8117COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }

    public fun burn(treasury: &mut TreasuryCap<XU8117COIN>, coin: Coin<XU8117COIN>) {
        coin::burn(treasury, coin);
    }
}
