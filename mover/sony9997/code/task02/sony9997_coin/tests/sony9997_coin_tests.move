
#[test_only]
module sony9997_coin::sony9997_coin_tests {
    // uncomment this line to import the module
    // use sony9997_coin::sony9997_coin;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_sony9997_coin() {
        // pass
    }

    #[test, expected_failure(abort_code = sony9997_coin::sony9997_coin_tests::ENotImplemented)]
    fun test_sony9997_coin_fail() {
        abort ENotImplemented
    }
}

