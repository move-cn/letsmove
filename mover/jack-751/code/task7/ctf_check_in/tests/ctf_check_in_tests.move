#[allow(unused_let_mut)]
module ctf_check_in::ctf_check_in_test ;

#[test]
fun print_flag_for_check_in() {
    use std::ascii::{String, string};
    use std::bcs;
    use std::hash::sha3_256;
    use std::vector;
    use std::debug;

    let str_val = string(b"*b{xvqXf2c6AH}=&BWI/At}#YNz");
    let github_id = string(b"jack-751");
    let mut bcs_flag = bcs::to_bytes(&str_val);
    vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());
    let flag = sha3_256(bcs_flag);
    debug::print(&flag);
}

