
/// Module: task1
module task1::task1 {
    use std::string;

    public struct Hello has key, store {
        id: UID,
        text: string::String
    }

    public entry fun mint(ctx: &mut TxContext) {
        let object = Hello {
            id: object::new(ctx),
            text: string::utf8(b"Hello cheng!")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}

