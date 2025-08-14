
module hello::rickiey {
    use std::string;
    use sui::transfer::public_transfer;
    public struct HelloWorldObject has key, store {
        id: UID,
        name: string::String
    }

    fun init(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            name: string::utf8(b"Hello rickiey!")
        };
        public_transfer(object, tx_context::sender(ctx));
    }
}