#[test_only]
module my_nft::my_nft_tests {
    const ENotImplemented: u64 = 0;

    #[test, expected_failure(abort_code = ENotImplemented)]
    fun test_my_nft_fail() {
        abort ENotImplemented
    }

}

