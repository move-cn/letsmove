/*
/// Module: hello_move
module hello_move::hello_move {

}
*/
module hello_move::hello_2H_K {//我id是2H-K但连字符是非法字符会报错，所以用_代替。
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello_2H_K has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello_2H_K {//我id是2H-K但连字符是非法字符会报错，所以用_代替。
            id:object::new(ctx),
            say: string(b"hello 2H-K"),
        };
        transfer(hello_move, sender(ctx));
    }
}
