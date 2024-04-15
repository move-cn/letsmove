  /*
/// Module: hello_2H-K
module hello_2H-K::hello_2H-K {

}
*/
module hello_2H-K::hello {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_2H-K = Hello {
            id:object::new(ctx),
            say: string(b"hello 2H-K"),
        };
        transfer(hello_2H-K, sender(ctx));
    }
}
