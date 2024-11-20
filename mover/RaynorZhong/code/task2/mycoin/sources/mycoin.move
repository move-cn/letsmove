/*
/// Module: mycoin
module mycoin::mycoin;
*/
module mycoin::raynor_coin{
    use sui::coin::{Self,TreasuryCap};

    public struct RAYNOR_COIN has drop {}

    fun init(witness:RAYNOR_COIN, ctx:&mut TxContext){
        let (treasury, metadata) = coin::create_currency(witness, 6, b"RC", b"raynor coin", b"mycoin", option::none(), ctx);
        
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public fun mint(treasury_cap:&mut TreasuryCap<RAYNOR_COIN>, amount:u64, recipient:address, ctx:&mut TxContext){
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}