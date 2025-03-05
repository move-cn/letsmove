/*
/// Module: task2
module task2::beson77;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module task2::faucet_beson77;
use std::option;
use sui::coin;
use sui::coin::{create_currency, TreasuryCap};
use sui::transfer::{public_transfer, public_freeze_object, public_share_object};
use sui::url::Url;
use sui::tx_context::{TxContext};


public struct FAUCET_BESON77 has drop {

}

fun init(winness: FAUCET_BESON77, ctx: &mut TxContext) {
    //创建代币
    let (treasuryCap, coinMetadata) = create_currency(winness,
        9,
    b"FAUCET_BESON77",
        b"FAUCET_BESON77",
        b"FAUCET_BESON77",
        option::none<Url>(),
    ctx);

    //冻结元数据
    public_freeze_object(coinMetadata);
    //将铸币权限给自己
    public_share_object(treasuryCap);
}

//铸币代码
public entry fun mint(cap: &mut TreasuryCap<FAUCET_BESON77>, value: u64, recipient: address, ctx: &mut TxContext) {
    //铸造指定代币数量
    let userCoin = coin::mint(cap, value, ctx);
    //将代币转给指定用户
    public_transfer(userCoin, recipient);
}




