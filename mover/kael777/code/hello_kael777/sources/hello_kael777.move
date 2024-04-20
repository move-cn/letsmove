
/// Module: hello_kael777
module hello_kael777::hello_kael777 {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct HelloKael777 has key{
        id:UID,
        say: String,
        githubId: String,
    }

    fun init(ctx: &mut TxContext) {
        let hello = HelloKael777 {
            id:object::new(ctx),
            say: string(b"hello kael777"),
            githubId: string(b"kael777")
        };
        transfer(hello, sender(ctx));
    }
}

