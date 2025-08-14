/// Module: hello_dcwon
module hello_dcwon::hello_dcwon {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_dcwon = Hello {
            id: object::new(ctx),
            say: string(b"dcwon"),
        };
        transfer(hello_dcwon, sender(ctx));
    }
}
