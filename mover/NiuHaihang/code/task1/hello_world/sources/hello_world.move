module hello_world::hello_world {
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// An object that contains an arbitrary string
    public struct HelloWorld has key, store {
        id: UID,
        /// A string contained in the object
        text: string::String
    }

    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloWorld {
            id: object::new(ctx),
            text: string::utf8(b"Hello,NiuHaihang!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}
