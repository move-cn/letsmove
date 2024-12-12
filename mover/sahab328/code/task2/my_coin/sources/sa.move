module my_coin::sa;

use sui::url::{Self, Url};
use sui::coin::{create_currency};
use std::option::{some};

use sui::transfer::{public_freeze_object, public_transfer};

public struct SA has drop {}

fun init(sa: SA, ctx: &mut TxContext) {
    // let no = none<Url>();
    let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/162699534");
    let icon_url = some<Url>(url);
    let (treasury, coin_meta) = create_currency(sa, 18, b"SA", b"SA", b"sahab's token", icon_url, ctx);

    public_freeze_object(coin_meta);

    public_transfer(treasury, ctx.sender());
}