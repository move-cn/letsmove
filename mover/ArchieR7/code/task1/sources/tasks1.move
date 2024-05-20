module tasks::taks1 {
    use std::ascii::{String, string};

    public struct HelloMove has key {
        id: UID,
        say: String,
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = HelloMove {
            id: object::new(ctx),
            say: string(b"ArchieR7"),
        };
        transfer::transfer(hello_move, tx_context::sender(ctx));
    }
}
