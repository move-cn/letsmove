/// Module: hello_move
module hello_move::hello {
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct HelloObject has key, store {
        id: UID,
        text: string::String,
    }
    
    #[lint_allow(self_transfer)] 
    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}
