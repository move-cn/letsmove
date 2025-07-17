module ctf_check_in::ctf_check_in;

use std::ascii::{String, string};
use std::bcs;
use std::hash::sha3_256;
use sui::event;
use sui::random::{Self, Random};
use sui::transfer::share_object;

// use sui::tx_context::{Self, TxContext};

const ESTRING: u64 = 0;

public struct Flag has copy, drop {
    sender: address,
    flag: bool,
    ture_num: u64,
    github_id: String,
}

public struct FlagString has key {
    id: UID,
    str: String,
    ture_num: u64,
}

fun init(ctx: &mut TxContext) {
    let flag_str = FlagString {
        id: object::new(ctx),
        str: string(b"LetsMoveCTF"),
        ture_num: 0,
    };
    share_object(flag_str);
}

entry fun get_flag(
    flag: vector<u8>,
    github_id: String,
    flag_str: &mut FlagString,
    rand: &u64,
    ctx: &mut TxContext,
) {
    let mut bcs_flag = bcs::to_bytes(&flag_str.str);
    vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());

    assert!(flag == sha3_256(bcs_flag), ESTRING);

    //flag_str.str = getRandomString(rand, ctx);

    flag_str.ture_num = flag_str.ture_num + 1;

    event::emit(Flag {
        sender: tx_context::sender(ctx),
        flag: true,
        ture_num: flag_str.ture_num,
        github_id,
    });
}



