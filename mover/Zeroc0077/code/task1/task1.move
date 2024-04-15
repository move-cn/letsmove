module hello::HelloWorld {
    use std::string;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::object::{Self,UID};

    struct TestObject has key, store {
        id: UID,
        text: string::String
    }

    public entry fun mint(text: vector<u8>, ctx: &mut TxContext) {
        let object = TestObject {
            id: object::new(ctx),
            text: string::utf8(text),
        };
        transfer::transfer(object,tx_context::sender(ctx));
    }
}