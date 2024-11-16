/*
/// Module: task1
module task1::hello;
*/
module task1::hello{

    use std::string;

    public struct HelloWorldObject has key, store {
        id: UID,
        text: string::String
    }

    #[lint_allow(self_transfer)]
    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello zy88866")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
    
}