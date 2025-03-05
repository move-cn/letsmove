module rmb::rmb;
use std::option::none;
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_share_object};
use sui::url::Url;


public struct RMB has drop{}

fun init(rmb:RMB, ctx:&mut TxContext){
    let no = none<Url>();
    let (treasury_cap,coin_metadata)= create_currency(rmb,8,b"rmb",b"rmb",b"this is a rmb coin",no,ctx);
    public_freeze_object(coin_metadata);
    public_share_object(treasury_cap);
}
