#[allow(duplicate_alias)]
/// Module: hello_world
module hello_world::hello_world {
    use std::string;
    use std::debug;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// An object that contains an arbitrary string
    public struct HelloWorldObject has key, store {
        id: UID,
        /// A string contained in the object
        text: string::String
    }

    #[lint_allow(self_transfer)]
    public fun mint(ctx: &mut TxContext) {
        let h1 = @myaddress;
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"croal99")
        };
        debug::print(&h1);
        debug::print(&object);
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}
