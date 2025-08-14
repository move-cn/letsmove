module hi_move::hi_move {
    use sui::transfer::transfer;
    use sui::object::{Self, UID};
    use std::ascii::{String, string};
    use sui::tx_context::{TxContext, sender};

    public struct Hi has key{
        id: UID,
        say: String,
    }

    fun init (ctx: &mut TxContext){
        let hi_moves = Hi{
            id: object::new(ctx),
            say: string(b"hi move"),
        };

        transfer(hi_moves, sender(ctx));
    }

}