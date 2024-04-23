module task1::hello_word {
    use std::string;

    public struct HelloVanviChan has key, store {
        id: UID,
        text: string::String
    }

    public entry fun mint(ctx: &mut TxContext) {
        let id = object::new(ctx);
        let msg = string::utf8(b"Hello_VanviChan");
        let object = HelloVanviChan{
            id: id,
            text: msg
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}