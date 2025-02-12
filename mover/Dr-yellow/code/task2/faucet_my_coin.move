/*
/// Module: my_coin
module my_coin::my_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module my_coin::my_coin;


use sui::coin::{Self, TreasuryCap};
use sui::transfer::{ public_transfer, public_freeze_object, public_share_object};

public struct MY_COIN has drop {}

fun init(witness: MY_COIN, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(
        witness,
        6,
        b"MY_COIN_yellow",
        b"Dr_yellow coin",
        b"first erc20 coint",
        option::none(),
        ctx,
    );
    public_freeze_object(metadata);
    // public_transfer(treasury, ctx.sender())
    public_share_object(treasury);
}

public entry fun mint(
    treasury_cap: &mut TreasuryCap<MY_COIN>,
    recipient: address,
    ctx: &mut TxContext,
) {
    // 每次只能够领取10
    let coin = coin::mint(treasury_cap, 10_000_000, ctx);
    public_transfer(coin, recipient)
}
