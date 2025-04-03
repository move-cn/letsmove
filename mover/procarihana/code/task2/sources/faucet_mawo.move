/// Module: my_coin
module my_coin::faucet_mawo;
use std::string::utf8;
use sui::coin::{create_currency,Self,TreasuryCap};
use std::option::some;
use sui::transfer::{public_freeze_object,public_share_object,public_transfer};
use sui::url::{Url, Self};

public struct FAUCET_MAWO has drop {}

fun init(mawo: FAUCET_MAWO, ctx: &mut TxContext) {
    // let no = none<Url>();
    let url = url::new_unsafe_from_bytes(b"https://sns-webpic-qc.xhscdn.com/202503032301/ab6dddfbf1bb6e8d92a9542cab6b7850/1040g00830s621dibis005n0rmhmhhlslolfkbd0!nd_dft_wlteh_webp_3");
    let yes = some<Url>(url);
    // return TreasuryCap<T>, CoinMetadata<T>
    let (treasury_cap, coin_metadata) =
        create_currency(mawo, 8, b"MAWO", b"MAWO", b"FOR LOVE", yes, ctx);
    // 把coin 属性变成一个常量
    public_freeze_object(coin_metadata);
    public_share_object(treasury_cap);
}
public entry fun mint_coin(cap: &mut TreasuryCap<FAUCET_MAWO>, value: u64, recipient: address, ctx: &mut TxContext) {
    let mawo_coin = coin::mint(cap, value, ctx);
    public_transfer(mawo_coin, recipient);
}