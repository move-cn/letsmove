#[test_only]
#[allow(unused_use, duplicate_alias)]
module blue_ntf::blue_ntf_tests {
    // uncomment this line to import the module
    use std::string;
    use sui::kiosk::list;
    use sui::object::id;
    use sui::tx_context;
    use blue_ntf::blue_ntf;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_blue_ntf() {
        let mut ctx = tx_context::dummy();
        blue_ntf::mint_ntf(&mut ctx);
        // pass
    }

    #[test, expected_failure(abort_code = ::blue_ntf::blue_ntf_tests::ENotImplemented)]
    fun test_blue_ntf_fail() {
        abort ENotImplemented
    }
}
