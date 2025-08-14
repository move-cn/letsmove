module my_coin::my_coin;
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object,public_transfer};

public struct MY_COIN has drop{}

fun init(c:MY_COIN, ctx:&mut TxContext){
    let (treasury,meta) = create_currency(c, 8, b"HKD", b"Hong Kong Dollar", b"Test description", option::none(), ctx);
    public_freeze_object(meta);
    public_transfer(treasury,ctx.sender());
}

