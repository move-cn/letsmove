// Module: hello_world
module hello_world::hello_world {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    //包含任意字符串的 obejct
    public struct HelloWorldObject has key,store    {
        id: UID,
        // 被object包含的字符串
        text: string::String
    }

    public entry fun mint(ctx: &mut TxContext){
        let object = HelloWorldObject{
            id: object::new(ctx),
            text: string::utf8(b"hello JA1E0")
        };
        transfer::transfer(object, tx_context::sender(ctx))
    }

    // public fun addition (a:u8,b:u8): u8{
    //     // 没有分号的最后一行 为返回值
    //     a+b
    // }
}

