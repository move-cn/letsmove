module task1::hello_world {

    // some imports
    use sui::object::{Self, UID};
    use std::string;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // some types
    struct HelloWorldObject has key, store {
        id: UID,
        text: string::String
    }

    // some functions
    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}