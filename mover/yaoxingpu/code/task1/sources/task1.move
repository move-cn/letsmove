/// Module: task1
module task1::task1 {
    use std::string::{String};

    public struct HelloMove has key, store {
        id: UID,
        text: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = HelloMove {
            id: object::new(ctx),
            text: b"yaoxingpu".to_string()
        };
        transfer::transfer(hello_move, ctx.sender())
    }
}
