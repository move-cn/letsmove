module faucet_coin::faucet_coin;
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object,public_share_object};

public struct FAUCET_COIN has drop{}

fun init(c:FAUCET_COIN, ctx:&mut TxContext){
    let (treasury,meta) = create_currency(c, 8, b"FHKD", b"Free Hong Kong Dollar", b"Test description", option::none(), ctx);
    public_freeze_object(meta);
    public_share_object(treasury);
}

