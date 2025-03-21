module task2::lxjianbai;

use std::option::none;
use sui::coin;
use sui::coin::{create_currency, TreasuryCap};
use sui::transfer::{public_transfer, public_freeze_object};
use sui::tx_context::TxContext;
use sui::url::Url;

public struct LXJIANBAI has drop {

}


fun init(obj: LXJIANBAI, ctx: &mut TxContext) {
    let (treasuryCap, coinMetadata) = create_currency(
    obj,
    9,
    b"LXJIANBAI",
    b"LXJIANBAI",
    b"",
    none<Url>(),
    ctx);

    public_freeze_object(coinMetadata);
    public_transfer(treasuryCap, ctx.sender());
}

public entry fun mint_coin(cap: &mut TreasuryCap<LXJIANBAI>, value: u64, ctx: &mut TxContext) {
    let objCoin = coin::mint(cap, value, ctx);
    public_transfer(objCoin, ctx.sender());
}