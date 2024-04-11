module hello_world::hello_world {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct HelloWorldObject has key, store {
        id: UID,
        text: string::String
    }

    #[lint_allow(self_transfer)]
    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"hello_world")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }

}

// 0x6c48ba0aedd7ee157011b1b9161ef892176a1ac245fc6195a039cb8d40220a0b