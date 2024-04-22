/// Module: hello_move
module hello_move::hello_move {
    use std::ascii::{String, string};
    use sui::object::{UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext,sender};

    public struct Object has key {
        id: UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Object {
            id: object::new(ctx),
            say: string(b"Hello Move!!"),
        };
        transfer(hello_move, sender(ctx));
    }

}

