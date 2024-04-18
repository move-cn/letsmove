module hello_move::ayoung_cs {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct HelloMove_AYOUNG has key, store {
        id: UID,
        text: string::String
    }

    #[lint_allow(self_transfer)]
    public fun mint(ctx: &mut TxContext) {
        let object = HelloMove_AYOUNG {
            id: object::new(ctx),
            text: string::utf8(b"Hello AYOUNG")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }

}