/// Module: hellomove
module hellomove::hellomove {
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
            say: string(b"wasd845"),
        };
        transfer(hello_move, sender(ctx));
    }}

