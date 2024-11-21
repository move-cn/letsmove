module task2::aydenchange_coin;

use std::option;
use sui::coin;
use sui::coin::{TreasuryCap, Coin};
use sui::transfer;
use sui::tx_context::{TxContext};

public struct AYDENCHANGE_COIN has drop {}

fun init(witness: AYDENCHANGE_COIN, ctx: &mut TxContext) {
    let (treasury,
        metadata) =
        coin::create_currency(
            witness,
            6,
            b"AYDENCHANGE_COIN",
            b"AYDENCHANGE_COIN",
            b"this is aydenchange_coin",
            option::none(),
            ctx);
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury, ctx.sender());
}

public entry fun mint(
    treasury_cap: &mut TreasuryCap<AYDENCHANGE_COIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext,
) {
    let coin = coin::mint(treasury_cap, amount, ctx);
    transfer::public_transfer(coin, recipient)
}

public entry fun burn<T>(
    treasury_cap: &mut TreasuryCap<AYDENCHANGE_COIN>,
    coin: Coin<AYDENCHANGE_COIN>
) {
    coin::burn(treasury_cap,coin);
}

