module hello_move::hello {
    use sui::object::UID;
    use sui::tx_context::TxContext;
    use std::string::String;
    use sui::transfer;
    use sui::object;
    use sui::tx_context;

    public struct Hello has key {
        id: UID,
        str: String,
    }

    public fun say_hello(ctx: &mut TxContext) {
        let word = Hello {
            id: object::new(ctx),
            str: string::utf8(b"Hello yueliao11"),
        };
        transfer::transfer(word, tx_context::sender(ctx));
    }
} 