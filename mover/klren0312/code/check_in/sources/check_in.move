module check_in::check_in {
  use std::ascii::{string, String};
  use std::bcs;
  use std::hash::sha3_256;
  use sui::transfer::share_object;

    const ESTRING: u64 = 0;


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



    entry fun get_flag(): vector<u8> {
        let mut bcs_flag = bcs::to_bytes(&string(b"9$3^U&7j'lX^yUsyP_"));
        vector::append<u8>(&mut bcs_flag, *string(b"klren0312").as_bytes());
        let sha256 = sha3_256(bcs_flag);
        sha256
    }

    entry fun check_get_flag(
        flag: vector<u8>,
        github_id: String,
        flag_str: String,
    ): vector<u8> {
        let mut bcs_flag = bcs::to_bytes(&flag_str);
        vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());
        assert!(flag == sha3_256(bcs_flag), ESTRING);
        sha3_256(bcs_flag)
    }
}

