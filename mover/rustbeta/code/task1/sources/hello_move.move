module task1::hello_move {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use std::string::{Self, String};
    use sui::transfer;

    struct HelloMove has key {
        id: UID,
        str: String,
    }

    public fun say_hello(ctx: &mut TxContext) {
        let greet = HelloMove {
            id: object::new(ctx),
            str: string::utf8(b"Hello, rustbeta!"),
        };
        transfer::transfer(greet, tx_context::sender(ctx));
    }
}
