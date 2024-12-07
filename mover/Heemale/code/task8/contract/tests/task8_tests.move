#[test_only]
module task8::task8_tests {
    use sui::test_scenario::{Self, ctx};
    use std::debug;
    use std::bcs::{Self};
    use std::hash::{Self};
    use task8::task8::{Self, Challenge};

    const ADMIN: address = @ADMIN;

    #[test]
    fun process_for_testing() {
        let mut scenario = test_scenario::begin(ADMIN);

        task8::init_for_testing(ctx(&mut scenario));
        test_scenario::next_tx(&mut scenario, ADMIN);

        let challenge = test_scenario::take_shared<Challenge>(&scenario);

        let mut proof = b"31591919";

        let proof_data = bcs::to_bytes(&proof);
        let admin_data = ADMIN.to_bytes();
        let challenge_data = bcs::to_bytes(&challenge);
        debug::print(&proof_data);
        debug::print(&admin_data);
        debug::print(&challenge_data);

        let mut full_proof: vector<u8> = vector::empty<u8>();
        vector::append<u8>(&mut full_proof, proof_data);
        vector::append<u8>(&mut full_proof, ADMIN.to_bytes());
        vector::append<u8>(&mut full_proof, challenge_data);
        debug::print(&full_proof);

        let hash: vector<u8> = hash::sha3_256(full_proof);
        debug::print(&hash);

        let mut prefix_sum: u32 = 0;
        let mut i: u64 = 0;
        while (i < 3) {
            // 需要前三位是0
            prefix_sum = prefix_sum + (*vector::borrow(&hash, i) as u32);
            debug::print(&prefix_sum);
            i = i + 1;
        };

        if (prefix_sum == 0) {
            debug::print(&1);
        } else {
            debug::print(&0);
        };

        test_scenario::return_shared(challenge);
        test_scenario::end(scenario);
    }
}
