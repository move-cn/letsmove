module hello::hello{

    use std::string;
    use std::string::String;

    use sui::object::{new};

    use sui::transfer;

    public struct DEEE has key,store{
     id:UID,
     str:String,
 }
    public fun bald(
        ctx:&mut TxContext
    ){
        let yuyu=DEEE{
            id:object::new(ctx),
            str:string::utf8(b"hello ohcohciyx"),
        };
        transfer::public_transfer(yuyu,ctx.sender());
    }
}


