/// Module: hello_1580752420
module hello_1580752420::hello_1580752420 {
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct HelloWorldObject has key, store {
        id: UID,
        text: string::String
    }

    #[lint_allow(self_transfer)]
    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello 1580752420!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}
