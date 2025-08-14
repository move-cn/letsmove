/// Module: task1
module task1::task1 {
    use sui::transfer;
    use std::string::{Self, String};
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    struct Hello has key {
        id: UID,
        msg: String,
    }

    public fun hello_world(ctx: &mut TxContext) {
        let world = Hello {
            id: object::new(ctx),
            msg: string::utf8(b"Hello World"),
        };
        transfer::transfer(world, tx_context::sender(ctx));
    }
}
