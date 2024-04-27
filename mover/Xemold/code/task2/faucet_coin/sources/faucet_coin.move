module 0x0::FAUCETCOIN{
    use std::option;
    use sui::object::{UID};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::object;
    use sui::tx_context::{Self, TxContext};
    use sui::balance::{Self, Balance};

    public struct FAUCETCOIN has drop{}

    fun init(witness:FAUCETCOIN,ctx:&mut TxContext){
        let(treasury_cap,metadata)=coin::create_currency<FAUCETCOIN>(witness,6,b"XEMOLD_COIN",b"hhh",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCETCOIN>,amount:u64,recipient:address,ctx:&mut TxContext
    ){
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<FAUCETCOIN>,coin:Coin<FAUCETCOIN>){
        coin::burn(treasury_cap,coin);
    }
}