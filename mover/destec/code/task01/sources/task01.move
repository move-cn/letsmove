/// Module: task01
module task01::task01;

use std::ascii::{String, string};
use sui::transfer::transfer;
use sui::tx_context::{sender};

public struct Hello has key {
    id: UID,
    say: String
}

public entry fun hello(ctx: &mut TxContext) {
    let hello_move = Hello {
        id: object::new(ctx),
        say: string(b"destec"),
    };
    transfer(hello_move, sender(ctx));
}