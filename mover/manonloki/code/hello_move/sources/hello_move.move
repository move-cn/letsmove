
/// Module: hello_move
module hello_move::hello_move {
    // 导入需要的依赖
    use std::ascii::{String, string};
    // 新版已经不需要导入sui::object::{Self,UID}了
    use sui::transfer::transfer;
    use sui::tx_context::{ sender};

    // 定义结构体
    public struct Hello has key{
        id:UID,
        say: String
    }

    // 初始化函数
    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id:object::new(ctx),
            say: string(b"move"),
        };
        transfer(hello_move, sender(ctx));
    }
}
