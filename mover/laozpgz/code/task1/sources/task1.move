
/// Module: task1

module task1::hello_move {
    use std::ascii::{String, string};
    use sui::transfer::transfer;
    use sui::tx_context::{sender};

    public struct HelloMove has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = HelloMove {
            id:object::new(ctx),
            say: string(b"Hello laozpgz"),
        };
        transfer(hello_move, sender(ctx));
    }
}