module ability::errors {

    const ErrMustGet10 :u64 = 0x1;
    const ErrMustLt11 :u64 = 0xa;


    fun init(ctx: &mut TxContext) {

        let num2 =  input(11);
        let num1 =  input(5);

    }

    public fun input(num:u32):u32{
        if(num > 10){
            num
        }else {
            abort 0
        }
    }

    public fun intput2(num:u32):u32{
        assert!(num > 10, ErrMustGet10);


        if(num > 10){
           // xxxx
        }else{
            abort ErrMustGet10;
        };

        num
    }

    public fun intput3(num:u32):u32{
        assert!(num < 11, ErrMustLt11);

        num
    }
}
