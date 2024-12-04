module hello_move::hello {

    // Part 1: These imports are provided by default
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::string;

    // Part 2: struct definitions
    public struct Message has key, store {
        id: UID,
        content: string::String,
    }

    // Part 3: Module initializer to be executed when this module is published
    fun init(ctx: &mut TxContext) {
        let hello_message = Message {
            id: object::new(ctx),
            content: string::utf8(b"Hello Nii11L!")
        };

        // Transfer the Message object to the module/package publisher
        transfer::transfer(hello_message, ctx.sender());
    }
}