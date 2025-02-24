
module my_coin::maybeOk;
use sui::coin::create_currency;
use std::option::{none,some};
use sui::transfer::{public_transfer,public_freeze_object};
use sui::url::Url;

public struct MAYBEOK has drop{}

fun init(maybeOk : MAYBEOK,ctx: &mut TxContext){

    let no=none<Url>();

    let(treasury ,coin_metadata)  =
    create_currency(maybeOk,8,b"MAYBEOK",b"MAYBEOK",b"this is person test",no,ctx);

    public_freeze_object(coin_metadata);

    
    
    public_transfer(treasury,ctx.sender());

    //public_share_object(treasury);

    
}

