/// Module: hello_world
module task1::task1 {
    use std::ascii::{String, string};
    use sui::transfer::transfer;
    use sui::tx_context::sender;

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id:object::new(ctx),
            say: string(b"yuhuangdadi666"),
        };
        transfer(hello_move, sender(ctx));
    }
}
