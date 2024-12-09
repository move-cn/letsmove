module hello_move::hello_move {
    use std::ascii::{String, string};
    use sui::transfer::transfer;
    use sui::event;

    public struct Hello has key {
        id:UID,
        text: String
    }

    public struct HelloEvent has copy, drop {
        text: String
    }

    fun init(ctx: &mut TxContext) {
        let who = b"JasonRUAN";

        let hello_move = Hello {
            id:object::new(ctx),
            text: string(who),
        };

        event::emit(HelloEvent {
            text: string(who)
            }
        );

        transfer(hello_move, ctx.sender());
    }
}

