/*
/// Module: faucet_coin
module faucet_coin::faucet_coin {

}
*/

module faucet_coin::guinjgidafaucet {
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin, TreasuryCap};
    use std::option;
    use sui::transfer;

    public struct GUINJGIDAFAUCET has drop{}

    fun init(witness:GUINJGIDAFAUCET,ctx:&mut TxContext){
        let(treasury_cap,metadata)=coin::create_currency<GUINJGIDAFAUCET>(witness,6,b"GUINJGIDAFAUCET",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<GUINJGIDAFAUCET>,amount:u64,recipient:address,ctx:&mut TxContext
    ){
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<GUINJGIDAFAUCET>,coin:Coin<GUINJGIDAFAUCET>){
        coin::burn(treasury_cap,coin);
    }

}
