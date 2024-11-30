#[test_only]
module task01::task01_tests {
    use std::debug;

    #[test]
    fun test_hello() {
        debug::print(&b"Hello");
        assert!(1 + 1 == 2, 0);
    }
}



