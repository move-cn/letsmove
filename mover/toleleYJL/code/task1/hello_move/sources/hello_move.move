module hello_move::hello {
    use std::ascii::{String, string};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id:object::new(ctx),
            say: string(b"toleleYJL"),
        };
        transfer::transfer(hello_move, tx_context::sender(ctx));
    }
}