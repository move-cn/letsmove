/*
/// Module: task8
module task8::task8;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module task8::task8 { 
    use std::hash;
    use sui::event;
    use sui::bcs;

    public struct LogObj has copy, drop {
        val: u32,
        vec1: vector<u8>,
        vec2: vector<u8>,
        vec3: vector<u8>,
    }

    public entry fun getString<T: key>( challenge: &T, proof: vector<u8>,ctx: &mut TxContext) {
        let mut full_proof: vector<u8> = vector::empty<u8>();
        vector::append<u8>(&mut full_proof, proof);
        vector::append<u8>(&mut full_proof, tx_context::sender(ctx).to_bytes());
        vector::append<u8>(&mut full_proof, bcs::to_bytes(challenge));

        let hash: vector<u8> = hash::sha3_256(full_proof);

        let mut prefix_sum: u32 = 0;
        let mut i: u64 = 0;
        while (i < 3) {
            prefix_sum = prefix_sum + (*vector::borrow(&hash, i) as u32);
            i = i + 1;
        };

        event::emit(LogObj { val: prefix_sum, vec1: tx_context::sender(ctx).to_bytes(), vec2: bcs::to_bytes(challenge),vec3: hash });
    }
}
