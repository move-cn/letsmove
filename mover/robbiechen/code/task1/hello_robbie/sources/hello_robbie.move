/*
/// Module: hello_robbie
module hello_robbie::hello_robbie {

}
*/
module hello_robbie::hello_robbie {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use std::string::{Self, String};
    use sui::transfer;

    public struct Hello has key {
        id: UID,
        str: String,
    }

    public fun say_hello(ctx: &mut TxContext) {
        let word = Hello {
            id: object::new(ctx),
            str: string::utf8(b"Hello RobbieChen"),
        };
        transfer::transfer(word, tx_context::sender(ctx));
    }
}