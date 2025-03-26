module faucet_coin::faucet_coin;

use sui::coin::{Self, TreasuryCap};
use sui::url::{Self, Url};

public struct FAUCET_COIN has drop {}

fun init(coin: FAUCET_COIN, ctx: &mut TxContext) {
    let url = option::some<Url>(
        url::new_unsafe_from_bytes(
            b"https://png.pngtree.com/png-clipart/20201208/original/pngtree-vector-coins-icon-dollar-gold-coin-png-image_5591009.jpg",
        ),
    );
    let (treasury, metadata) = coin::create_currency(
        coin,
        8,
        b"$$",
        b"$$",
        b"faucet coin: $$",
        url,
        ctx,
    );
    transfer::public_freeze_object(metadata);
    transfer::public_share_object(treasury);
}

public entry fun mint(
    treasury: &mut TreasuryCap<FAUCET_COIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext,
) {
    let coin = coin::mint(treasury, amount, ctx);
    transfer::public_transfer(coin, recipient);
}

/// tx: 7VuhramMnLJvpGkPv4KqThZDA1M58fEogbQKuN6jQs8u
/// packageID: 0xb719adc514601326081489f46e57db8e384da20525e629bf2ac877aec3749adf
/// 0xb719adc514601326081489f46e57db8e384da20525e629bf2ac877aec3749adf::faucet_coin::FAUCET_COIN
/// 0xf25f7d1d3521003dc11fbbaffb66534747c2e3f38b7b07db208072c4781cf4ff