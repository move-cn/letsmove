module task1::hello_move {
    use std::string;
    
    public struct HelloObj has key, store {
        id: UID,
        say: string::String
    }

    #[allow(lint(self_transfer))]
    public fun mint(ctx: &mut TxContext) {
        let object = HelloObj {
            id: object::new(ctx),
            say: string::utf8(b"Hello AlwenXX!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}
