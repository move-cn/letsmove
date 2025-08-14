module task1::hello_world {
    use std::string;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::object::{Self,UID};

    /// An object that contains an arbitrary string
    struct HelloWorldObject has key, store {
        id: UID,
        /// A string contained in the object
        text: string::String
    }

    public entry fun mint(text: vector<u8>, ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(text),
        };
        transfer::transfer(object,tx_context::sender(ctx));
    }

}