module hello_orange1244::hello_orange1244 {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct HelloOrange1244  has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_orange1244 = HelloOrange1244 {
            id:object::new(ctx),
            say: string(b"orange1244"),
        };
        transfer(hello_orange1244, sender(ctx));
    }
}