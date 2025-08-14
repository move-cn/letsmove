module hello_move::hello {
    use std::ascii::{String, string}; // 导入标准库的字符串类型和函数
    use sui::object::{Self,UID}; // 导入 Sui 对象模块的自我标识和唯一标识符
    use sui::transfer::transfer; // 导入 Sui 转移模块的转移函数
    use sui::tx_context::{TxContext, sender}; // 导入交易上下文模块的交易上下文和发送者函数

    // 定义一个具有 key 的结构体 Hello
    public struct Hello has key{
        id: UID, // 唯一标识符
        say: String // 存储的字符串信息
    }

    // 初始化函数，用于创建一个 Hello 对象
    fun init(ctx: &mut TxContext) {
        // 创建一个 Hello 对象，并设置 id 和 say 属性
        let hello_move = Hello {
            id: object::new(ctx), // 使用交易上下文生成唯一标识符
            say: string(b"hello VirFriend"), // 设置 say 为 "hello VirFriend"
        };
        // 将创建的 Hello 对象转移给交易发送者
        transfer(hello_move, sender(ctx));
    }
}
