/*
/// Module: my_coin
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module my_coin::jack_751;

use sui::coin::{Self, TreasuryCap};

public struct JACK_751 has drop {}

fun init(witness: JACK_751, ctx: &mut tx_context::TxContext) {
    let (treasury, metadata) =
        coin::create_currency(witness,6,b"Jack-751", b"Jack-751_COIN",b"Jack-751_COIN_Description", option::none(), ctx);

    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury, tx_context::sender(ctx));
}

public entry fun mint(treasury_cap: &mut TreasuryCap<JACK_751>, amount: u64, recepient: address , ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recepient, ctx);
}