module swap::HK;

use sui::coin::{Self, TreasuryCap, Coin};
use sui::url::Url;

use std::option::{Self};
use sui::transfer::{Self};

public struct HK has drop {}
public struct TreasuryCapHolder has key {
    id: UID,
    treasury_cap: TreasuryCap<HK>,
}

//构造函数
fun init(otw: HK, ctx: &mut TxContext) {
    //"https://jethrowiki-1308786690.cos.ap-chongqing.myqcloud.com/mypicture%2Fimage%2Fdonkey.jpg"
    let (treasury_cap, metadata) = coin::create_currency(
        otw,
        9,
        b"HK",
        b"HK",
        b"HK",
        option::none<Url>(),
        ctx,
    );
    transfer::public_freeze_object(metadata);
    let treasury_cap_holder = TreasuryCapHolder {
        id: object::new(ctx),
        treasury_cap,
    };
    transfer::share_object(treasury_cap_holder);
}

entry fun mint(treasury_cap_holder: &mut TreasuryCapHolder, amount: u64, recipient: address,  ctx: &mut TxContext) {
    let treasury_cap = &mut treasury_cap_holder.treasury_cap;
    let coins = coin::mint(treasury_cap, amount, ctx);
    // 用coin做点什么
    transfer::public_transfer(coins, recipient)
}

entry fun transfer_coins(from_wallet: &mut Coin<HK>, amount: u64, to_wallet: &mut Coin<HK>, ctx: &mut TxContext) {
    let cash = coin::take(coin::balance_mut(from_wallet), amount, ctx);
    coin::put(coin::balance_mut(to_wallet), cash);
}