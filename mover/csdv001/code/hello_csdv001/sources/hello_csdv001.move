/// Module: hello_csdv001
module hello_csdv001::hello_csdv001 {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct HelloObject  has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello = HelloObject {
            id:object::new(ctx),
            say: string(b"hello csdv001!"),
        };
        transfer(hello, sender(ctx));
    }
}