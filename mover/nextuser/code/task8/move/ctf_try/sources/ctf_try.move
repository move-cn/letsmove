module ctf_try::ctf_try;
use std::vector;

use std::ascii::{String, string};
use std::hash;
use sui::event;
use sui::bcs;
use sui::random;
use sui::random::Random;
use sui::transfer::share_object;
use ctf::lets_move::{Challenge};

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

fun is_pass(hash : &vector<u8>, difficulity : u64) : bool{
    let mut i :u64 = 0;
    let count = difficulity * 2;
    while(i < count ){
        if(hash[i] != 0){
            return false
        };
        i = i + 1;
    };
    true
}

fun generate_vector(byte_count : u8,   value : u64) : vector<u8>{
    let mut arr : vector<u8> = vector[];
    let mut index =0;
    let mut val = value;
    while(index < byte_count){
        arr.push_back( (val & 0xff) as u8);
        val = val >> 8;
        index = index + 1;
    };
    vector::reverse(&mut arr);
    arr
}

entry fun find_proof(    
    github_id: String,
    difficulity : u64,
    challenge: &mut Challenge,
    ctx: &mut TxContext
) 
    {
    let mut proof: vector<u8> = vector[];
    let mut tail : vector<u8> = vector::empty<u8>();
    vector::append<u8>(&mut tail,ctx.sender().to_bytes() );
    vector::append<u8>(&mut tail, bcs::to_bytes(challenge));
   
    let mut byte_count :u8 = 1;
    let mut end : u64 = 256;
    while(byte_count < 128){
        let mut value = 0;
        
        while(value < end)
        {
            proof = generate_vector(byte_count,value);
            let mut merge = proof;
            merge.append(tail);
            let hash: vector<u8> = hash::sha3_256(merge);
            if(is_pass(&hash,difficulity))
            {
                event::emit(FlagEvent{flag_result : convert(proof)});
                return
            };
            value = value + 1;
        };
        byte_count = byte_count +  1;
        end = end * 256;
    };
 
}

#[test]
fun test_generate_vector(){
    let vec = generate_vector(4,0x33445566);
    assert!(vec.length() == 4);
    assert!(vec[0] == 0x33);
    assert!(vec[1] == 0x44);
    assert!(vec[2] == 0x55);
    assert!(vec[3] == 0x66);
} 

fun test_is_pass(){
    let vec = generate_vector(4,0x00005566);
    assert!(is_pass(&vec,2));
    assert!(is_pass(&vec,3) == false);
}

