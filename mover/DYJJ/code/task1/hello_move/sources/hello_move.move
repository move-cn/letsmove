module 0x0::hello_move {
    use std::string;
    use sui::object::{UID, Self as Object};
    use sui::transfer;
    use sui::tx_context::{Self as TxContext, sender};

    // 定义 HelloObj 结构体，包含 ID、消息和 GitHub ID
    public struct HelloObj has key, store {
        id: UID,
        message: string::String,
        github_id: string::String,
    }

    // 创建新的 HelloObj 对象并进行转移
    public fun create_hello_object(ctx: &mut TxContext) {
        let id = Object::new(ctx);
        let hello_message = string::utf8(b"Hello DYJJ!");
        let github_id = string::utf8(b"DYJJ");

        let new_object = HelloObj {
            id,
            message: hello_message,
            github_id,
        };

        transfer::public_transfer(new_object, sender(ctx));
    }

    // 修改 HelloObj 的消息
    public fun update_message(obj: &mut HelloObj, new_message: string::String) {
        obj.message = new_message;
    }

    // 获取 HelloObj 的消息
    public fun get_message(obj: &HelloObj): string::String {
        obj.message
    }

    // 获取 HelloObj 的 GitHub ID
    public fun get_github_id(obj: &HelloObj): string::String {
        obj.github_id
    }
}
