module task08::task08 {

    use std::ascii::String;

    #[test_only]
    use sui::object;

    public struct Challenge has key {
        id: UID,
        str: String,
        difficulity: u64,
        ture_num: u64
    }

    #[test]
    public fun get_flag() {
        let challenge: Challenge = Challenge {
            id: object::new_uid_from_hash(b"0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9"),
            str: string(b"uMKz'lr#*kw][z/CAvOZ"),
            difficulity: 3,
            ture_num: 3,
        };

        let mut proof: vector<u8> = vector[33];
        vector::append<u8>(&mut proof, vector[163]);
        vector::append<u8>(&mut proof, vector[129]);

        let mut full_proof: vector<u8> = vector::empty<u8>();
        vector::append<u8>(&mut full_proof, proof);
        vector::append<u8>(
            &mut full_proof,
            b"0x03f0463af4185ecd1f221af4e30fbd68ce81bd438a3583e85db7320301b712b6".to_bytes()
        );
        vector::append<u8>(&mut full_proof, bcs::to_bytes(&challenge));

        let hash: vector<u8> = std::hash::sha3_256(full_proof);
        std::debug::print(&hash);

        let mut prefix_sum: u32 = 0;
        let mut i: u64 = 0;
        while (i < challenge.difficulity) {
            prefix_sum = prefix_sum + (*vector::borrow(&hash, i) as u32);
            i = i + 1;
        };

        assert!(prefix_sum == 0, 100);
    }
}
