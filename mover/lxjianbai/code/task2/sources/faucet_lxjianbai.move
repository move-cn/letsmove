module task2::faucet_lxjianbai;

use std::option::none;
use sui::coin;
use sui::coin::{create_currency, TreasuryCap};
use sui::transfer::{public_transfer, public_freeze_object, public_share_object};
use sui::tx_context::TxContext;
use sui::url::Url;

public struct FAUCET_LXJIANBAI has drop {

}


fun init(object: FAUCET_LXJIANBAI, ctx: &mut TxContext) {
    let (treasuryCap, coinMetadata) = create_currency(
    object,
    9,
    b"FAUCET_LXJIANBAI",
    b"FAUCET_LXJIANBAI",
    b"FAUCET_LXJIANBAI",
    none<Url>(),
    ctx);

    public_freeze_object(coinMetadata);
    public_share_object(treasuryCap);
}

public entry fun mint_coin(cap: &mut TreasuryCap<FAUCET_LXJIANBAI>, value: u64, recipient: address, ctx: &mut TxContext) {
    let objCoin = coin::mint(cap, value, ctx);
    public_transfer(objCoin, recipient);
}