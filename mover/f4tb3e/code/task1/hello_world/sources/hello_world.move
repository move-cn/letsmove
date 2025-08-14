module hello_world::hello_world {
    use std::string::{Self, String};

    public struct Message has key, store {
        id: UID,
        content: String,
    }

    public entry fun say_hello(ctx: &mut TxContext) {
        let message = Message {
            id: object::new(ctx),
            content: string::utf8(b"Hello World!")
        };

        transfer::public_transfer(message, tx_context::sender(ctx))
    }
}