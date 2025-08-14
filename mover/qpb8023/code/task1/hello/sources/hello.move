module hello::hello {

    use std::ascii::{String, string};

    public struct HelloObj has key, store {
        id: UID,
        content: String
    }

    fun init(ctx: &mut TxContext) {
        let hello = HelloObj {
            id: object::new(ctx),
            content: string(b"qpb8023"),
        };
        transfer::transfer(hello, tx_context::sender(ctx));
    }
}