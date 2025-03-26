module task2::yj9957;

use std::option::none;
use sui::coin;
use sui::coin::{create_currency, TreasuryCap};
use sui::transfer::{public_transfer, public_freeze_object};
use sui::tx_context::TxContext;
use sui::url::Url;

public struct YJ9957 has drop {

}


fun init(xddObject: YJ9957, ctx: &mut TxContext) {
    let (treasuryCap, coinMetadata) = create_currency(
    xddObject,
    9,
    b"YJ9957",
    b"YJ9957",
    b"",
    none<Url>(),
    ctx);

    public_freeze_object(coinMetadata);
    public_transfer(treasuryCap, ctx.sender());
}

public entry fun mint_coin(cap: &mut TreasuryCap<YJ9957>, value: u64, ctx: &mut TxContext) {
    let xddCoin = coin::mint(cap, value, ctx);
    public_transfer(xddCoin, ctx.sender());
}




