module hellomove::hello ;

use std::ascii::{String, string};
use sui::transfer::transfer;

public struct Hello has key {
    id: UID,
    say: String
}

fun init(ctx: &mut TxContext) {
    let hellomove = Hello {
        id: object::new(ctx),
        say: string(b"guipi01"),
    };
    transfer(hellomove, ctx.sender());
}