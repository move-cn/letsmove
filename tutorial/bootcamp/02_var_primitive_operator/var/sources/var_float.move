module var::var {

    use sui::tx_context::{TxContext};

    #[allow(unused_variable)]
    fun init(_: &mut TxContext) {

            let a : u32 = 100;
            let b : u32 = 1000;

           // let c = a / b;


            let c =  100_000_000u32;

            let d = c * a / b;






    }

}
