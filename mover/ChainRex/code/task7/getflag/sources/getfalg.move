module getflag::getflag {
    use std::ascii::{ String };
    use std::bcs;
    use std::hash::sha3_256;

    public struct Answer has key {
        id: UID,
        flag: vector<u8>
    }

    fun init(ctx: &mut TxContext) {
        let answer = Answer {
            id: object::new(ctx),
            flag: vector::empty()
        };
        transfer::share_object(answer)
    }

    public entry fun get_flag(
        answer: &mut Answer,
        github_id: String,
        flag_str: String,
    ) {
        let mut bcs_flag = bcs::to_bytes(&flag_str);
        vector::append<u8>(
            &mut bcs_flag,
            *github_id.as_bytes()
        );
        answer.flag = sha3_256(bcs_flag);

    }
}
