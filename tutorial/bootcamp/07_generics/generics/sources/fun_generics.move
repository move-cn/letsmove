module generics::generics {

    public struct Box<T> {
        value: T
    }



    public fun input<T: drop> (value: T)  {

    }



    public fun create_box<T> (value: T) : Box<T> {
        Box<T> { value }
    }


    fun init(ctx: &mut TxContext) {

        let box32 = create_box(32u32);

        let box16 = create_box<u16>( (32u32 as u16) );

    }

}

