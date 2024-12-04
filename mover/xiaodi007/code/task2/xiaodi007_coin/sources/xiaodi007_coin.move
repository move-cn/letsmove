/*
/// Module: xiaodi007_coin
module xiaodi007_coin::xiaodi007_coin {

}
*/


module xiaodi007_coin::xiaodi_coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct XIAODI_COIN has drop {}

    fun init(witness: XIAODI_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<XIAODI_COIN>(
            witness,
            2,
            b"XIAODI_COIN",
            b"NB",
            b"best coin in the world",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<XIAODI_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<XIAODI_COIN>, coin: Coin<XIAODI_COIN>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(XIAODI_COIN {}, ctx);
    }
}