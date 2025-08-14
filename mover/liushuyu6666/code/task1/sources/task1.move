
/// Module: task1
module task1::hello_move {
    use std::string;

    public struct HelloMove has key, store {
        id: UID,
        text: string::String
    }

    public fun mint(ctx: &mut TxContext) {
        let object = HelloMove {
            id: object::new(ctx),
            text: string::utf8(b"Hello Move")
        };
        transfer::public_transfer(object, tx_context::sender(ctx))
    }
}

