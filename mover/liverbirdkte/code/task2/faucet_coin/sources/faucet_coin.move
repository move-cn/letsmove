module faucet_coin::edward;

use sui::coin::create_currency;
use std::option::none;
use sui::transfer::{ public_share_object, public_freeze_object};
use sui::url::Url;

public struct EDWARD has drop {}

fun init(otw: EDWARD, ctx: &mut TxContext) {
    let icon_url  = none<Url>();
    let (treasury, coin_metadata) = create_currency(otw, 8, b"EDW", b"EDW", b"For great Edward Yang, love your movies！", icon_url, ctx);

    public_freeze_object(coin_metadata);

    public_share_object(treasury);
}

