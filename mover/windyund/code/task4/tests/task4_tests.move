#[test_only]
module task4::task4_tests {
    use std::debug;
    use std::hash::sha3_256;
    const ENotImplemented: u64 = 0;

    #[test]
    fun test_task4() {
        // pass
        let hash_val=  sha3_256(b"windyund").pop_back();
        debug::print(&hash_val);
    }

    #[test, expected_failure(abort_code = task4::task4_tests::ENotImplemented)]
    fun test_task4_fail() {
        abort ENotImplemented
    }
}
