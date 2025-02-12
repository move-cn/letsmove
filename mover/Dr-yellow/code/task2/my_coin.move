/*
/// Module: my_coin
module my_coin::my_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module my_coin::my_coin;


use sui::coin::{Self, TreasuryCap};
use sui::transfer::{  public_freeze_object, public_share_object};

public struct MY_COIN has drop {}

fun init(witness: MY_COIN, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(
        witness,
        6,
        b"MY_COIN",
        b"Dr_yellow coin",
        b"first erc20 coint",
        option::none(),
        ctx,
    );
    public_freeze_object(metadata);
    // public_transfer(treasury, ctx.sender())
    public_share_object(treasury);

}

