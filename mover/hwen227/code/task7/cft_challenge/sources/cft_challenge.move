/// Module: cft_challenge
module cft_challenge::cft_challenge;

use std::ascii::{String};
use sui::transfer::share_object;
use std::bcs;
use sui::event;
use std::hash::sha3_256;

public struct FlagString has key {
    id: UID,
    key: vector<u8>
}

public struct GetFlagString has drop,copy{
    sender:address,
    flag_string:vector<u8>,
    github_id:String
}

fun init(ctx:& mut TxContext){
    let checkin_string = FlagString {
        id: object::new(ctx),
        key: vector::empty<u8>(),
    };
    share_object(checkin_string);
}

entry fun getFlagString(
    github_id:String,
    check_flag_str:&mut FlagString,
    flagString:String,
    ctx:&TxContext){
    
    let mut bcs_flag = bcs::to_bytes(&flagString);
    vector::append<u8>(
        &mut bcs_flag,
        *github_id.as_bytes()
    );
    check_flag_str.key =sha3_256(bcs_flag);
    event::emit(GetFlagString {
            sender: ctx.sender(),
            flag_string: check_flag_str.key,
            github_id
    });
}