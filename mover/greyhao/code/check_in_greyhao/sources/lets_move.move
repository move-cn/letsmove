/// Module: check_in_greyhao
/// for task8
module check_in_greyhao::lets_move;

use std::ascii::{String, string};
use std::debug::print;
use std::hash::sha3_256;
use sui::bcs;
use sui::event;
use sui::object::{id_from_address, id_to_bytes};
use sui::random::{Self, Random};
use sui::transfer::share_object;

const EPROOF: u64 = 0;

public struct Flag has copy, drop {
    sender: address,
    flag: bool,
    ture_num: u64,
    github_id: String,
}

public struct Challenge has key {
    id: UID,
    str: String,
    difficulity: u64,
    ture_num: u64,
}

public struct GetObjectsBytesEvent has copy, drop {
    challenge_bytes: vector<u8>,
    address_bytes: vector<u8>,
}

fun init(ctx: &mut TxContext) {
    let flag_str = Challenge {
        id: object::new(ctx),
        str: string(b"LetsMoveCTF"),
        difficulity: 3,
        ture_num: 0,
    };
    share_object(flag_str);
}

entry fun get_flag(
    proof: vector<u8>,
    github_id: String,
    challenge: &mut Challenge,
    rand: &Random,
    ctx: &mut TxContext,
) {
    let mut full_proof: vector<u8> = vector::empty<u8>();
    vector::append<u8>(&mut full_proof, proof);
    vector::append<u8>(&mut full_proof, tx_context::sender(ctx).to_bytes());
    vector::append<u8>(&mut full_proof, bcs::to_bytes(challenge));

    let hash: vector<u8> = sha3_256(full_proof);

    let mut prefix_sum: u32 = 0;
    let mut i: u64 = 0;
    while (i < challenge.difficulity) {
        prefix_sum = prefix_sum + (*vector::borrow(&hash, i) as u32);
        i = i + 1;
    };

    assert!(prefix_sum == 0, EPROOF);

    challenge.str = getRandomString(rand, ctx);
    challenge.ture_num = challenge.ture_num + 1;

    event::emit(Flag {
        sender: tx_context::sender(ctx),
        flag: true,
        ture_num: challenge.ture_num,
        github_id,
    });
}

fun getRandomString(rand: &Random, ctx: &mut TxContext): String {
    let mut gen = random::new_generator(rand, ctx);

    let mut str_len = random::generate_u8_in_range(&mut gen, 4, 30);

    let mut rand: vector<u8> = b"";
    while (str_len != 0) {
        let rand_num = random::generate_u8_in_range(&mut gen, 34, 126);
        vector::push_back(&mut rand, rand_num);
        str_len = str_len - 1;
    };

    string(rand)
}

public entry fun get_objcts_bytes<T: key>(challenge: &T, tx: &mut TxContext) {
    let sender = tx.sender();

    event::emit(GetObjectsBytesEvent {
        challenge_bytes: bcs::to_bytes(challenge),
        address_bytes: sender.to_bytes(),
    });
}

#[test]
fun test_get_flag_t8() {
    // let user = @0x8b191c25d4dbaa3b49d77f9d8181ec57f616712192c264ec0d8f32779344dfa8;
    let user = @0x0c651eb9cd6ffa4928b5a9481f09591834a68f452cfbb8932cd6ac3643a61eb2;
    let user_vector = id_to_bytes(&id_from_address(user));
    let challenge = @0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9;
    let challenge_vector = id_to_bytes(&id_from_address(challenge));

    let mut g = random::new_generator_for_testing();

    let mut count = 0;
    let mut success = false;
    while (!success) {
        // let proof = random::generate_bytes(&mut g, 8);
        let proof = string([202, 187, 196, 0, 0, 0, 0, 0]);
        let mut full_proof: vector<u8> = vector::empty<u8>();
        vector::append<u8>(&mut full_proof, proof);
        vector::append<u8>(&mut full_proof, user.to_bytes());
        vector::append<u8>(&mut full_proof, id_to_bytes(&id_from_address(challenge)));
        let hash: vector<u8> = sha3_256(full_proof);
        let mut prefix_sum: u32 = 0;
        let mut i: u64 = 0;
        while (i < 3) {
            prefix_sum = prefix_sum + (*vector::borrow(&hash, i) as u32);
            i = i + 1;
        };
        // print(&b"prefix_sum");
        // print(&prefix_sum);
        print(&proof);
        if (prefix_sum == 0) {
            print(&b"success !!!! ====== proof is: ");
            print(&proof);
            success = true;
        };
        count = count + 1;
        print(&count);
    };
    // test_scenario::end(scenario_val);
}
