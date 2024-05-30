/*
/// Module: mycoin
module mycoin::mycoin {

}
*/
module mycoin::zzf222_coin{
use std::option;
use sui::coin::{Self,Coin,TreasuryCap};
use sui::transfer;
use sui::tx_context::{Self,TxContext};
public struct ZZF222_COIN has drop{}
fun init(witness:ZZF222_COIN,ctx:&mut TxContext){
    let(treasury_cap,metadata)=coin::create_currency<ZZF222_COIN>(
        witness,2,b"MY_COIN",b"MC",b"just finish task2",option::none(),ctx);
transfer::public_freeze_object(metadata);
transfer::public_transfer(treasury_cap,tx_context::sender(ctx));
}
public entry fun mint(
    treasury_cap:&mut TreasuryCap<ZZF222_COIN>,
    amount:u64,
    recipient:address,
    ctx:&mut TxContext
){
    coin::mint_and_transfer(treasury_cap,amount,recipient,ctx);
}
public entry fun burn(treasury_cap:&mut TreasuryCap<ZZF222_COIN>,coin:Coin<ZZF222_COIN>){
    coin::burn(treasury_cap,coin);
}
#[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(ZZF222_COIN {}, ctx);
    }
}