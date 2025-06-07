
module ctf1::ctf1;

use std::ascii::{ String };
use std::bcs;
// use std::vector;
use std::hash::sha3_256;
// use std::debug;

public fun get_flag(flag_str: String, github_id: String) : vector<u8> {
    let mut flag = bcs::to_bytes(&flag_str);

    // let mut new_vector = vector::empty<u8>();
    // vector::append<u8>(&mut new_vector, *flag_str.as_bytes());
    // vector::append<u8>(&mut new_vector, *github_id.as_bytes());
    // sha3_256(new_vector)
    vector::append<u8>(&mut flag, *github_id.as_bytes());
    sha3_256(flag)
}

