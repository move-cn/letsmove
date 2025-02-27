module hello_move::hello_move{
    use sui::transfer::transfer;
    use std::ascii::{string,String};
    use sui::tx_context::sender;
    public struct Hello has key{
        id:UID,
        say:String
    }

    fun init(ctx: &mut TxContext) {
        let hello = Hello {
            id: object::new(ctx),
            say: string(b"lemin222"),

        };
        transfer(hello,sender(ctx));

    }

}

