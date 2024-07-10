module var::var {

    use sui::tx_context::{TxContext};

    #[allow(unused_variable)]
    fun init(_: &mut TxContext) {


        let abc: u64 = 45;

        let abc1 = 45u64;


        let a  = 1;


        let s = b"hello";

        let s2 = s;

        let x = 0;
        let b:bool = false;


        let addr2 :address = @0x1;

        let addr2 :address = @var;
        let zhangsan = @zhangsan;
        let zhangsan2 =  @0xc91876f4fbbe05e672ccbd316b133d24c3b0e770d68659beb0f3796345ac633e;


         let zhangsan_1 = (zhangsan == zhangsan2);


        let addr = @0x42;


        let addr = @0x42;


        let x_ref = &x;

        let b2 = b;
        let addr2 = @0x42;
        let x_ref2 = x_ref;
    }

}
