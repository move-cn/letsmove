module ctf::lets_move {
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

    public struct FailEvent has copy ,drop{
        proof : vector<u8>,
        sender_bytes : vector<u8>,
        chall_bytes :vector<u8>,
        full_proof:vector<u8>,
        hash : vector<u8>,
        difficulity : u64,
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
        let sender_bytes = tx_context::sender(ctx).to_bytes();
        vector::append<u8>(&mut full_proof, sender_bytes);
        let chall_bytes =  bcs::to_bytes(challenge);
        vector::append<u8>(&mut full_proof,chall_bytes);

        let hash: vector<u8> = hash::sha3_256(full_proof);

        let mut prefix_sum: u32 = 0;
        let mut i: u64 = 0;
        while (i < challenge.difficulity) {
            prefix_sum = prefix_sum + (*vector::borrow(&hash, i) as u32);
            i = i + 1;
        };
        if(prefix_sum != 0){
            event::emit(FailEvent{
                proof,
                sender_bytes,
                chall_bytes,
                full_proof,
                hash,
                difficulity : challenge.difficulity
            });
            return 
        };
      

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
    fun test_sha3(){
        let c = b"hello";
        std::debug::print(&hash::sha3_256(c));
        let addr:address = @0xf7ec2215e565b7a18d7b00e70fccda74b30c3ecceffb5857b1b3d2249e28e94f;
        std::debug::print(&b"address hash:".to_string());
        std::debug::print(&hash::sha3_256(addr.to_bytes()));
    }
    #[test]
    fun test_addr2bytes(){
        let addr:address = @0xf7ec2215e565b7a18d7b00e70fccda74b30c3ecceffb5857b1b3d2249e28e94f;
        std::debug::print(&addr.to_bytes());
        std::debug::print(&b"bcs::to_bytes(&addr) \n".to_string());
        std::debug::print(&bcs::to_bytes<address>(&addr));
        let num :u256 = 0xf7ec2215e565b7a18d7b00e70fccda74b30c3ecceffb5857b1b3d2249e28e94f;
        std::debug::print(&b"change to number ,print bytes \n".to_string());
        std::debug::print(&bcs::to_bytes(&num));
    }


}