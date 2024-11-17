/*
/// Module: task1
*/
module hello_move::hello_move {
    use std::ascii::{String, string};

    public struct Hello has key, store {
        id: UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move_twy = Hello {
            id: object::new(ctx),
            say: string(b"Hello djytwy")
        };
        transfer::public_transfer(hello_move_twy, ctx.sender())
    }
}
