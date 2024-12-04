module hello_world::hello {
    use std::ascii::{String, string};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let helloWorld = Hello {
            id:object::new(ctx),
            say: string(b"hello rainbow"),
        };
        transfer::transfer(helloWorld,ctx.sender());
    }
}