module hello_move::hello_SennHanami {
    use std::string;

    /// An object that contains an arbitrary string
    public struct HelloWorldObject has key, store {
        id: UID,
        /// A string contained in the object
        text: string::String
    }

    
    fun init(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello SennHanami!")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }

}