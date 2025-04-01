/*
/// Module: xcoin
module xcoin::xcoin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module xcoin::xusd;
use std::option::some;
use sui::coin::create_currency;
use sui::transfer::{public_transfer, public_freeze_object};
use sui::url;
use sui::url::Url;

public struct XUSD has drop{}

fun init(xusd: XUSD, ctx: &mut TxContext){
    let url = url::new_unsafe_from_bytes(b"https://img2.baidu.com/it/u=2249492919,1307050096&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=504");
    let coinPic = some<Url>(url);
    let (treasury, coin_metadata) = create_currency(xusd, 8, b"XUSD", b"XUSD", b"this is xusd coin.", coinPic, ctx);

    public_freeze_object(coin_metadata);

    public_transfer(treasury, ctx.sender());
}
