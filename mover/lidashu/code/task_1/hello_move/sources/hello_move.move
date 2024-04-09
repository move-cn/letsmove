
/// Module: hello_move
module hello_move::hello_move {
    use std::string;

    public struct HelloMoveObject has key, store {
        id: UID,
        /// 被 object 包含的字符串
        text: string::String
    }

    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloMoveObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }

}