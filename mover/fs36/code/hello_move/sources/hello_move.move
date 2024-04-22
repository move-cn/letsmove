/*
/// Module: hello_move
module hello_move::hello_move {

}
*/
module hello_move::hello_fs36 {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello_fs36 has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello_fs36 {
            id:object::new(ctx),
            say: string(b"hello fs36"),
        };
        transfer(hello_move, sender(ctx));
    }
}