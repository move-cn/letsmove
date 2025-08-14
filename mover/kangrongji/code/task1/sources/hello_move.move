module task1::hello_move {

    use std::string;

    public struct HelloMove has key {
        id: UID,
        say: string::String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = HelloMove {
            id: object::new(ctx),
            say: string::utf8(b"move"),
        };
        transfer::transfer(hello_move, tx_context::sender(ctx));
    }

}
