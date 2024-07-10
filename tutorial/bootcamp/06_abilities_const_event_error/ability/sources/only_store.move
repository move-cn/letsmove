module ability::only_store {

    use sui::object;
    use sui::object::UID;
    use sui::transfer::transfer;
    use sui::tx_context::sender;

    public struct Store has store{
        num:u8,
    }


    public struct MyStruct has store{
        num:u8,
    }



    public struct MyStructHold has key {
        id:UID,
        my_struct: MyStruct
    }





    public struct HolderStore has key {
        id:UID,
        st:Store
    }


    fun init(ctx:&mut TxContext){
        let st = Store{
            num:10,
        };

        let holder =  HolderStore{
            id:object::new(ctx),
            st,
        };

        transfer(holder,sender(ctx));
    }

}
