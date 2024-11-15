/// Module: check_in_task
module check_in_task::check_in_task;
use std::ascii::{String,string};
use sui::transfer::share_object;
use std::bcs;
use sui::event;
use std::hash::sha3_256;

public struct CheckinString has key {
    id: UID,
    key: vector<u8>
}

public struct GetCheckinString has drop,copy{
    sender:address,
    checkin_string:vector<u8>,
    github_id:String
}

fun init(ctx:& mut TxContext){
    let checkin_string = CheckinString {
        id: object::new(ctx),
        key: vector::empty<u8>(),
    };
    share_object(checkin_string);
}

entry fun getCheckinString(github_id:String, check_string:&mut CheckinString, flagString:String, ctx:&TxContext){
    let mut bcs_flag = bcs::to_bytes(&flagString);
    vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());
    check_string.key =sha3_256(bcs_flag);
    event::emit(GetCheckinString {
            sender: ctx.sender(),
            checkin_string: check_string.key,
            github_id
    });
}