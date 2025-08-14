module task8::lets_move {
    use std::ascii::{String, string};
    use std::hash;
    use sui::event;
    use sui::bcs;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::share_object;

    const EPROOF: u64 = 0;

    public struct Flag has copy, drop {
        sender: address,
        flag: bool,
        ture_num: u64,
        github_id: String
    }

    public struct EmitE has copy, drop{
        a:vector<u8>
    }

    public struct EmitE2 has copy, drop{
        a:Challenge
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
            str: string(b"kV\":O5o%Y1+~&\\{hS//B3Jf"),
            difficulity: 3,
            ture_num: 0,
        };
        share_object(flag_str);
    }

    public fun test(
        challenge:&mut Challenge,
        rand:&Random,
        ctx:&mut TxContext
    ){
        let mut seed = 10;

        loop{
            let mut proof = generate_random_vector(seed);
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

            if (prefix_sum==0){
                event::emit(EmitE{
                    a:proof
                });


                break
            };
            seed = seed+1;
        }


    }

    public fun generate_random_vector(seed: u64): vector<u8> {
        let mut random_vector = vector::empty<u8>();
        let mut current_value = seed;
        let length = 10;

        // 模拟生成随机数
        let mut i = 0;

        while (i < length) {
            // 简单的随机数生成逻辑：将当前值模256
            let random_value = (current_value % 256) as u8;
            // 将生成的随机值加入向量
            vector::push_back(&mut random_vector, random_value);
            // 更新当前值，只需加一个常数，这里是简单加2
            current_value = current_value + 2;
            // 自增索引
            i = i + 1;
        };

        event::emit(EmitE{
            a:random_vector
        });

        random_vector

    }

    entry fun get_flag1(
        // proof: vector<u8>,
        github_id: String,
        challenge: &mut Challenge,
        rand: &Random,
        ctx: &mut TxContext
    ) {
        let mut full_proof: vector<u8> = vector::empty<u8>();
        // vector::append<u8>(&mut full_proof, proof);
        vector::append<u8>(&mut full_proof, tx_context::sender(ctx).to_bytes());
        vector::append<u8>(&mut full_proof, bcs::to_bytes(challenge));
        // vector::append<u8>(&mut full_proof, bcs::to_bytes(&challenge.str));
        // vector::append<u8>(&mut full_proof, bcs::to_bytes(&challenge.difficulity));
        // vector::append<u8>(&mut full_proof, bcs::to_bytes(&challenge.ture_num));
        // let struct_byt = bcs::to_bytes(challenge);

        let hash: vector<u8> = hash::sha3_256(full_proof);

        event::emit(EmitE2{
            a:challenge
        });

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
        // let struct_byt = bcs::to_bytes(challenge);

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
}