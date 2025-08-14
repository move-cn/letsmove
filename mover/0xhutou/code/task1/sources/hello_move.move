/// Module: task1
module hello_move::hello_move {
    use sui::object::{Self, UID};
    use sui::tx_context::{TxContext, sender};
    use std::ascii::{String, string};
    use sui::transfer::transfer;

    public struct Hello_Move has key {
        id: UID,
        context: String,
    }

    
    fun init(ctx: &mut TxContext) {
        let hello = Hello_Move{
            id: object::new(ctx),
            context: string(b"0xhutou"),
        };

        transfer(hello, sender(ctx));
    
    }

}
