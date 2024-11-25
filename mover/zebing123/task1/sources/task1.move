module hellola::hello ;

use std::ascii::{String, string};
use sui::transfer::transfer;

public struct Hello has key {
    id: UID,
    say: String
}

fun init(ctx: &mut TxContext) {
    let hellola = Hello {
        id: object::new(ctx),
        say: string(b"move zebing123"),
    };
    transfer(hellola, ctx.sender());
}
