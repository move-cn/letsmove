
module my_coin::my_coin;

use sui::coin::create_currency;
use std::option;
use sui::transfer::{public_transfer, public_freeze_object};

public struct MY_COIN has drop{}


fun init(witness: MY_COIN, ctx: &mut TxContext) {
    let (treasury, metadata) = create_currency(witness, 6, b"MY_COIN", b"my_coin", b"", option::none(), ctx);

    public_freeze_object(metadata);
    public_transfer(treasury, ctx.sender());
}

