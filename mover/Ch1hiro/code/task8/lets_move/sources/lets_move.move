module lets_move::lets_move {
    use std::ascii::{String, string};
    use std::hash;
    use sui::event;
    use sui::bcs;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::share_object;
    use std::debug;

    const EPROOF: u64 = 0;

    public struct Flag has copy, drop {
        sender: address,
        flag: bool,
        ture_num: u64,
        github_id: String
    }

    public struct Challenge has key {
        id: UID,
        str: String,
        difficulity: u64,
        ture_num: u64
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
        ctx: &mut TxContext
    ) {
        let mut full_proof: vector<u8> = vector::empty<u8>();
        vector::append<u8>(&mut full_proof, proof);
        vector::append<u8>(&mut full_proof, tx_context::sender(ctx).to_bytes());
        vector::append<u8>(&mut full_proof, bcs::to_bytes(challenge));

        let hash: vector<u8> = hash::sha3_256(full_proof);

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
            github_id
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

    #[test]
    public fun test_get_flag() {
        // sender 序列化
        let sender_bcs = bcs::to_bytes(&@0x24ddd392f33ab29f2c4a557e0e9fe0943760a078c41487cf807c158ab20067f3);
        debug::print(&sender_bcs);

        // challenge 对象序列化
        let id_bcs = bcs::to_bytes(&@0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9);
        let str_bcs =bcs::to_bytes(&string(b"OYg*yBEIKk\"|V#rDp*FWin1C1"));
        let difficulity_bcs = bcs::to_bytes(&3);
        let ture_num_bcs = bcs::to_bytes(&126);
        let mut challenge = vector::empty<u8>();
        vector::append(&mut challenge, id_bcs);
        vector::append(&mut challenge, str_bcs);
        vector::append(&mut challenge, difficulity_bcs);
        vector::append(&mut challenge, ture_num_bcs);
        debug::print(&challenge);

        // 爆破 proof 
        // let mut byte_1: u8 = 0;
        // while(byte_1 <= 255) {
        //     let mut byte_2: u8 = 0;
        //     while(byte_2 <= 255) {
        //         let mut byte_3: u8 = 0;
        //         while(byte_3 <= 255) {
        //             // 创建空的 proof 向量
        //             let mut proof = vector::empty<u8>();
        //             vector::push_back(&mut proof, byte_1);
        //             vector::push_back(&mut proof, byte_2);
        //             vector::push_back(&mut proof, byte_3);

        //             // 向量拼接
        //             let mut full_proof: vector<u8> = vector::empty<u8>();
        //             vector::append(&mut full_proof, proof);
        //             vector::append(&mut full_proof, sender_bcs);
        //             vector::append(&mut full_proof, challenge);
                    
        //             // 计算 hash
        //             let hash: vector<u8> = hash::sha3_256(full_proof);

        //             // 计算前缀和是否为 0
        //             let mut prefix_sum: u32 = 0;
        //             let mut i: u64 = 0;
        //             while (i < 3) {
        //                 prefix_sum = prefix_sum + (*vector::borrow(&hash, i) as u32);
        //                 i = i + 1;
        //             };

        //             if (prefix_sum == 0) {
        //                 debug::print(&proof);
        //                 return
        //             };

        //             if(byte_3 != 255) {
        //                 byte_3 = byte_3 + 1;
        //             }else {
        //                 break
        //             }
        //         };

        //         if(byte_2 != 255) {
        //             byte_2 = byte_2 + 1;
        //         }else {
        //             break
        //         }
        //     };

        //     if(byte_1 != 255) {
        //         byte_1 = byte_1 + 1;
        //     }else {
        //         break
        //     }
            
        // }
    }
}

