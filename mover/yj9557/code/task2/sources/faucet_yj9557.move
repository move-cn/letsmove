module task2::faucet_yj9957;

use std::option::none;
use sui::coin;
use sui::coin::{create_currency, TreasuryCap};
use sui::transfer::{public_transfer, public_freeze_object, public_share_object};
use sui::tx_context::TxContext;
use sui::url::Url;

public struct FAUCET_YJ9957 has drop {

}


fun init(xddObject: FAUCET_YJ9957, ctx: &mut TxContext) {
    let (treasuryCap, coinMetadata) = create_currency(
    xddObject,
    9,
    b"FAUCET_YJ9957",
    b"FAUCET_YJ9957",
    b"FAUCET_YJ9957",
    none<Url>(),
    ctx);

    public_freeze_object(coinMetadata);
    public_share_object(treasuryCap);
}

public entry fun mint_coin(cap: &mut TreasuryCap<FAUCET_YJ9957>, value: u64, recipient: address, ctx: &mut TxContext) {
    let xddCoin = coin::mint(cap, value, ctx);
    public_transfer(xddCoin, recipient);
}