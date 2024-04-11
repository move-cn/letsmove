module hello_move::hello_move {
    use sui::object::{Self, UID};
    use std::ascii::{String, string};
    use sui::tx_context::{TxContext, sender};
    use sui::transfer::transfer;

    public struct Hello has key {
        id: UID,
        say: String
    }
    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id: object::new(ctx),
            say: string(b"move"),
        };

        transfer(hello_move, sender(ctx));    
    }
}