/// Module: hello_world
module hello_world::hello_world {
    use std::string::{Self, String};
    public struct HelloWorld has key {
        id: UID,
        text: String
    }
    public fun new(text: vector<u8>, ctx: &mut TxContext) {
        transfer::share_object(HelloWorld{
            id: object::new(ctx),
            text: string::utf8(text),
        })
    }
}
