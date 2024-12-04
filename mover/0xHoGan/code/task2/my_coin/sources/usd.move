module my_coin::usd;

use sui::coin::create_currency;
use std::option::{none};
use sui::url::Url;
use sui::transfer::{public_transfer, public_freeze_object};

public struct USD has drop{}

fun init(usd: USD, ctx: &mut TxContext) {
    let no = none<Url>();
    // let url = url::new_unsafe_from_bytes(b"");
    // let yes = some<Url>(url);
    let (treasury, coin_metadata) = 
    create_currency(usd, 8, b"USD", b"USD", b"This is USD", no, ctx);

    public_freeze_object(coin_metadata);
    public_transfer(treasury, ctx.sender());
}
