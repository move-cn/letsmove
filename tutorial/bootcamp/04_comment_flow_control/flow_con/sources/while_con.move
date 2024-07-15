module flow_con::while_con {

    use std::debug::print;
    use sui::tx_context::TxContext;

    fun init(_ctx: &mut TxContext) {
       let b =  sum(10);
        print(&b);

    }

    fun sum(n: u64): u64 {
        let mut sum = 0;
        let mut i = 1;

        while (i <= n) {
            sum = sum + i;
            i = i + 1
        };

        sum
    }

}
