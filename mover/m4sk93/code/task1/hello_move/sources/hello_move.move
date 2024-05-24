/*
/// Module: hello_move
module hello_move::hello_move {

}
*/

module hello_move::hello_move {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct Hello has key, store {
        id: UID,
        text: string::String
    }
    
    public entry fun mint_hello_world(ctx: &mut TxContext) {
    // Mint an object that contains an ID and "Hello World" text
        let hello_object = Hello {
            id: object::new(ctx),
            text: string::utf8(b"hello ! m4sk93")
        };
        // Transfer the object to initializer address
        transfer::public_transfer(hello_object, tx_context::sender(ctx));
    }

}
