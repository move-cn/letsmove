module FireCoin::FireCoin {
     use std::option;
     use sui::transfer;
     use sui::tx_context::{Self, TxContext};
     use sui::coin::{Self, Coin, TreasuryCap};

     public struct FIRECOIN has drop {}

    fun init( witness:FIRECOIN , ctx: &mut TxContext) {
         let (treasury, metadata) = coin::create_currency(witness, 7, b"404llcoin", b"FC", b"Full of idal a flame", option::none(), ctx);
         transfer::public_freeze_object(metadata);
         transfer::public_transfer(treasury, tx_context::sender(ctx))
         }

   
}