/// Module: task1
#[allow(duplicate_alias)]
module task1::task1 {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id:object::new(ctx),
            say: string(b"brainsk"),
        };
        transfer(hello_move, sender(ctx));
    }
}



