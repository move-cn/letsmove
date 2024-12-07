module my_coin::rmd;

use std::option::{none};
use sui::url::Url;
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_share_object};

public struct RMD has drop{}

fun init(rmd: RMD, ctx: &mut TxContext) {
    let no = none<Url>();
    let (treasury, coin_metadata) =
        create_currency(rmd, 8,  b"RMB",b"RMB",b"this is RMD",no, ctx);
    public_freeze_object(coin_metadata);
    public_share_object(treasury);
}
