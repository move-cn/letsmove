module task1::hello_move {

    use std::string;

    public struct HelloMoveObject has key, store {
        id: UID,
        message: string::String
    }

    #[lint_allow(self_transfer)]
    public fun mint(ctx: &mut TxContext) {
        let object = HelloMoveObject {
            id: object::new(ctx),
            message: string::utf8(b"Hello Move, sleepingF0x!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}
