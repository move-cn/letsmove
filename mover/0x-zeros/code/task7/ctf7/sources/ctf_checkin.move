module ctf7::ctf_checkin;

    use sui::bcs;
    use std::hash;
    use sui::event;

    #[test_only]
    use std::debug::print;


    public struct CalculateFlagEvent has drop, copy {
        github_id: vector<u8>,
        flag_str: vector<u8>,
        flag: vector<u8>
    }

    entry fun calculate_flag(
        github_id: vector<u8>,
        flag_str: vector<u8>,
        ctx: &mut TxContext
    ): vector<u8> {

        let mut bcs_flag = bcs::to_bytes(&flag_str);
        vector::append<u8>(&mut bcs_flag, github_id);

        let flag = hash::sha3_256(bcs_flag);

        event::emit(CalculateFlagEvent {
            github_id,
            flag_str,
            flag
        });

        flag
    }

    #[test]
    fun test_calculate_flag() {
        let github_id = b"0x-zeros";
        let flag_str = b"/4T87NBh.hC%R%1W@rX";

        let mut bcs_flag = bcs::to_bytes(&flag_str);
        vector::append<u8>(&mut bcs_flag, github_id);

        let flag = hash::sha3_256(bcs_flag);
        print(&flag);
        // print(&(flag.to_string()));
    }
