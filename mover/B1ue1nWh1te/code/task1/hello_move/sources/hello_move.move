module hello_move::hello {
    use std::string::{Self, String};
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct Hello has key {
        id: UID,
        str: String,
    }

    public fun say_hello(ctx: &mut TxContext) {
        let world = Hello {
            id: object::new(ctx),
            str: string::utf8(b"Hello Move"),
        };
        transfer::transfer(world, tx_context::sender(ctx));
    }
}
