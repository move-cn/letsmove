module task1::hello_move {
    use std::ascii::{String, string};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id:object::new(ctx),
            say: string(b"hello move"),
        };

        let sender = tx_context::sender(ctx);

        transfer::transfer(hello_move, sender);
    }
}
