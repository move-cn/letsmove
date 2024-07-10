/*
/// Module: hello_xiaodi007
module hello_xiaodi007::hello_xiaodi007 {

}
*/
module hello_xiaodi007::hello_xiaodi007 {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id:object::new(ctx),
            say: string(b"hello_xiaodi007"),
        };
        transfer(hello_move, sender(ctx));
    }
}