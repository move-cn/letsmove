/*
/// Module: my_coin
module my_coin::my_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module my_coin::usd;

use std::option::none;
use sui::{
    coin::create_currency,
    transfer::{ public_freeze_object, public_transfer },
    url::Url
};

public struct USD has drop {}


fun init(usd: USD, ctx: &mut TxContext) {
    let url = none<Url>();
    let (treasury_cap, coin_metadata) = create_currency(usd, 8, b"USD", b"USD", b"This is USD", url, ctx);
    public_freeze_object(coin_metadata);
    public_transfer(treasury_cap, ctx.sender());
}

