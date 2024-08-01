/// Module: coinfacet
module coinfacet::coinfacet {

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
/*
Package: 
0x7840c8e3c523f0a2f4e8795ff7ab8269eeda12be297b54f9ed9ce80aa178bccb


TreasuryCap:
0x8d9061370db68049ef268ac8c9566f15b827a1dfbe19332872db45477af6cb94     
ObjectType: 0x2::coin::TreasuryCap<0x7840c8e3c523f0a2f4e8795ff7ab8269eeda12be297b54f9ed9ce80aa178bccb::coinfacet::COINFACET>    

CoinMetadata: 
0x46e95586f401866658384d5bfa363c49a886d25edcd95376ba7032b0272fbf45
ObjectType: 0x2::coin::CoinMetadata<0x7840c8e3c523f0a2f4e8795ff7ab8269eeda12be297b54f9ed9ce80aa178bccb::coinfacet::COINFACET>  
*/
