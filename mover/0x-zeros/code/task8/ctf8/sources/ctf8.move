module ctf8::lets_move {
    use std::ascii::{String, string};
    use std::hash;
    use sui::event;
    use sui::bcs;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::share_object;

    #[test_only]
    use std::debug::print;

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


    #[test_only]
    fun check_proof(proof: vector<u8>): bool {

        //https://move.sui-book.com/programmability/bcs.html
        // public struct Challenge has key {
        //     id: UID,
        //     str: String,
        //     difficulity: u64,
        //     ture_num: u64
        // }

        //copy from https://testnet.suivision.xyz/object/0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9
        //calc bsc  (c=Challenge)
        let challenge_id = @0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9;
        let challenge_str = b"\\+E\"YK|\"T9]Oc\"OkyDFbJ6(8$WD}";
        let challenge_difficulity = 3u64;
        let challenge_ture_num = 133u64;
        
        let mut challenge_bytes = vector[];
        vector::append<u8>(&mut challenge_bytes, bcs::to_bytes(&challenge_id));
        vector::append<u8>(&mut challenge_bytes, bcs::to_bytes(&challenge_str));
        vector::append<u8>(&mut challenge_bytes, bcs::to_bytes(&challenge_difficulity));
        vector::append<u8>(&mut challenge_bytes, bcs::to_bytes(&challenge_ture_num));

        let send_address = @0x6e6c6885e780bbfd7c81b6b3849b45881305e3ecd08340a32fef3b5f3a619be7;

        let mut full_proof: vector<u8> = vector::empty<u8>();
        vector::append<u8>(&mut full_proof, proof);
        vector::append<u8>(&mut full_proof, send_address.to_bytes());
        vector::append<u8>(&mut full_proof, challenge_bytes);

        let hash: vector<u8> = hash::sha3_256(full_proof);

        let mut prefix_sum: u32 = 0;
        let mut i: u64 = 0;
        while (i < challenge_difficulity) {
            prefix_sum = prefix_sum + (*vector::borrow(&hash, i) as u32);
            i = i + 1;
        };

        if (prefix_sum == 0) {//ok
            true
        } else {
            false
        }
    }

    #[test]
    fun mine_proof() {
        print(&b"mine_proof, start".to_string());

        let max_attempts = 1_000; //Test timed out, 估计move里的test不能作此用途，换用ts sdk写

        let mut nonce: u64 = 0;
        let mut proof: vector<u8> = vector::empty<u8>();
        
        while (nonce < max_attempts) {
            // 清空之前的证明
            proof = vector::empty<u8>();
            
            // 将当前nonce转换为bytes并添加到证明中
            let mut temp_nonce = nonce;
            let mut i = 0;
            while (i < 8) {  // u64是8字节
                vector::push_back(&mut proof, ((temp_nonce & 0xFF) as u8));
                temp_nonce = temp_nonce >> 8;
                i = i + 1;
            };

            //
            if (check_proof(proof)) {
                print(&b"proof: ".to_string());
                print(&proof);
                return
            };
            
            nonce = nonce + 1;
        };
        
        print(&b"proof not found, max attempts reached".to_string());
    }
}