/// Module: hello
module hello::hello {
    use sui::tx_context::{sender};
    use std::string;
    use std::string::String;
    use sui::event;

    public struct HelloMove has key, store {
        id: UID,
        val: String,
    }

    // ====== Events ======

    public struct InitEvent has copy, drop {
        id: ID,
        val: String,
    }

    fun init(ctx:&mut TxContext){
        let id = object::new(ctx);
        event::emit(InitEvent {id: object::uid_to_inner(&id), val: string::utf8(b"itpika")});
        transfer::public_transfer(HelloMove{
            id,
            val: string::utf8(b"itpika"),
        }, sender(ctx));
    }

    // public fun print() {
    //     debug::print(string::utf8(b"itpika"));
    // }
}
