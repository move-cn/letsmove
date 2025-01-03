/*
/// Module: coinfacet
module coinfacet::coinfacet;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module coinfacet::rmb;

use sui::coin::create_currency;
use std::option;
use std::option::{none, some};
use sui::transfer::{public_freeze_object,public_transfer,public_share_object};
use sui::url::Url;
use sui::coin::{Self, Coin, TreasuryCap};

public struct RMB has drop{}

fun init(rmb: RMB, ctx: &mut TxContext){

   let no : Option<Url> = none<Url>();

  let (treasury, coin_metadata) = create_currency(
        rmb,
        8,
        b"RMB",
        b"RMB",
        b"this is makayalu's RMB",
        no,
        ctx
    );

    public_freeze_object(coin_metadata);

    public_share_object(treasury);

   

}

 public fun mint(treasury: &mut TreasuryCap<RMB> , amount: u64 , recipient: address , ctx: &mut TxContext){
        coin::mint_and_transfer(treasury, amount, recipient, ctx)
    }