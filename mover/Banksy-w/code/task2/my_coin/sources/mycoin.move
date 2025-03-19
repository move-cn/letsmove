

module my_coin::mycoin;
use std::option::{Option,none,some};
use sui::coin::{create_currency, TreasuryCap};

use sui::transfer::{public_transfer, public_freeze_object};


use sui::url::Url;

public struct MYCOIN has drop {}

fun init(coin: MYCOIN, ctx: &mut TxContext) {
    let no: Option<Url> = none<Url>();

    let (treasury, coin_metadata) =
        create_currency(coin, 8, b"Banksy-w", b"Banksy-w", b"This is Banksy-w coin", no, ctx);

    public_freeze_object(coin_metadata);
    public_transfer(treasury, ctx.sender())
}

