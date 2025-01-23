/*
/// Module: my_coin
module my_coin::my_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module my_coin::my_coin;

use sui::coin::create_currency;
use std::option;
use std::option::{none, some};
use sui::transfer::{public_freeze_object,public_transfer};
use sui::url::Url;


public struct MY_COIN has drop{}

fun init(my_coin: MY_COIN, ctx: &mut TxContext){

   let no : Option<Url> = none<Url>();

  let (treasury, coin_metadata) = create_currency(
        my_coin,
        8,
        b"MY_COIN",
        b"MY_COIN2025-1-3",
        b"this is makayalu's coin",
        no,
        ctx
    );

    public_freeze_object(coin_metadata);

    public_transfer(treasury,ctx.sender());


}