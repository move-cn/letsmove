/*
/// Module: ctf7
module ctf7::ctf7;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


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
        _ctx: &mut TxContext
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
        let github_id = b"SherVite";
        let flag_str = b"LETSSUIMOVECTF";

        let mut bcs_flag = bcs::to_bytes(&flag_str);
        vector::append<u8>(&mut bcs_flag, github_id);

        let flag = hash::sha3_256(bcs_flag);
        print(&flag);
        // print(&(flag.to_string()));
    }