module hello::hello ;

use std::ascii::{String, string};
use sui::transfer::transfer;

public struct Hello has key {
    id: UID,
    say: String
}

fun init(ctx: &mut TxContext) {
    let hello = Hello {
        id: object::new(ctx),
        say: string(b"BethelDEV"),
    };
    transfer(hello, ctx.sender());
}
