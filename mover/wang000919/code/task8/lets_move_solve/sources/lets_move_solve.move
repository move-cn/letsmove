/*
/// Module: lets_move_solve
module lets_move_solve::lets_move_solve;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module lets_move_solve::lets_move_solve;

use lets_move::lets_move::Challenge;
use sui::bcs;

#[test_only]
use std::debug;

public fun challenge_to_bytes(challenge: &Challenge): vector<u8> {
    bcs::to_bytes(challenge)
}

#[test]
fun test() {
    let s = string::utf8(b"challenge");
    let a = bcs::to_bytes(&s);
    let user = @0x0319dd163d7b895fc5caa4712a2fe49a4f46d86ff16976a8b0cf5295e5e00489;
    debug::print(&user.to_bytes());
}
