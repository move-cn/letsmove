module 0x0::AmuroToruCoin{
    use std::option;
    use sui::coin::{Self,Coin,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};

    public struct AMUROTORUCOIN has drop{}

    fun init(witness:AMUROTORUCOIN,ctx:&mut TxContext){
        let(treasury_cap,metadata)=coin::create_currency<AMUROTORUCOIN>(witness,6,b"AMUROTORUCOIN",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap,tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<AMUROTORUCOIN>,amount:u64,recipient:address,ctx:&mut TxContext
    ){
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx)
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<AMUROTORUCOIN>,coin:Coin<AMUROTORUCOIN>){
        coin::burn(treasury_cap,coin);
    }
}
