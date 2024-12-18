// 定义模块 task1::task1_hello
module task1::task1_hello {
    // 导入需要使用的标准库和 Sui 框架
    use std::string;                     // 用于处理字符串
    use sui::object::{Self, UID};        // 用于创建和管理对象
    use sui::transfer;                   // 用于转移对象所有权
    use sui::tx_context::{Self, TxContext};  // 用于获取交易上下文

    // 定义一个具有 key 和 store 能力的结构体
    // key: 表示这个对象可以作为全局存储的键
    // store: 表示这个对象可以被存储
    public struct HelloObj has key, store {
        id: UID,           // 对象的唯一标识符
        say: string::String // 存储问候消息的字符串
    }

    // 公共函数，用于创建新的 HelloObj 对象并转移给调用者
    public fun mint(ctx: &mut TxContext) {
        // 创建一个新的 HelloObj 实例
        let object = HelloObj {
            id: object::new(ctx),                    // 生成新的唯一标识符
            say: string::utf8(b"Hello unlizhao!")  // 设置问候消息
        };
        // 将创建的对象转移给交易发送者
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}
