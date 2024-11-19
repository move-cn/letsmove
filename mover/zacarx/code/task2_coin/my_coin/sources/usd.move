module my_coin::zacarxcoin;

use sui::coin::{create_currency, mint_and_transfer};
use sui::url;
use std::option;

public struct ZACARXCOIN has drop {}

fun init(zacarxcoin: ZACARXCOIN, ctx: &mut TxContext) {
    let url = url::new_unsafe_from_bytes(b"https://aggregator.walrus-testnet.walrus.space/v1/3om0zV4j9AHvC5KSrcg3iyMU8zOavKhg3uT8q1rwap0");
    let yes = option::some(url); // 使用 option::some 函数
    let (treasury, coinmetadata) = create_currency(zacarxcoin, 8, b"ZACARXCOIN", b"zacarxcoin", b"we love zacarx'coin", yes, ctx);

    sui::transfer::public_freeze_object(coinmetadata);
    sui::transfer::public_transfer(treasury, ctx.sender())

   // mint_and_transfer()
}
