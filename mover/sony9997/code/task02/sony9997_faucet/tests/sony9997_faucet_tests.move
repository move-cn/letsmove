
#[test_only]
module sony9997_faucet::sony9997_faucet_tests {
    // uncomment this line to import the module
    // use sony9997_faucet::sony9997_faucet;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_sony9997_faucet() {
        // pass
    }

    #[test, expected_failure(abort_code = sony9997_faucet::sony9997_faucet_tests::ENotImplemented)]
    fun test_sony9997_faucet_fail() {
        abort ENotImplemented
    }
}

