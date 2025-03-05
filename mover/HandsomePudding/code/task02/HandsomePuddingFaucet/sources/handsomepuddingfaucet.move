
/// Module: handsomepuddingfaucet
module handsomepuddingfaucet::handsomepuddingfaucet;


// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

use std::option::{none, some};
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_transfer, public_share_object};
use sui::url;
use sui::url::Url;

public struct HANDSOMEPUDDINGFAUCET has drop{}

fun init(handsomePuddingFaucet:HANDSOMEPUDDINGFAUCET, ctx: &mut TxContext){

    // let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/651su63370?v=4&size=64");
    // let yes = some(url);
    let no = none<Url>();

    let (treasury, coin_metadata) = create_currency(handsomePuddingFaucet, 4,b"HandsomePuddingFaucet", b"HandsomePuddingFaucet", b"this is HandsomePuddingFaucet", no, ctx);



    public_freeze_object(coin_metadata);
    public_share_object(treasury);
}

