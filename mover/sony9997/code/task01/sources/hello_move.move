/// Module: hello_move
module hello_move::hello_move {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// An object that contains an arbitrary string
    struct HelloWorldObject has key, store {
        id: UID,
        /// A string contained in the object
        text: string::String
    }

    public entry fun say_hello(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello sony9997")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_say_hello(ctx: &mut TxContext) {
        say_hello(ctx)
    }
}
