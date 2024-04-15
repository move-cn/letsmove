module hello::hello {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    struct Hello has key{
        id:UID,
        say: String
    }
    #[lint_allow(self_transfer)] // 允许在此函数中进行自转移操作
    fun init(ctx: &mut TxContext) {
        let hello = Hello {
            id:object::new(ctx),
            say: string(b"move"),
        };
        transfer(hello, sender(ctx));
    }
}