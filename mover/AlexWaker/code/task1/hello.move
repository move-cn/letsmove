module my_first_package::HelloAlexWaker {

    // use sui::object::{Self, UID};
    // use sui::tx_context::{Self, TxContext};

    /// 定义一个结构体 Greeting，用于存储问候信息
    public struct Greeting has key, store {
        id: UID,
        message: vector<u8>,
    }

    /// 初始化函数，创建一个新的 Greeting 对象，并将 message 设置为 "Hello, Sui!"
    public fun create_greeting(ctx: &mut TxContext): Greeting {
        Greeting {
            id: object::new(ctx),
            message: b"Hello AlexWaker!"
        }
    }

    /// 更新 Greeting 对象中的 message
    public fun set_greeting(greeting: &mut Greeting, new_message: vector<u8>) {
        greeting.message = new_message;
    }

    /// 获取 Greeting 对象中的 message
    public fun get_greeting(greeting: &Greeting): vector<u8> {
        greeting.message
    }
}
