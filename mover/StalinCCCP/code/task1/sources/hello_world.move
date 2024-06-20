module hello_world::hello {
    use sui::tx_context::sender;
    use std::string;
    use std::string::String;

    public struct Data has key,store{
        id:UID,
        gid:String
    }

    fun init(ctx:&mut TxContext){
        transfer::public_transfer(
            Data{
                id:object::new(ctx),
                gid:string::utf8(b"62281472")
            }
            ,sender(ctx));
    }

}