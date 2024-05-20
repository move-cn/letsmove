/// Module: hello_move
module hello_move::hello_move {
    use std::string;
    use std::string::String;

    public struct HelloMoveObj has key, store {
        id: UID,
        text: String
    }

    #[allow(lint(self_transfer))]
    public fun mint(ctx: &mut TxContext) {
        let obj = HelloMoveObj {
            id: object::new(ctx),
            text: string::utf8(b"Hello gaowanlang!")
        };
        transfer::public_transfer(obj, ctx.sender());
    }
}

