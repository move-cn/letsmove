// Module: task1_hello
module task1_hello::task1_hello {
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct HelloObj has key, store {
        id: UID,
        say: string::String
    }

    public fun mint(ctx: &mut TxContext) {
        let object = HelloObj {
            id: object::new(ctx),
            say: string::utf8(b"Hello Geek-zlk!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}


