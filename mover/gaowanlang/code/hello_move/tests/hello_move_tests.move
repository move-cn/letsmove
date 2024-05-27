#[test_only]
module hello_move::hello_move_tests {
    use hello_move::hello_move;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_hello_move() {
        let mut ctx = tx_context::dummy();
        hello_move::mint(&mut ctx);
    }

    #[test, expected_failure(abort_code = ENotImplemented)]
    fun test_hello_move_fail() {
        abort ENotImplemented
    }
}
