module task1::hello_word {
    use std::string;

    public struct HelloYear19951 has key, store {
        id: UID,
        text: string::String
    }

    public entry fun mint(ctx: &mut TxContext) {
        let id = object::new(ctx);
        let msg = string::utf8(b"Hello year1951");
        let object = HelloYear19951{
            id: id,
            text: msg
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}