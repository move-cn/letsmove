/*
#[test_only]
module check_in_tests::check_in_tests_tests;
// uncomment this line to import the module
// use check_in_tests::check_in_tests;

const ENotImplemented: u64 = 0;

#[test]
fun test_check_in_tests() {
    // pass
}

#[test, expected_failure(abort_code = ::check_in_tests::check_in_tests_tests::ENotImplemented)]
fun test_check_in_tests_fail() {
    abort ENotImplemented
}
*/
#[test_only]
module check_in_tests::check_in_tests {
    use std::debug;
    use std::vector;
    use std::bcs;
    use std::hash::sha3_256;
    use std::ascii::{String, string};
    // uncomment this line to import the module
    // use check_in::check_in;

    const ENotImplemented: u64 = 0;
    const ESTRING: u64 = 0;

    #[test]
    fun test_check_in() {
        // pass
        let flag_str= string(b"'3|3W`RoCJl\"p]_\\m");
        let github_id = string(b"chinazmc");

        let mut bcs_flag = bcs::to_bytes(&flag_str);
        vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());

        debug::print(&sha3_256(bcs_flag));
        //assert!(flag == sha3_256(bcs_flag), ESTRING);
    }
}