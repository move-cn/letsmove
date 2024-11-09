/*
#[test_only]
module hellomove::hellomove_tests;
// uncomment this line to import the module
// use hellomove::hellomove;

const ENotImplemented: u64 = 0;

#[test]
fun test_hellomove() {
    // pass
}

#[test, expected_failure(abort_code = ::hellomove::hellomove_tests::ENotImplemented)]
fun test_hellomove_fail() {
    abort ENotImplemented
}
*/

#[test_only]
module HelloMove::hellomove_tests;

use HelloMove::hellomove;

#[test]
fun test_hello_move() {
    assert!(hellomove::hello_move() == b"Hello, narnona!".to_string(), 0);
}
