module my_coin::a_aaron_cheng_hao {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Url,Self};

    public struct A_AARON_CHENG_HAO has drop {}

    public fun init(witness: A_AARON_CHENG_HAO, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<A_AARON_CHENG_HAO>(
            witness,
            6,
            b"A_AARON_CHENG_HAO",
            b"A_AARON_CHENG_HAO",
            b"I love A_AARON_CHENG_HAO. I love blockchains.",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<A_AARON_CHENG_HAO>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<A_AARON_CHENG_HAO>, coin: Coin<A_AARON_CHENG_HAO>) {
        coin::burn(treasury_cap, coin);
    }
}
