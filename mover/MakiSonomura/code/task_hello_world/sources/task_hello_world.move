
/// Module: task_hello_world
module task_hello_world::task_hello_world {
    public struct HelloWorldObj has key, store {
        id: UID,
        text: std::string::String
    }
    #[lint_allow(self_transfer)]
    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObj {
            id: object::new(ctx), 
            text: std::string::utf8(b"Hello World, MakiSonomura!") 
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}

