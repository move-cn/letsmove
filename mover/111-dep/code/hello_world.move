module hello_world::hello ;

use std::ascii::{String, string};
use sui::transfer::transfer;

public struct Hello has key {
    id: UID,
    say: String
}

fun init(ctx: &mut TxContext) {
    let hello_world = Hello {
        id: object::new(ctx),
        say: string(b"111-dep"),
    };
    transfer(hello_world, ctx.sender());
}
