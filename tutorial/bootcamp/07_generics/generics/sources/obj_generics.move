module generics::obj_generics {
    use sui::object::UID;

    public struct Box32 {
        value: u32
    }
    public struct Box64 {
        value: u64
     }
    public struct Box128 {
        value: u128
    }


    public struct Box2<T> {
        value: T
    }

    public struct Box3<T: store + drop> has key, store {
        id:UID,
        value: T
    }



    fun init(ctx: &mut TxContext) {


    }


}

