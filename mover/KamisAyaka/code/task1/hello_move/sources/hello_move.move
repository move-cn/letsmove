/*
/// Module: hello_move
module hello_move::hello_move;
*/

// 引用Move编程规范的链接
// https://docs.sui.io/concepts/sui-move-concepts/conventions

// 定义一个名为 `hello` 的模块在 `hello_move` 包中
module hello_move::hello {
    // 导入标准库中的 `ascii` 模块，用于处理字符串
    use std::ascii::{String, string};
    // 导入 `sui` 框架中的 `object` 模块，用于创建和管理对象
    use sui::object::{Self, UID};
    // 导入 `sui` 框架中的 `transfer` 函数，用于转移对象所有权
    use sui::transfer::transfer;
    // 导入 `sui` 框架中的 `tx_context` 模块，用于访问交易上下文信息
    use sui::tx_context::{TxContext, sender};

    // 定义一个具有 `key` 能力的结构体 `Hello`
    public struct Hello has key {
        id: UID,          // 对象的唯一标识符
        say: String       // 存储的字符串信息
    }

    // 初始化函数，通常在模块发布时调用
    fun init(ctx: &mut TxContext) {
        // 创建一个新的 `Hello` 对象
        let hello_move = Hello {
            id: object::new(ctx),  // 使用交易上下文创建新的UID
            say: string(b"KamisAyaka"),  // 初始化字符串 "move"
        };
        // 将新创建的 `Hello` 对象转移到交易发送者的地址
        transfer(hello_move, sender(ctx));
    }
}