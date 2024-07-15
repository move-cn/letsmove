module flow_con::break_con {

    use std::debug::print;
    use sui::tx_context::TxContext;

    fun init(_ctx: &mut TxContext) {
        let b = min_factor(10);
        print(&b);
    }

    fun min_factor(n: u64): u64 {
        let mut i = 2;

        while (i <= n) {
            if (n % i == 0) break ;
            i = i + 1
        };

        i
    }
}
