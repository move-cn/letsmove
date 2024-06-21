module task7::check_hash {
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
        flaghash: vector<u8>
    }


    fun init(ctx: &mut TxContext) {
    }


    entry fun get_flag(
        github_id: String,
        flag_str: String,
        ctx: &mut TxContext
    ) {
        let mut bcs_flag = bcs::to_bytes(&flag_str);
        vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());
        
        event::emit(Flag {
            flaghash: sha3_256(bcs_flag)
        });
    }
}


