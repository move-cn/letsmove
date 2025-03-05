module my_coin::qqb;

use sui::coin::{Self, TreasuryCap};
use sui::url::{Self, Url};

public struct QQB has drop {}

fun init(coin: QQB, ctx: &mut TxContext) {
    let url = option::some<Url>(
        url::new_unsafe_from_bytes(
            b"https://pic.nximg.cn/file/20150505/20972157_223515197461_2.jpg",
        ),
    );
    let (treasury, metadata) = coin::create_currency(
        coin,
        8,
        b"QQB",
        b"QQB",
        b"my qqb coin",
        url,
        ctx,
    );
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury, ctx.sender());
}

public entry fun mint(
    treasury: &mut TreasuryCap<QQB>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext,
) {
    coin::mint_and_transfer(treasury, amount, recipient, ctx)
}


// tx: 8LzFfT7h8mAvVATRg2JEbSCnTa9RxEVVYTgBeKMASN7Y
// packageID: 0xba74e7bdc1d7b7663844417a6ae4ecbffb909c834aac8c16f88db6f6aaed408e
// 0x2::coin::TreasuryCap<0xba74e7bdc1d7b7663844417a6ae4ecbffb909c834aac8c16f88db6f6aaed408e::qqb::QQB>
// 0x3a7a622cd6a3ef2851bcfd38d477fe4b000f8dfc9dae1a98356a1b19ef04ff28