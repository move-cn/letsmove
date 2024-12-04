/*
/// Module: hellomove
module hellomove::hellomove;
*/


module hellomove::hello {

    use std::ascii::{String, string};
    use sui::transfer::transfer;

    public struct Hello has key {
        id: UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id: object::new(ctx),
            say: string(b"Laolong1994"),
        };
        transfer(hello_move, ctx.sender());
    }
}