module hello_pai::task1 {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};
    
    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_pai = Hello {
            id:object::new(ctx),
            say: string(b"Hello Part01-Pai"),
        };
        transfer(hello_pai, sender(ctx));
    }
}