module task2::faucet_coin;

use sui::coin::{Self, TreasuryCap};

public struct FAUCET_COIN has drop {}

fun init(otw: FAUCET_COIN, ctx: &mut TxContext) {
    let (treasury_cap, coin_metadata) = coin::create_currency(
        otw,
        9,
        b"xiaxianlinFaucet",
        b"xiaxianlinFaucet",
        b"this is my faucet coin",
        option::none(),
        ctx,
    );
    transfer::public_freeze_object(coin_metadata);
    transfer::public_share_object(treasury_cap);
}

public entry fun faucet(c: &mut TreasuryCap<FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
    coin::mint_and_transfer(c, amount, ctx.sender(), ctx);
}
