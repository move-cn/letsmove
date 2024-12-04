module task1::task1_hello {
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
            say: string::utf8(b"Hello Erikaibble!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}


