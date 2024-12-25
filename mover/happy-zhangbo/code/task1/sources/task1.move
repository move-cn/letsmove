/*
/// Module: task1
module task1::task1;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module task1::task1 {
    use std::string;
    use sui::event;  // 新增：用于发送事件
    use sui::clock::{Self, Clock};  // 新增：使用时钟

    // 定义事件结构
    struct MessageContentEvent has copy, drop {
        content: string::String,
        created_at: u64
    }

    /// 定义一个包含消息的结构体
    public struct Message has key, store {
        id: sui::object::UID,
        content: string::String,
        created_at: u64  // 新增：创建时间
    }

    /// 创建消息对象
    public entry fun create_message(clock: &Clock, ctx: &mut sui::tx_context::TxContext) {
        let message = Message {
            id: sui::object::new(ctx),
            content: string::utf8(b"happy-zhangbo"),
            created_at: clock::timestamp_ms(clock)  // 添加时间戳
        };
        
        // 发出创建事件
        event::emit(MessageContentEvent { 
            content: string::utf8(b"happy-zhangbo"),
            created_at: clock::timestamp_ms(clock)
        });
        
        sui::transfer::transfer(message, sui::tx_context::sender(ctx));
    }

    /// 获取消息内容的公共函数
    public fun get_content(message: &Message): string::String {
        message.content
    }

    /// 获取创建时间
    public fun get_created_at(message: &Message): u64 {
        message.created_at
    }

    /// 通过事件方式获取消息内容
    public entry fun emit_content(message: &Message) {
        event::emit(MessageContentEvent { 
            content: get_content(message),
            created_at: get_created_at(message)
        });
    }

    /// 新增：查看消息内容的入口函数s
    public entry fun view_message(message: &Message) {
        let _content = get_content(message);
        // 在 Move 中，我们无法直接打印内容
        // 但可以通过事件或前端获取
    }
}


