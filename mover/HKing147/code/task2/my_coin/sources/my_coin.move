/*
/// Module: my_coin
module my_coin::my_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module my_coin::my_coin;

use sui::coin::{create_currency, TreasuryCap, mint_and_transfer};

public struct MY_COIN has drop {}

fun init(otw: MY_COIN, ctx: &mut TxContext) {
    let (treasury_cap, coin_metadata) = create_currency(
        otw,
        9,
        b"HKing147",
        b"HKing147",
        b"this is HKing147's coin",
        option::none(),
        ctx,
    );
    transfer::public_freeze_object(coin_metadata);
    transfer::public_transfer(treasury_cap, ctx.sender());
}

public entry fun mint(c: &mut TreasuryCap<MY_COIN>, amount: u64, ctx: &mut TxContext) {
    mint_and_transfer(c, amount, ctx.sender(), ctx);
}
