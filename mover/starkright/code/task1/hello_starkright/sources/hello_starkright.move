module hello_starkright::hello_starkright {
    // Part-1: Imports
    use std::ascii::{ String, string };
    use sui::transfer::transfer;
    use sui::tx_context::{ sender };

    // Part-2: Type Definition
    public struct Hello has key {
        id: UID,
        say: String
    }

    // Part-3: Transfer hello_world Object
    fun init(ctx: &mut TxContext) {
        let hello_world = Hello {
            id:object::new(ctx),
            say: string(b"starkright"),
        };
        transfer(hello_world, sender(ctx));
    }
}