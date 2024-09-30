module task1::hello_word {
    // 引用以下库，才能使用package::module调用到方法，如string函数，transfer函数等
    use std::string;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::object::{Self, UID};

    // 定制类型，id(全局唯一)为必须参数，string为任意字符，这里task1可以直接传参数"hello world"
    struct HelloWorldObject has key, store {
        id: UID,
        text: string::String
    }

    public entry fun mint(ctx: &mut TxContext) {
        // 拼装参数
        let id = object::new(ctx);
        let msg = string::utf8(b"Hello World!");
        // 调用结构申明
        let object = HelloWorldObject{
            id: id,
            text: msg
        };
        // 签名推链
        transfer::transfer(object, tx_context::sender(ctx));
    }
}