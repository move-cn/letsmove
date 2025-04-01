#[test_only]
module check_in::check_in_tests {
    use std::debug;
    use std::bcs;
    use std::hash::sha3_256;
    use std::ascii::{string};


    #[test]
    fun test_check_in() {
        let flag_str = string(b"&ba5X2-I2:C`)HX,");
        let github_id = string(b"coachafei");

        let mut bcs_flag = bcs::to_bytes(&flag_str);
        vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());

        debug::print(&sha3_256(bcs_flag));
    }
}