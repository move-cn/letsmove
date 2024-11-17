/// Module: task1
module hello_move::hello_move {
    use std::ascii::{String, string};
    use sui::tx_context::sender;
    use sui::transfer::transfer;

    public struct Hello_Move has key {
        id: UID,
        context: String,
    }

    fun init(ctx: &mut TxContext) {
        let hello = Hello_Move{
            id: object::new(ctx),
            context: string(b"MuyeC"),
        };

        transfer(hello, sender(ctx));
    }
}
