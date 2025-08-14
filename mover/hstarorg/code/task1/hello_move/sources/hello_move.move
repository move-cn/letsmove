/*
/// Module: hello_move
module hello_move::hello_move {
    
}
*/

module hello_move::hello_move {
    use std::string;
    // use sui::object::{Self, UID};
    // use sui::transfer;
    // use sui::tx_context::{TxContext};

    public struct Hello has key, store {
        id: UID,
        name: string::String
    }

    fun init(ctx: &mut TxContext) {
        let admin = Hello {
            id: object::new(ctx),
            name: string::utf8(b"hstarorg")
        };
        // Transfer the forge object to the module/package publisher
        transfer::transfer(admin, ctx.sender());
    }
      
    public fun hello(self: &Hello): string::String {
        self.name
    }
}