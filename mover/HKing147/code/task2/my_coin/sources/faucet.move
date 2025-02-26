/*
/// Module: my_coin
module my_coin::faucet;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module my_coin::faucet;

use sui::coin::{Self, TreasuryCap};

public struct FAUCET has drop {}

fun init(otw: FAUCET, ctx: &mut TxContext) {
    let (treasury_cap, coin_metadata) = coin::create_currency(
        otw,
        9,
        b"HKing147",
        b"HKing147",
        b"this is HKing147's coin faucet",
        option::none(),
        ctx,
    );
    transfer::public_freeze_object(coin_metadata);
    transfer::public_share_object(treasury_cap);
}

public entry fun faucet(c: &mut TreasuryCap<FAUCET>, amount: u64, ctx: &mut TxContext) {
    coin::mint_and_transfer(c, amount, ctx.sender(), ctx);
}
