/// Module: hello_world

module hello_world::hello {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct HelloObject has key, store {
        id: UID,
        text: string::String
    }

    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello Move! From ShuiChang2019 72446172")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}

/// To publish, we need apply for gas coins which could work with `sui client faucet` and then `sui client gas` to check.
