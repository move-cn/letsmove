 module hellosui::hello;

use std::ascii::{String, string};
use sui::transfer::transfer;

public struct Hello has key {
    id: UID,
    say: String
}

fun init(ctx: &mut TxContext){
    let hello_sui = Hello {
        id: object::new(ctx),
        say: string(b"murphy-zone"),
    };

    transfer(hello_sui, ctx.sender());
}
