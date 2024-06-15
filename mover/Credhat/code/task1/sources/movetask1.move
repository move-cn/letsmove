/*
/// Module: movetask1
module movetask1::movetask1 {

}
*/
/// Module: movetask1
module movetask1::HelloWorld {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// An object that contains an arbitrary string
    public struct HelloWorldObject has key, store {
        id: UID,
        /// A string contained in the object
        text: string::String
    }

    public entry fun mint(text:vector<u8>, ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(text)
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }

}