module hello_world::hello_world{

    use std::string;
    use sui::object::{Self,UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    #[allow(duplicate_alias)]
    struct HelloWorldObject has key, store {
        id: UID,
        text: string::String,
    }

    #[allow(duplicate_alias)]
    public entry fun mint(ctx: &mut TxContext) {
        let o = HelloWorldObject{
            id: object::new(ctx),
            text: string::utf8(b"hello world!"),
        };
        transfer::transfer(o, tx_context::sender(ctx));
    }

}