module handsomepudding::handsomepudding;

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

use std::option::{none, some};
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_transfer};
use sui::url;
use sui::url::Url;

public struct HANDSOMEPUDDING has drop{}

fun init(handsomePudding:HANDSOMEPUDDING, ctx: &mut TxContext){

    // let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/65163370?v=4&size=64");
    // let yes = some(url);
    let no = none<Url>();

    let (treasury, coin_metadata) = create_currency(handsomePudding, 4,b"HandsomePudding", b"HandsomePudding", b"this is HandsomePudding", no, ctx);



    public_freeze_object(coin_metadata);
    public_transfer(treasury, ctx.sender());
}
