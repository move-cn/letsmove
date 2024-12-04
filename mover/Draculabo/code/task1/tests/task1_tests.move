#[test_only]
module task1::task1_tests {
    // uncomment this line to import the module
    use task1::task1;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_task1() {
      let mut ctx = tx_context::say_hello();
    }

    #[test, expected_failure(abort_code = ::task1::task1_tests::ENotImplemented)]
    fun test_task1_fail() {
        abort ENotImplemented
    }
}
