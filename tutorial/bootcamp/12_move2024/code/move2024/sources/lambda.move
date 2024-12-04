module move2024::lambda {
    use std::debug::print;


    macro fun op( $f: |u64, u64| -> u64,
                 $x: u64, $y: u64): u64 {
        $f($x, $y)
    }


    #[test]
    fun test_op() {
        let z = op!(|x, y| x + y, 10u64, 20u64);


        print(&z);


        let zz = op!(|x, y| x - y, 30u64, 20u64);
        print(&zz);
    }
}
