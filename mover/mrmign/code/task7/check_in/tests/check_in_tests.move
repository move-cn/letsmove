/*
#[test_only]
module check_in::check_in_tests {
    // uncomment this line to import the module
    // use check_in::check_in;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_check_in() {
        // pass
    }

    #[test, expected_failure(abort_code = ::check_in::check_in_tests::ENotImplemented)]
    fun test_check_in_fail() {
        abort ENotImplemented
    }
}
*/

#[test_only]
module check_in::check_in_tests;

use check_in::check_in::get_flag;
use std::ascii::{String, string};
use std::bcs;
use std::debug;
use std::hash::sha3_256;

#[test]
fun test_check_in() {
    let flag_str = string(b"9PT]l]");
    let github_id = string(b"mrmign");
    let mut bsc_flag = bcs::to_bytes(&flag_str);
    vector::append<u8>(&mut bsc_flag, *github_id.as_bytes());
    let s = string(bsc_flag);
    debug::print(&s);
    let flag = sha3_256(bsc_flag);
    debug::print(&flag);
}
