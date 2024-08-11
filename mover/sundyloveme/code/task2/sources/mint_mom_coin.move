/// Module: mint_mom_coin
module mint_mom_coin::mint_mom_coin {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct MINT_MOM_COIN has drop {}

    fun init(witness: MINT_MOM_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MINT_MOM_COIN>(
            witness,
            6,
            b"MINT_MOM_COIN",
            b"MINT_MOM_COIN",
            b"I love my mon, so mint mom coin...",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<MINT_MOM_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<MINT_MOM_COIN>,
        coin: Coin<MINT_MOM_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}
