module task1::hello {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let task1 = Hello {
            id:object::new(ctx),
            say: string(b"hello dongbiying"),
        };
        transfer(task1, sender(ctx));
    }
}


