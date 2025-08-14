module hello_move::hello {
    use std::string::{Self, String};
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct HelloObj has key {
        id: UID,
        msg: String,
    }

    public fun say_hello(ctx: &mut TxContext) {
        let world = HelloObj {
            id: object::new(ctx),
            msg: string::utf8(b"Hello Move"),
        };
        transfer::transfer(world, tx_context::sender(ctx));
    }
}