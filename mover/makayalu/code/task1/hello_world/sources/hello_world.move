/*
/// Module: hello_world
module hello_world::hello_world;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module hello_world::hello_world{
    use std::ascii::{String, string};
    // use std::string;
    use sui::object::{Self,UID};
    use sui::transfer;
    use sui::tx_context::{TxContext};

    public struct Hello has key {
        id: UID,
        say: String
    }

    //function
    fun init(ctx: &mut TxContext){
        let hello_move = Hello {
            id: object::new(ctx),
            say: string(b"makayalu")
        };
        transfer::transfer(hello_move, ctx.sender());
    }
}



