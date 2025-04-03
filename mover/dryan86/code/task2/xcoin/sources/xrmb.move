/*
/// Module: xcoin
module xcoin::xcoin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module xcoin::xrmb;
use std::option::some;
use sui::coin::create_currency;
use sui::transfer::{public_transfer, public_freeze_object, share_object, public_share_object};
use sui::url;
use sui::url::Url;

public struct XRMB has drop{}

fun init(xrmb: XRMB, ctx: &mut TxContext){
    let url = url::new_unsafe_from_bytes(b"https://img2.baidu.com/it/u=2249492919,1307050096&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=504");
    let coinPic = some<Url>(url);
    let (treasury, coin_metadata) = create_currency(xrmb, 8, b"XRMB", b"XRMB", b"this is xrmb coin.", coinPic, ctx);

    public_freeze_object(coin_metadata);

    public_share_object(treasury);
}
