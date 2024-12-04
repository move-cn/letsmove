module task1::task1 {
    // module contents
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};

    /// 包含了任意字符串的 object
    public struct HelloWorldObject has key, store {
        id: UID,
        /// 被 object 包含的字符串
        text: string::String
    }

    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Stackingrule")
        };
        transfer::transfer(object, sender(ctx));
    }

}

