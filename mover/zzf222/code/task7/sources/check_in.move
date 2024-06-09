module check_in::check_in {
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
    }

    public struct FlagString has key {
        id: UID,
        str: vector<u8>,
        ture_num:u64
    }

    fun init(ctx: &mut TxContext) {
        let flag_str = FlagString {
            id: object::new(ctx),
            str: b"LetsMoveCTF",
            ture_num:0
        };
        share_object(flag_str);
    }


    entry fun get_flag(string: vector<u8>, flag_str: &mut FlagString, rand: &Random, ctx: &mut TxContext) {
        assert!(string == flag_str.str, ESTRING);

        flag_str.str = getRandomString(rand,ctx);
        flag_str.ture_num = flag_str.ture_num +1;

        event::emit(Flag {
            sender: tx_context::sender(ctx),
            flag: true,
        });
    }


    fun getRandomString(rand: &Random, ctx: &mut TxContext): vector<u8> {
        let mut gen = random::new_generator(rand, ctx);

        let mut str_len = random::generate_u8_in_range(&mut gen, 4, 30);

        let mut rand: vector<u8> = b"";
        while (str_len != 0) {
            let rand_num = random::generate_u8_in_range(&mut gen, 48, 126);
            vector::push_back(&mut rand, rand_num);
            str_len = str_len - 1;
        };
        rand
    }
}