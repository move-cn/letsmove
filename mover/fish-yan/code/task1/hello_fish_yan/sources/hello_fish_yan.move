/*
/// Module: hello_fish_yan
module hello_fish_yan::hello_fish_yan;
*/
module hello_fish_yan::hello_fish_yan {
    use std::ascii::{String, string};
    use sui::object::{Self, UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key {
        id: UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id: object::new(ctx),
            say: string(b"hello fish-yan"),
        };
        transfer(hello_move, sender(ctx));
    }
}