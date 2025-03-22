/*
/// Module: my_coin
*/

module my_coin::fly;
use sui::coin::{create_currency, mint, TreasuryCap};
use std::option::none;
use sui::transfer::{public_freeze_object, public_transfer};
use sui::url::Url;

public struct FLY has drop {}

fun init(witness: FLY, ctx: &mut TxContext) {
    // currency icon url
    let no: Option<Url> = none<Url>();

    // 创建代币
    let (treasury, coin_metadata) = create_currency(
        witness, 
        8, 
        b"FLY", 
        b"FLY", 
        b"FLY currency Coin", 
        no, 
        ctx
        );
    // 冻结代币元数据信息，把代币所有权转移给请求的发送者。
    public_freeze_object(coin_metadata);
    public_transfer(treasury, ctx.sender())
}

// 代币铸币并把铸好的代币转移给指定的地址
public fun fly_mint(
    treasury: &mut TreasuryCap<FLY>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext,
){
    let coin = mint(treasury,amount,ctx);
    public_transfer(coin,recipient)
}

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions
