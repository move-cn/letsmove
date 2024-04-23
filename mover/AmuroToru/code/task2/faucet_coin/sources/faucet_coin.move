module 0x0::AmuroToruFaucet{
    use std::option;
    use sui::object::{UID};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::object;
    use sui::tx_context::{Self, TxContext};
    use sui::balance::{Self, Balance};

    public struct AMUROTORUFAUCET has drop{}

    fun init(witness:AMUROTORUFAUCET,ctx:&mut TxContext){
        let(treasury_cap,metadata)=coin::create_currency<AMUROTORUFAUCET>(witness,6,b"AMUROTORUCOIN",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<AMUROTORUFAUCET>,amount:u64,recipient:address,ctx:&mut TxContext
    ){
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<AMUROTORUFAUCET>,coin:Coin<AMUROTORUFAUCET>){
        coin::burn(treasury_cap,coin);
    }
}