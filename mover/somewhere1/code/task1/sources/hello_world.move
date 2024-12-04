module hello_world::hello_world {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct HelloWorldObject has key, store {
        id: UID,
        text: std::string::String 
    }

    #[lint_allow(self_transfer)]
    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx), 
            text: std::string::utf8(b"Hello somewhere1") 
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}

