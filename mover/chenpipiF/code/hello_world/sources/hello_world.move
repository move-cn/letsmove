module hello_world::hello_world{

    use std::string;
    use sui::object::{Self,UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    #[allow(duplicate_alias)]
    struct HelloWorldResult has key, store {
        id: UID,
        content: string::String,
    }

    #[allow(duplicate_alias)]
    public entry fun mint(ctx: &mut TxContext) {
        let obj = HelloWorldResult{
            id: object::new(ctx),
            content: string::utf8(b"hello world!"),
        };
        transfer::transfer(obj, tx_context::sender(ctx));
    }

}