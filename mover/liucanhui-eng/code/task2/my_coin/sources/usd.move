module my_coin::usd;
use std::option::none;
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_transfer};
use sui::url::Url;


public struct USD has drop{}

fun init(usd:USD, ctx:&mut TxContext){
    let no = none<Url>();
    // let url = url::new_unsafe_from_bytes(b"https://www.zmtc.com/wp-content/uploads/2022/0926/20220926081721426.jpg");
    let (treasury_cap,coin_metadata)= create_currency(usd,8,b"USD",b"USD",b"this is a usd coin",no,ctx);
    public_freeze_object(coin_metadata);
    public_transfer(treasury_cap,ctx.sender());
}
