module faucet_coin::eig;
use std::option::none;
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_share_object};
use sui::url::Url;

public struct EIG has drop{}

fun init(eig:EIG,ctx: &mut TxContext){
    let eig_img = none<Url>();
    let (treasury,metadata) = create_currency(eig,8,b"EIG",b"EIG",b"eig coin",eig_img,ctx);
    public_freeze_object(metadata);
    public_share_object(treasury);
}

