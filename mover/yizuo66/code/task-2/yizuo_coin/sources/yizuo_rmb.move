/*
/// Module: yizuo_coin
module yizuo_coin::yizuo_coin;
*/

module yizuo_coin::yizuo_rmb ;
use sui::coin::create_currency;
use std::option::{none};
use sui::transfer::{  public_transfer, public_freeze_object, public_share_object};
use sui::url::Url;

public struct YIZUO_RMB has drop{}


fun init(usd: YIZUO_RMB, ctx: &mut TxContext){

    // https://github.com/MystenLabs/sui/blob/main/crates/sui-framework/packages/sui-framework/sources/coin.move#L211

    //  2     move 100   现实 1     1  0.01
    //  4     move 10000   现实 1     1  0.0001
    let no = none<Url>();
    // let url = url::new_unsafe_from_bytes(b"");
    // let yes = some<Url>(url);
    let (treasury, coin_metadata) =
        create_currency(usd, 8,  b"YIZUO_RMB",b"YIZUO_RMB",b"this is yizuo_rmb coin",no, ctx);

    public_freeze_object(coin_metadata);

    public_share_object(treasury);

}