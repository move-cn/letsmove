module hello_move::hello {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};


    /*
    // struct 最多拥有4项能力
    1-copy 值可以被复制
    2-drop 在作用域范围结束后值可以被丢弃
    3-key 在全局存储操作中值可以被用为key键
    4-store 值可以在全局存储中被存储
    */
    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id:object::new(ctx),
            say: string(b"0x-wen"),
        };
        transfer(hello_move, sender(ctx));
    }
}