/*
/// Module: faucetcoin
module faucetcoin::faucetcoin;
*/
module faucetcoin::raynor_faucet_coin{
    use sui::coin::{Self,TreasuryCap};

    public struct RAYNOR_FAUCET_COIN has drop {}

    fun init(witness:RAYNOR_FAUCET_COIN, ctx:&mut TxContext){
        let (treasury, metadata) = coin::create_currency(witness, 6, b"RFC", b"raynor faucet coin", b"faucetcoin", option::none(), ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public fun mint(treasury_cap:&mut TreasuryCap<RAYNOR_FAUCET_COIN>, amount:u64, recipient:address, ctx:&mut TxContext){
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}