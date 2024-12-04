/*
/// Module: coin
module coin::coin {

}
*/

module coin::guinjgidacoin{
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use std::option;

    public struct GUINJGIDACOIN has drop{}

    fun init(witness:GUINJGIDACOIN,ctx: &mut TxContext){
        let(treasury_cap,metadata)=coin::create_currency<GUINJGIDACOIN>(witness,6,b"COIN",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap,tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<GUINJGIDACOIN>,amount:u64,recipient:address,ctx:&mut TxContext
    ){
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<GUINJGIDACOIN>,coin:Coin<GUINJGIDACOIN>){
        coin::burn(treasury_cap,coin);
    }
}
