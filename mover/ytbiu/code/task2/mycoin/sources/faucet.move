/*
/// Module: mycoin
module mycoin::mycoin;
*/
module mycoin::faucet {
    use sui::coin::{Self,TreasuryCap};

    public struct FAUCET has drop{}

    fun init(witness: FAUCET,ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"MYC", b"ytbiu my coin", b"ytbiu my coin", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(cap : &mut TreasuryCap<FAUCET>, amount: u64, to: address, ctx: &mut TxContext){
        coin::mint_and_transfer(cap, amount,to,ctx);
    }
}
