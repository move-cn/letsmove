module hello_move::hello_move ;

use std::ascii::{String, string};
use sui::transfer::transfer;

public struct HelloMove has key {
    id: UID,
    say: String
}

fun init(ctx: &mut TxContext) {
    let hello_move = HelloMove {
        id: object::new(ctx),
        say: string(b"jaynft479"),
    };
    transfer(hello_move, ctx.sender());
}