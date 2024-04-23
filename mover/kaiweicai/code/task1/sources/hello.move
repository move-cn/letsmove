module hello::hello {
    use sui::object::{Self,UID};
    use std::ascii::{Self,String,string};
    use sui::transfer::{Self,transfer};
    use sui::tx_context::{TxContext,sender};

    public struct Hello has key,store{
        id:UID,
        say:String,
    }

    fun init(ctx: &mut tx_context::TxContext) {
        let hello_move = Hello{
            id:object::new(ctx),
            say:string(b"move"),
        };
        transfer(hello_move,sender(ctx));
    }
}
