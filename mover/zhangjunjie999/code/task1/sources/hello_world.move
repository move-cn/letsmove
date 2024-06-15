module task1::hello_world {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct HelloWorld has key, store {
        id: UID,
        content: string::String
    }

    fun init(ctx: &mut TxContext) {
        let helloWorld = HelloWorld {
            id: object::new(ctx),
            content: string::utf8(b"Hello zhangjunjie999")
        };
        transfer::transfer(helloWorld, tx_context::sender(ctx));
    }
}