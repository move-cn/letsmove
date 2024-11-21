module task2::aydenchange_faucet;

use sui::coin::{Self,TreasuryCap, Coin};

public struct AYDENCHANGE_FAUCET has drop {}

fun init(witness: AYDENCHANGE_FAUCET, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency<AYDENCHANGE_FAUCET>(
        witness,
        6,
        b"AYDENCHANGE_FAUCET",
        b"AYDENCHANGE_FAUCET",
        b"this is aydenchangefaucet",
        option::none(),
        ctx);
    transfer::public_freeze_object(metadata);
    transfer::public_share_object(treasury)
}
public entry fun mint(
    treasury: &mut TreasuryCap<AYDENCHANGE_FAUCET>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext
) {
    coin::mint_and_transfer(treasury, amount, recipient, ctx);
}
public entry fun burn(
    treasury: &mut TreasuryCap<AYDENCHANGE_FAUCET>,
    coin: Coin<AYDENCHANGE_FAUCET>
) {
    coin::burn(treasury, coin);
}

