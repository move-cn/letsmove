module my_coin::a_sky_person_coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Url,Self};

    public struct A_SKY_PERSON_COIN has drop {}

    fun init(witness: A_SKY_PERSON_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<A_SKY_PERSON_COIN>(
            witness,
            6,
            b"A_SKY_PERSON_COIN",
            b"A_SKY_PERSON_COIN",
            b"I love A_SKY_PERSON_COIN. I love blockchains.",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<A_SKY_PERSON_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<A_SKY_PERSON_COIN>, coin: Coin<A_SKY_PERSON_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}
