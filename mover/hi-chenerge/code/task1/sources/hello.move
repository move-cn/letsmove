module task1::hello {
    use std::ascii::{string, String};
    use sui::object;
    use sui::object::UID;
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    struct Hello has key {
        id: UID,
        msg: String
    }

    fun init(ctx: &mut TxContext){
        let hello = Hello {
            id:object::new(ctx),
            msg: string(b"move"),
        };

        transfer(hello, sender(ctx));
    }
}
