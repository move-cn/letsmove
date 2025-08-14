/// Module: code
module task1::task1{
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use std::string::{String, Self};
    use sui::transfer;

    public struct HelloStruct has key {
        id: UID,
        say: String
    }

    public fun say_hello(ctx: &mut TxContext) {
        let object = HelloStruct {
            id: object::new(ctx),
            say: string::utf8(b"Hello Draculabo!")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}

