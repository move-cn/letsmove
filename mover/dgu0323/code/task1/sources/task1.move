module task1::hello;
use std::ascii::{String, string};

public struct Hello has key {
    id: UID,
    say: String
}

fun init(ctx: &mut TxContext) {
    let hello = Hello {
        id: object::new(ctx),
        say: string(b"dgu0323")
    };

    transfer::transfer(hello, ctx.sender());
}

