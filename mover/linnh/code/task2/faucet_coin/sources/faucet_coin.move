/*
/// Module: faucet_coin
module faucet_coin::faucet_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module faucet_coin::rmb;

use std::option::none;
use sui::{
    coin::create_currency,
    transfer::{ public_freeze_object, public_share_object },
    url::Url
};

public struct RMB has drop {}


fun init(rmb: RMB, ctx: &mut TxContext) {
    let url = none<Url>();
    let (treasury_cap, coin_metadata) = create_currency(rmb, 8, b"RMB", b"RMB", b"This is RMB", url, ctx);
    public_freeze_object(coin_metadata);
    public_share_object(treasury_cap);
}
