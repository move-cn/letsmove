/// Module: task1
module hello_move_tests::hello_move_tests {
    use sui::object::{Self, UID};
    use sui::tx_context::{TxContext, sender};
    use std::ascii::{String, string};
    use sui::transfer::transfer;

    public struct Hello_Move_Test has key {
        id: UID,
        context: String,
    }

    fun init(ctx: &mut TxContext) {
        let hello = Hello_Move_Test{
            id: object::new(ctx),
            context: string(b"StarryDeserts"),
        };

        transfer(hello, sender(ctx));

    }
}

