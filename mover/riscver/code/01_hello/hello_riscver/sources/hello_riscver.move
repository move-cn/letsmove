/*
/// Module: hello_riscver
module hello_riscver::hello_riscver;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module hello_riscver::hello {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key {
        id: UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_riscver = Hello {
            id: object::new(ctx),
            say: string(b"riscver"),
        };
        transfer(hello_riscver, sender(ctx));
    }
}
