module my_coin::usd;
use std::option::none;
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_transfer};
use sui::url::Url;

public struct USD has drop{}

fun init(usd:USD,ctx: &mut TxContext){
    let usd_img = none<Url>();
    let (treasury,metadata) = create_currency(usd,8,b"USD",b"USD",b"world currency",usd_img,ctx);
    public_freeze_object(metadata);
    public_transfer(treasury,ctx.sender());
}
