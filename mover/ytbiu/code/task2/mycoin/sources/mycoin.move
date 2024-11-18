/*
/// Module: mycoin
module mycoin::mycoin;
*/
module mycoin::mycoin {
    use sui::coin::{Self,TreasuryCap};

    public struct MYCOIN has drop{}

    fun init(witness: MYCOIN,ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"MYC", b"ytbiu my coin", b"ytbiu my coin", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury,tx_context::sender(ctx));
    }

    public entry fun mint(cap : &mut TreasuryCap<MYCOIN>, amount: u64, to: address, ctx: &mut TxContext){
        let minted_coint = coin::mint(cap, amount,ctx);
        transfer::public_transfer(minted_coint, to);
    }
}
