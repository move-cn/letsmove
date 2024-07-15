/// Module: hello_move
module hello_move::hello_move {
    use std::string::{Self, String};
    public struct Hello has key, store {
        id: UID,
        name: String,
    }

    public entry fun say_hello(ctx: &mut TxContext) {
        let word = Hello {
            id: object::new(ctx),
            name: string::utf8(b"hello from wahack")
        };
        transfer::public_transfer(word, tx_context::sender(ctx))
    }
}
