module var::var {

    use sui::tx_context::{TxContext};

    #[allow(unused_variable)]
    fun init(_: &mut TxContext) {


        let abc: u64 = 45;
        let abc1 = 45u64;


        let s = b"hello";

        let s2 = s;

        let x = 0;
        let b:bool = false;
        let addr = @0x42;
        let x_ref = &x;

        let b2 = b;
        let addr2 = @0x42;
        let x_ref2 = x_ref;
    }

}
