/// Module: my_coin
module my_coin::faucet_procarihana;
use std::string::utf8;
use sui::coin::{create_currency,Self,TreasuryCap};
use std::option::some;
use sui::transfer::{public_freeze_object,public_share_object,public_transfer};
use sui::url::{Url, Self};

public struct FAUCET_PROCARIHANA has drop {}

fun init(myCoin: FAUCET_PROCARIHANA, ctx: &mut TxContext) {
    // let no = none<Url>();
    let url = url::new_unsafe_from_bytes(b"https://sns-webpic-qc.xhscdn.com/202503032301/ab6dddfbf1bb6e8d92a9542cab6b7850/1040g00830s621dibis005n0rmhmhhlslolfkbd0!nd_dft_wlteh_webp_3");
    let yes = some<Url>(url);
    // return TreasuryCap<T>, CoinMetadata<T>
    let (treasury_cap, coin_metadata) =
        create_currency(myCoin, 8, b"FAUCET_PROCARIHANA", b"FAUCET_PROCARIHANA", b"FOR FAUCET_PROCARIHANA", yes, ctx);
    // 把coin 属性变成一个常量
    public_freeze_object(coin_metadata);
    public_share_object(treasury_cap);
}
public entry fun mint_coin(cap: &mut TreasuryCap<FAUCET_PROCARIHANA>, value: u64, recipient: address, ctx: &mut TxContext) {
    let my_coin = coin::mint(cap, value, ctx);
    public_transfer(my_coin, recipient);
}