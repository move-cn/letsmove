module task2::tcoin_facuet;
use std::option::some;
use sui::coin::{create_currency, TreasuryCap};
use sui::transfer::{public_transfer, public_freeze_object, share_object, public_share_object};
use sui::url;
use sui::url::Url;
use sui::coin;

public struct TCOIN_FACUET has drop{}

fun init(tcoin_facuet: TCOIN_FACUET, ctx: &mut TxContext){
    let url = url::new_unsafe_from_bytes(b"https://img2.baidu.com/it/u=2249492919,1307050096&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=504");
    let coinPic = some<Url>(url);
    let (treasury, coin_metadata) = create_currency(tcoin_facuet, 8, b"TCOIN_FACUET", b"TCOIN_FACUET", b"this is tcoin_facuet coin.", coinPic, ctx);

    public_freeze_object(coin_metadata);
    // then share the treasury
    public_share_object(treasury);
}

// then the recipient can mint the coin
public fun mint(treasury_cap: &mut TreasuryCap<TCOIN_FACUET>, amount: u64, recipient: address, ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
}