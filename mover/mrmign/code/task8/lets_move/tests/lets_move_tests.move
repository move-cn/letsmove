/*
#[test_only]
module lets_move::lets_move_tests {
    // uncomment this line to import the module
    // use lets_move::lets_move;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_lets_move() {
        // pass
    }

    #[test, expected_failure(abort_code = ::lets_move::lets_move_tests::ENotImplemented)]
    fun test_lets_move_fail() {
        abort ENotImplemented
    }
}
*/

#[test_only]
module lets_move::lets_move_tests;

use std::debug;
use std::hash;
use sui::random;

#[test]
fun test_lets_move() {
    let challenge: vector<u8> = vector[
        25,
        231,
        108,
        165,
        4,
        197,
        165,
        250,
        94,
        33,
        74,
        69,
        252,
        166,
        192,
        88,
        23,
        27,
        163,
        51,
        246,
        218,
        137,
        123,
        130,
        115,
        16,
        148,
        80,
        77,
        90,
        185,
        9,
        65,
        44,
        41,
        50,
        52,
        74,
        42,
        60,
        52,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        114,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
    ];
    let addr_bytes = @0xbecf7738a5b792939a8777eb32e5ed7b2fbf4c9c82d88037ec4c2e3e3bd1d4b5.to_bytes();
    debug::print(&addr_bytes);
    loop {
        let mut full_proof: vector<u8> = vector::empty<u8>();
        let random_bytes = generate_random_bytes(8);
        let s = &random_bytes.to_string();
        debug::print(s);
        vector::append<u8>(&mut full_proof, random_bytes);
        vector::append<u8>(&mut full_proof, addr_bytes);
        vector::append<u8>(&mut full_proof, challenge);

        let hash: vector<u8> = hash::sha3_256(full_proof);

        let mut prefix_sum: u32 = 0;
        let mut i: u64 = 0;
        while (i < 3) {
            prefix_sum = prefix_sum + (*vector::borrow(&hash, i) as u32);
            i = i + 1;
        };
        if (prefix_sum == 0) {
            debug::print(&random_bytes);
            break
        };
    };
}

public fun generate_random_bytes(n: u32): vector<u8> {
    let mut g = random::new_generator_for_testing();
    let mut result = vector::empty<u8>();
    // Generate n random bytes
    let mut i = 0;
    while (i < n) {
        let random_byte = random::generate_u8(&mut g);
        vector::push_back(&mut result, random_byte);
        i = i + 1;
    };

    result
}


// sui client call --package 0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f \
// --module lets_move \
// --function get_flag \
// --args '[119, 24, 89, 4]' mrmign 0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9 0x8