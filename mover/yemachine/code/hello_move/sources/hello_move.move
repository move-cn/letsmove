// Module: hello_move
module hello_move::hello_move {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct HelloMove has key, store {
        id: UID,
        text: string::String
    }

    public fun mint(ctx: &mut TxContext) {
        let object = HelloMove {
            id: object::new(ctx),
            text: string::utf8(b"Hello yemachine!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}

