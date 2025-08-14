/// Module: hello
module hello::hello {
    use sui::transfer;
    use sui::object::{Self, UID};
    use std::string::{Self, String};
    use sui::tx_context::{Self, TxContext};

    struct Hello has key {
        id: UID,
        msg: String,
    }

    public fun hello(ctx: &mut TxContext) {
        let world = Hello {
            id: object::new(ctx),
            msg: string::utf8(b"Hello World"),
        };
        transfer::transfer(world, tx_context::sender(ctx));
    }
}
