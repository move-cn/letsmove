/*
#[test_only]
module task7::task7_tests;
// uncomment this line to import the module
// use task7::task7;

const ENotImplemented: u64 = 0;

#[test]
fun test_task7() {
    // pass
}

#[test, expected_failure(abort_code = ::task7::task7_tests::ENotImplemented)]
fun test_task7_fail() {
    abort ENotImplemented
}
*/
#[test_only]
module task7::task7_tests {
    use std::debug;
    use std::bcs;
    use std::hash::sha3_256;
    use std::ascii::{string};

    // const ESTRING: u64 = 0;

    #[test]
    fun test_check_in() {
        let flag_str= string(b"[[n|Z");
        let github_id = string(b"ydamw22");

        let mut bcs_flag = bcs::to_bytes(&flag_str);
        vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());

        debug::print(&sha3_256(bcs_flag));
        // assert!(flag == sha3_256(bcs_flag), ESTRING);
    }
}
