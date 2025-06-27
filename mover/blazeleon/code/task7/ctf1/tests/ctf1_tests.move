
#[test_only]
module ctf1::ctf1_tests;
use ctf1::ctf1::get_flag;
use std::ascii::{ string };
use std::debug;

#[test]
fun test_ctf1() {
    let flag_str = string(b"ph*1jM(-_");
    let github_id = string(b"blazeleon");
    let result = get_flag(flag_str, github_id);
    debug::print(&result);
    //0x316c4927a8ab597897440e921991bcfd684131d7b456abbe9805410e2a3cada8
    //0xe2751d02b2c0134e72d436866682b62c68b27b61d4cda9bcbfa3fc671d3bb037
}

/*
#[test, expected_failure(abort_code = ::ctf1::ctf1_tests::ENotImplemented)]
fun test_ctf1_fail() {
    abort ENotImplemented
}
*/
