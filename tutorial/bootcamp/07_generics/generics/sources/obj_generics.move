module generics::obj_generics {
    use sui::object;
    use sui::object::UID;

    public struct Box32 {
        value: u32
    }
    public struct Box256 {
        value: u256
    }

    public struct Box64 {
        value: u64
     }
    public struct Box128 {
        value: u128
    }



    public struct Box<T> {
        value: T
    }


    public struct Box2<T,Z> {
        value: T,
        value2: Z,
        value_3: Z,
    }



    public struct Box3<T: store + drop> has key, store {
        id: UID,
        value: T
    }

    public struct MyStrtuct has store, drop {
        value: u32
    }




    public struct Box4<T: store + drop> has key, store {
        id: UID,
        value: T
    }



    fun init(ctx: &mut TxContext) {

        let boxu32_1 = Box32 {
            value:32u32
        };

        let boxu32_2 = Box<u32>{
            value:11u32,
        };



        // let box2_1 = Box2<u16,u32>{
        //     value: 10u16,
        //     value2: 10u32,
        //     value_3: 20u32,
        // };


        // let box4= Box4<MyStrtuct>{
        //     id:object::new(ctx),
        //     value:MyStrtuct{
        //         value:32u32
        //     }
        //
        // };


        //
        let Box32 {value:_} = boxu32_1;

        let Box {value:_} = boxu32_2;
    }


}

