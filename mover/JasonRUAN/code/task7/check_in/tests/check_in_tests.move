#[test_only]
module check_in::check_in_tests;
    use std::bcs;
    use std::hash::sha3_256;
    use std::debug;

    #[test]
    fun test_check_in() {
        let flag_str = b"RlV;|HE37t-.JQ\"o";
        let github_id = b"JasonRUAN";

        let mut bcs_flag = bcs::to_bytes(&flag_str);
        vector::append<u8>(&mut bcs_flag, github_id);

        debug::print(&sha3_256(bcs_flag));
    }
}