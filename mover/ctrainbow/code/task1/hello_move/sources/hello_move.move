/*
/// Module: hello_move
module hello_move::hello_move;
*/
module hello_move::hello ;

use std::ascii::{String, string};
use sui::transfer::transfer;

public struct Hello has key {
    id: UID,
    say: String
}

fun init(ctx: &mut TxContext) {
    let hello_move = Hello {
        id: object::new(ctx),
        say: string(b"ctrainbow"),
    };
    transfer(hello_move, ctx.sender());
}