#[test_only]
module task7::task7_tests {
    use sui::test_scenario::{Self, ctx};
    use std::debug;
    use std::bcs::{Self};
    use std::ascii::{Self};
    use std::hash::{Self};
    use task7::check_in::{Self, FlagString};

    const ADMIN: address = @0xA;

    #[test]
    fun process_for_testing() {
        let mut scenario = test_scenario::begin(ADMIN);

        check_in::init_for_testing(ctx(&mut scenario));
        test_scenario::next_tx(&mut scenario, ADMIN);

        let flag_str = test_scenario::take_shared<FlagString>(&scenario);
        let github_id = ascii::string(b"Heemale");

        let mut bcs_flag = bcs::to_bytes(&check_in::str(&flag_str));
        vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());
        let result = hash::sha3_256(bcs_flag);
        debug::print(&result);

        test_scenario::return_shared(flag_str);
        test_scenario::end(scenario);
    }
}
