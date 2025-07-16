/*
/// Module: my_coin
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module my_coin::jack_751_faucet_coin;

use sui::coin::{Self, TreasuryCap};

public struct JACK_751_FAUCET_COIN has drop {}

fun init(witness: JACK_751_FAUCET_COIN, ctx: &mut TxContext) {
    let (treasury, metadata) =
        coin::create_currency(witness,6,b"Jack-751", b"Jack_751_FAUCETCOIN",b"Jack_751_FAUCETCOIN_Description", option::none(), ctx);

    transfer::public_freeze_object(metadata);
    transfer::public_share_object(treasury);
}

public entry fun mint(treasury_cap: &mut TreasuryCap<JACK_751_FAUCET_COIN>, amount: u64, recepient: address , ctx: &mut TxContext) {
    let _coin = coin::mint(treasury_cap, amount, ctx);
    transfer::public_transfer(_coin, recepient);
}