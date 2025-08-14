/// Module: facuet
module csdv_coin::csdv_faucet {

    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct CSDV_FAUCET has drop {}

    fun init(witness: CSDV_FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6,
            b"CSDV FAUCET", 
            b"CSDV FAUCET", 
            b"CSDV FAUCET", 
            option::none(), 
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
    }

    public fun mint(treasury_cap: &mut TreasuryCap<CSDV_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}