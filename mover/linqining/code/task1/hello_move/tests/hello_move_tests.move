
#[test_only]
module hellomove::hellomove_tests;
// uncomment this line to import the module
// use hellomove::hello;

const ENotImplemented: u64 = 0;

#[test]
fun test_hellomove() {
    let mut ctx  = sui::tx_context::dummy();
    hellomove::hello::initHello(&mut ctx)
}

#[test, expected_failure(abort_code = hellomove::hellomove_tests::ENotImplemented)]
fun test_hellomove_fail() {
    abort ENotImplemented
}

