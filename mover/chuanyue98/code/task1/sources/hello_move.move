module task1::hello_move {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use std::string::{Self, String};
    use sui::transfer;

    struct HelloMove has key, store{
        id: UID,
        str: String,
    }

    public fun say_hello(ctx: &mut TxContext) {
        let hello = HelloMove {
            id: object::new(ctx),
            str: string::utf8(b"Hello, Move!"),
        };
        transfer::transfer(hello, tx_context::sender(ctx));
    }
}