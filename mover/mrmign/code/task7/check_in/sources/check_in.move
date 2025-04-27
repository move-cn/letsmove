module check_in::check_in {
    use std::ascii::{String, string};
    use std::bcs;
    use std::hash::sha3_256;
    use std::vector;
    use sui::event;
    use sui::object;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::share_object;
    use sui::tx_context::{Self, TxContext};

    const ESTRING: u64 = 0;

    public struct Flag has copy, drop {
        sender: address,
        flag: bool,
        ture_num: u64,
        github_id: String
    }

    public struct FlagString has key {
        id: UID,
        str: String,
        ture_num: u64
    }

    fun init(ctx: &mut TxContext) {
        let flag_str = FlagString {
            id: object::new(ctx),
            str: string(b"LetsMoveCTF"),
            ture_num: 0
        };
        share_object(flag_str);
    }


    entry fun get_flag(
        flag: vector<u8>,
        github_id: String,
        flag_str: &mut FlagString,
        rand: &Random,
        ctx: &mut TxContext
    ) {
        let mut bcs_flag = bcs::to_bytes(&flag_str.str);
        vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());

        assert!(flag == sha3_256(bcs_flag), ESTRING);

        flag_str.str = getRandomString(rand, ctx);

        flag_str.ture_num = flag_str.ture_num + 1;

        event::emit(Flag {
            sender: tx_context::sender(ctx),
            flag: true,
            ture_num: flag_str.ture_num,
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

