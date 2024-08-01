#[test_only]
#[allow(unused_use)]
module trans::trans_tests {
    // uncomment this line to import the module
    use sui::test_scenario as ts;
    use trans::trans::{Self, MIN_FEE, Object};
    use std::debug;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_trans() {
        // pass
    }

    #[test, expected_failure(abort_code = ::trans::trans_tests::ENotImplemented)]
    fun test_trans_fail() {
        abort ENotImplemented
    }
}
