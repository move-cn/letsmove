
module my_coin::maybeOk_Faucet;
use sui::coin::create_currency;
use std::option::{none,some};
use sui::transfer::{public_transfer,public_freeze_object,public_share_object};
use sui::url::Url;

public struct MAYBEOK_FAUCET has drop{}

fun init(maybeOk : MAYBEOK_FAUCET,ctx: &mut TxContext){

    let no=none<Url>();

    let(treasury ,coin_metadata)  =
    create_currency(maybeOk,8,b"MAYBEOK_FAUCET",b"MAYBEOK_FAUCET",b"this is person MAYBEOK_FAUCET test",no,ctx);

    public_freeze_object(coin_metadata);

    
    
    //public_transfer(treasury,ctx.sender());

    public_share_object(treasury);

    
}

