module my_coin::ingmar;

use sui::coin::create_currency;
use std::option::none;
use sui::transfer::{ public_transfer, public_freeze_object};
use sui::url::Url;

public struct INGMAR has drop {}

fun init(otw: INGMAR, ctx: &mut TxContext) {
    let icon_url  = none<Url>();
    let (treasury, coin_metadata) = create_currency(otw, 8, b"ING", b"ING", b"For great Ingmar Bergman, love your movies!", icon_url, ctx);

    public_freeze_object(coin_metadata);

    public_transfer(treasury, ctx.sender());
}

