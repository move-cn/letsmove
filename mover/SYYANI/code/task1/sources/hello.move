module hello_world::hello_world {
    use std::ascii::{String, string};
    use sui::object::{Self, UID};
    se sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct HelloWorldObject has key {
        id: UID,
        text: String
    }

    fun init(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string(b"SYYANI")
        };
        transfer::public_transfer(object, sender(ctx));
    }
}
