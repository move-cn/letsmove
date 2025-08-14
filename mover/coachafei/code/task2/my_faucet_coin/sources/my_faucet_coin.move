/*
/// Module: my_coin
*/

module my_faucet_coin::faucet_fly;
use sui::coin::{create_currency, mint, TreasuryCap};
use std::option::none;
use sui::transfer::{public_freeze_object, public_transfer, public_share_object};
use sui::url::Url;

public struct FAUCET_FLY has drop {}

fun init(witness: FAUCET_FLY, ctx: &mut TxContext) {
    // currency icon url
    let no: Option<Url> = none<Url>();

    // 创建代币
    let (treasury, coin_metadata) = create_currency(
        witness, 
        8, 
        b"FAUCET_FLY", 
        b"FAUCET_FLY", 
        b"FLY currency but can faucet", 
        no, 
        ctx
        );
    // 冻结代币元数据信息，并共享代币的所有权。
    public_freeze_object(coin_metadata);
    // public_transfer(treasury, ctx.sender())
    public_share_object(treasury);
}

// 代币铸币并把铸好的代币转移给指定的地址
public fun faucet_fly_mint(
    treasury: &mut TreasuryCap<FAUCET_FLY>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext,
){
    let coin = mint(treasury,amount,ctx);
    public_transfer(coin,recipient)
}

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions
