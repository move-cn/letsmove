/// Module: hello
module hello::Hello {
    use std::ascii::{String, string};
    use sui::transfer::transfer;

    public struct Hello has key, store {
        id: UID,
        content: String
    }

    fun init(ctx: &mut TxContext) {
        transfer(Hello {
            id: object::new(ctx),
            content: string(b"Hello, Move!"),
        }, tx_context::sender(ctx))
    }
}
