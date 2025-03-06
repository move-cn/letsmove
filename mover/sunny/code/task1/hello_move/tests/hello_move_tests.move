
#[test_only]
module hello_move::hello_move_tests;
// uncomment this line to import the module
use hello_move::hello_move;

const ENotImplemented: u64 = 0;

#[test]
fun test_hello_move() {
    assert!(hello_move::hello_world() == b"hello world".to_string(), 0);
}

#[test, expected_failure(abort_code = ::hello_move::hello_move_tests::ENotImplemented)]
fun test_hello_move_fail() {
    abort ENotImplemented
}

