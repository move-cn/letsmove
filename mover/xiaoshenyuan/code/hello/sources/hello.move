module hello::xiaoshenyuan {
    use std::string;
    use sui::transfer::public_transfer;
    public struct Object has key, store {
        id: UID,
        name: string::String
    }

    fun init(ctx: &mut TxContext) {
        let object = Object {
            id: object::new(ctx),
            name: string::utf8(b"Hello xiaoshenyuan!")
        };
        public_transfer(object, tx_context::sender(ctx));
    }
}