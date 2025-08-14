/// Module: coinfacet
module coinfacet::coinfacet {

    use sui::coin::{Self, TreasuryCap};
    use sui::tx_context::TxContext;
    use sui::transfer;

    public struct COINFACET has drop {}

    fun init(witness: COINFACET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = 
        coin::create_currency(
            witness, 
            6, 
            b"COINFACET", 
            b"KFC", 
            b"V me 50", 
            option::none(), 
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

     public entry fun mint(treasury_cap: &mut TreasuryCap<COINFACET>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

}