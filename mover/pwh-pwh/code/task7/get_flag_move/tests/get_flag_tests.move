#[test_only]
module get_flag::get_flag_tests;
// uncomment this line to import the module
// use get_flag::get_flag;
use std::ascii::{string};
use std::bcs;
use std::hash::sha3_256;
use std::vector;
use std::debug;

const ENotImplemented: u64 = 0;

#[test]
fun test_get_flag() {
    let f_str = string(b"bEY.g]|H;]N");
    let github_id = string(b"pwh-pwh");
    let mut bcs_flag = bcs::to_bytes(&f_str);
    vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());
    debug::print(&sha3_256(bcs_flag));
    // assert!(flag == sha3_256(bcs_flag), ESTRING);
}

#[test, expected_failure(abort_code = ::get_flag::get_flag_tests::ENotImplemented)]
fun test_get_flag_fail() {
    abort ENotImplemented
}
// 运行命令
//sui client call --package 0x914099b4d1b4f5513acc8aaa4fdc1f67578522b81d818f61bae527d590c6d87d --module check_in --function get_flag --args 0xd2c9e1c8bcc505d5908a648d0e0dab15fff6069ef1a6081275f105936e415e2e "pwh-pwh" 0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147 0x8
