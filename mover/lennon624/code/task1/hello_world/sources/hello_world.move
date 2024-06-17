/*
/// Module: hello_world
module hello_world::hello_world {

}
*/
module hello_world::hello_world {
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
            say: string(b"Hello lennon"),
        };
        transfer(hello_move, sender(ctx));
    }
}