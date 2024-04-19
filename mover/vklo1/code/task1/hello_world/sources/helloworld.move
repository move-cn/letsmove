module hello_move::hello {
    use sui::tx_context::{TxContext, sender};
    use sui::transfer;
    use std::string;
    use std::string::String;
    use sui::object;
    use sui::object::UID;
    public struct HelloMove has key,store{
        id: UID,
        hello:String
    }
    
    fun init(ctx:&mut TxContext){
        let hello  = string::utf8(b"Hello vklo1");
        transfer::public_transfer(HelloMove{id:object::new(ctx),hello:hello},sender(ctx));
    }

}

