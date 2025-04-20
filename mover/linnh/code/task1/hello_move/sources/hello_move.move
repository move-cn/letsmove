/*
/// Module: hellomove
module hellomove::hello_move;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module hellomove::hello {
    use std::ascii::{String, string};
    use sui::transfer::transfer;
    use sui::tx_context::{sender};

    public struct Hello has key{
        id: UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id:object::new(ctx),
            say: string(b"linnh"),
        };
        transfer(hello_move, sender(ctx));
    }
}

