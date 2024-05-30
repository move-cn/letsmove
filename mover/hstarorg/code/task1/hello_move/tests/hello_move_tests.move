/*
#[test_only]
module hello_move::hello_move_tests {
    // uncomment this line to import the module
    // use hello_move::hello_move;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_hello_move() {
        // pass
    }

    #[test, expected_failure(abort_code = ::hello_move::hello_move_tests::ENotImplemented)]
    fun test_hello_move_fail() {
        abort ENotImplemented
    }
}
*/

#[test_only]
module hello_move::hello_move_tests {
    // uncomment this line to import the module
    use hello_move;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_hello_move() {
        assert!(hello_move.hello() == b"Hello, hstarorg.", 1);
    }

    #[test, expected_failure(abort_code = ::hello_move::hello_move_tests::ENotImplemented)]
    fun test_hello_move_fail() {
        abort ENotImplemented
    }
}