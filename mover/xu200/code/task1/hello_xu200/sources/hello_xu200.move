/*
/// Module: hello_xu200
module hello_xu200::hello_xu200;
*/
module hello_xu200::hello {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_xu200 = Hello {
            id:object::new(ctx),
            say: string(b"Hello,xu200"),
        };
        transfer(hello_xu200, sender(ctx));
    }
}
