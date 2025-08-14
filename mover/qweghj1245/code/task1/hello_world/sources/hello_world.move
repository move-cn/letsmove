module hello_world::hello_world {
    use sui::object::{UID, Self};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::string;

    public struct HelloWorldObject has key, store {
        id: UID,
        text: string::String
    }

    fun init(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World! qweghj1245")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}