module faucet_coin::zacarxfaucet;

use sui::coin::{create_currency, mint_and_transfer};
use sui::url;
use std::option;

public struct ZACARXFAUCET has drop {}

fun init(zacarxfaucet: ZACARXFAUCET, ctx: &mut TxContext) {
    let url = url::new_unsafe_from_bytes(b"https://aggregator.walrus-testnet.walrus.space/v1/3om0zV4j9AHvC5KSrcg3iyMU8zOavKhg3uT8q1rwap0");
    let yes = option::some(url); // 使用 option::some 函数
    let (treasury, coinmetadata) = create_currency(zacarxfaucet, 8, b"ZACARXFAUCET", b"zacarxfaucet", b"we love zacarxfaucet'coin", yes, ctx);

    sui::transfer::public_freeze_object(coinmetadata);
    sui::transfer::public_share_object(treasury);

    // mint_and_transfer()
}
