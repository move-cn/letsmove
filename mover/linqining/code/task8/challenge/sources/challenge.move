
/// Module: challenge
module challenge::challenge;

use std::ascii::{String, string};
use std::hash;
use sui::event;
use sui::bcs;
use sui::random;
use sui::random::Random;
use sui::transfer::share_object;
use std::debug::print;
use sui::address;


public struct Challenge has drop {
    id:ID,
    str: String,
    difficulity: u64,
    ture_num: u64
}




#[test]
fun test_challenge_fail() {
    let challenge:Challenge = Challenge{
        id: object::id_from_address(@0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9),
        str:std::ascii::string(b"M9[fZ#glu@qF5J8zd:m)*V87>C*\\Y"),
        difficulity: 3,
        ture_num: 108,
    };
    // let cbyte = bcs::to_bytes(&challenge);
    // print(&cbyte.to_string());
    let mut prefix_sum: u32 = 1;
    let name = std::ascii::string(b"proof");
    let borrowname = std::ascii::string(b"getproof");
    let mut proof = b"1234567892";
    let mut strlen:u8 =30;
    let call_addr = @0xc1f4704452819f75c258fe3a01e54d6561899e3478f818625ee8be716fbdd007;
    print(&call_addr.to_bytes());
    while (prefix_sum!=0){
        strlen = strlen+1;
        let mut proof = b"SnyLUIXawx";
        let mut full_proof: vector<u8> = vector::empty<u8>();
        vector::append<u8>(&mut full_proof, proof);
        vector::append<u8>(&mut full_proof,  call_addr.to_bytes());
        vector::append<u8>(&mut full_proof, bcs::to_bytes(&challenge));

        let hash: vector<u8> = hash::sha3_256(full_proof);
        // print(&name);
        print(&proof);
        prefix_sum = 0;
        let mut i: u64 = 0;
        while (i < challenge.difficulity) {
            let borrorval = (*vector::borrow(&hash, i) as u32);

            prefix_sum = prefix_sum + borrorval;
            i = i + 1;
        };

        print(&prefix_sum);
        if (prefix_sum==0){
            print(&borrowname);
            print(&proof);
            break
        }
    };
    return

}

fun getRandomString(laststr:vector<u8>,strLen:u8): String {
    let mut gen = sui::random::new_generator_from_seed_for_testing(laststr);

    let mut str_len = strLen;

    let mut rand: vector<u8> = b"";
    while (str_len != 0) {
        let rand_num = random::generate_u8_in_range(&mut gen, 34, 126);
        vector::push_back(&mut rand, rand_num);
        str_len = str_len - 1;
    };

    string(rand)
}



