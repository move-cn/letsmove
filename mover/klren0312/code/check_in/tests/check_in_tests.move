
#[test_only]
module check_in::check_in_tests;
// uncomment this line to import the module
use check_in::check_in;
use std::debug::print;
#[test]
fun test_check_in() {
    let res2 = check_in::get_flag();
    print(&res2);
    // check_in::check_get_flag(
    //     res2, 
    //     string(b"klren0312"),
    //     string(b"0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147"),
    // );
}
