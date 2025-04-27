/*
*/
#[test_only]
module lets_move::lets_move_tests;
// uncomment this line to import the module
// use lets_move::lets_move;

use std::hash;
use std::debug;

#[test]
fun test_lets_move() {
    // pass
    let proof = b"[55, 37, 68, 173, 106, 196, 46, 222]";
    let sender = b"[217, 90, 199, 228, 109, 97, 10, 253, 103, 211, 134, 44, 163, 219, 126, 248, 175, 199, 199, 83, 199, 185, 99, 226, 163, 133, 191, 94, 45, 99, 134, 53]";
    // let challenge = bcs::to_bytes(&challenge);
    let challenge = b"[25,231,108,165,4,197,165,250,94,33,74,69,252,166,192,88,23,27,163,51,246,218,137,123,130,115,16,148,80,77,90,185,30,88,92,89,34,98,42,97,120,61,91,120,119,66,35,49,38,49,111,80,126,105,63,89,92,93,76,87,59,119,104,3,0,0,0,0,0,0,0,127,0,0,0,0,0,0,0]";
    let mut full_proof = vector::empty<u8>();
    vector::append<u8>(&mut full_proof, proof);
    vector::append<u8>(&mut full_proof, sender);
    vector::append<u8>(&mut full_proof, challenge);
    let hash: vector<u8> = hash::sha3_256(full_proof);
    debug::print(&hash);

}
/*
#[test, expected_failure(abort_code = ::lets_move::lets_move_tests::ENotImplemented)]
fun test_lets_move_fail() {
    abort ENotImplemented
}
*/