module task1::HelloSimon{
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct HelloSimon has key{
        id:UID,
        say: String
    }

    public fun mint(ctx: &mut TxContext) {
        let hello_move = HelloSimon {
            id:object::new(ctx),
            say: string(b"JonathanSimon123"),
        };
        transfer(hello_move, sender(ctx));
    }
}
