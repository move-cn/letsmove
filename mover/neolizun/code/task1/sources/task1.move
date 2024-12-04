// Module: task1
module task1::hello_move {
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct HelloMove has key, store {
        id: UID,
        text: string::String
    }

    #[lint_allow(self_transfer)]
    public fun print(ctx: &mut TxContext) {
        let object = HelloMove {
            id: object::new(ctx),
            text: string::utf8(b"Hello neolizun !")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}
