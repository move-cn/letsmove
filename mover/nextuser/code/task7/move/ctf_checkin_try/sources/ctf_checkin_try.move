module ctf_checkin_try::ctf_checkin_try;
use std::bcs;
use std::hash::sha3_256;
use std::ascii::{String};
use sui::event::emit;
public struct FlagEvent has copy,drop{
    flag_result :  vector<u32>,
}

fun convert(v : vector<u8> ) : vector<u32>{

    let mut  i = 0; 
    let len = v.length();
    let mut ret = vector<u32>[];
    while(i < len){
        ret.push_back(v[i] as u32);
        i = i + 1;
    };
    ret 
}
entry fun my_flag(str: String,
                  github_id: String,
                  _:&TxContext) 
{
    
    let mut bcs_flag = bcs::to_bytes(&str);
    vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());
    let bytes = sha3_256(bcs_flag);
    std::debug::print(&bytes);
    let num : u256 = 0xa70ecb7613e1ebc4c7f0e44b4e4b873336f8c6cbe11de6efea035825e1a50b2b;
    std::debug::print(&sui::bcs::to_bytes(&num));
    //
    emit(FlagEvent{
        flag_result : convert(bytes)
    });
}


#[test]
fun test_my_falg()
{
    let ctx = tx_context::dummy();
    let flag_str = std::ascii::string(b"LetsMoveCTF");
    let git_id = std::ascii::string(b"nextuser");
    my_flag(flag_str,git_id,&ctx);
   
}