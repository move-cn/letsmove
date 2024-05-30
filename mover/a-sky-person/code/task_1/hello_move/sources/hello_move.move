module hello_move::hello_move {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};


    public struct HelloMoveObject has key, store {
        id: UID,
        text: string::String
    }


    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloMoveObject {
            id: object::new(ctx),
            text: string::utf8(b"s-sky-persson!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}
