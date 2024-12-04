module test_demo::test_demo {

    #[test_only]
    use std::debug::print;

    public fun add(a:u32, b:u32):u32{
        a + b
    }

    fun init(ctx:&mut TxContext){
        /// afasdasda
        /// fasdas
    }


    #[test_only]
    public fun test_for_init(ctx:&mut TxContext){
        init(ctx);
        print(&b"hello test");
    }



    #[test]
    fun test_fun_add() {
        let c = add(1, 2);
        let d: u32 = 3;
        assert!(c == d,0x1);
    }
}

