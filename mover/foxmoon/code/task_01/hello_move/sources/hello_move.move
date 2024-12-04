module 0x0::hello {
    use std::ascii::{String, string};
    use sui::object::UID;
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key {
        id: UID,
        say: String,
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id: sui::object::new(ctx),
            say: string(b"foxmoon"),
        };
        transfer(hello_move, sender(ctx));
    }
}
