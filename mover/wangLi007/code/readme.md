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

// 0x07b4092851da5204feb5818a42b335490554ad60063e4061479d457348b7c4b0
