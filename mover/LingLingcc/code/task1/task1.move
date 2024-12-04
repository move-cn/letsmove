module hello::hello {
    use std::ascii;

    public struct Hello has key{
        id: UID,
        text: ascii::String
    }

    fun init(ctx: &mut TxContext) {
        let hello = Hello {
            id: object::new(ctx),
            text: ascii::string(b"LingLingcc"),
        };
        transfer::transfer(hello, tx_context::sender(ctx));
    }
}