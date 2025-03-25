module task2::qwe;

use std::option::none;
use sui::coin;
use sui::coin::{create_currency, TreasuryCap};
use sui::transfer::{public_transfer, public_freeze_object};
use sui::tx_context::TxContext;
use sui::url::Url;

public struct QWE has drop {

}


fun init(obj: QWE, ctx: &mut TxContext) {
    let (treasuryCap, coinMetadata) = create_currency(
    obj,
    9,
    b"QWE",
    b"QWE",
    b"",
    none<Url>(),
    ctx);

    public_freeze_object(coinMetadata);
    public_transfer(treasuryCap, ctx.sender());
}

public entry fun mint_coin(cap: &mut TreasuryCap<QWE>, value: u64, ctx: &mut TxContext) {
    let objCoin = coin::mint(cap, value, ctx);
    public_transfer(objCoin, ctx.sender());
}