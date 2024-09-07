/// Module: coinfacet
module game::coinfacet {

    use sui::coin::{Self, TreasuryCap};
    use sui::tx_context::TxContext;

    public struct COINFACET has drop {}

    fun init(witness: COINFACET, ctx: &mut TxContext) {
        let (mint_id, metadata) = coin::create_currency(witness, 6, b"COINFACET", b"", b"", std::option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(mint_id)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<COINFACET>, 
        ctx: &mut TxContext,
    ) {
        let coinfacet_coin = coin::mint(treasury_cap, 10000000, ctx);
        transfer::public_transfer(coinfacet_coin, tx_context::sender(ctx))
    }

}