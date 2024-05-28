/// The module `hello_world` under named address `hello_world`.
/// The named address is set in the `Move.toml`.
module hello_world::hello_world {
    use std::ascii::{String, string};
    use sui::transfer::transfer;
    use sui::tx_context::{sender};

    public struct Hello has key{
        id: UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello = Hello {
            id:object::new(ctx),
            say: string(b"hello, ayu011"),
        };
        transfer(hello, sender(ctx));
    }
}
