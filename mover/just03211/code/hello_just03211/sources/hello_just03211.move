/// Module: hello_just03211
module hello_just03211::hello_just03211 {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct HelloJust03211 has key{
        id:UID,
        say: String,
        githubId: String,
    }

    fun init(ctx: &mut TxContext) {
        let hello = HelloJust03211 {
            id:object::new(ctx),
            say: string(b"hello just03211"),
            githubId: string(b"just03211")
        };
        transfer(hello, sender(ctx));
    }
}