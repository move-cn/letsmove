#[test_only]
#[allow(unused_variable, unused_use, unused_let_mut)]
module check_in::check_in_tests {
    use std::ascii::string;
    use std::debug;
    use sui::test_scenario as ts;
    use check_in::check_in::{Self, Flag, FlagString};
    use sui::random::{Self, Random};

    #[test]
        fun test_check_in() {
        let admin = @0x0;
        let mut scenario = ts::begin(admin);

        // init
        ts::next_tx(&mut scenario, admin);
        {
            check_in::test_for_init(scenario.ctx());
        };

        ts::next_tx(&mut scenario, admin);
        {
            random::create_for_testing(scenario.ctx());
        };

        // get vector
        let mut my_vector = vector::empty<u8>();
        ts::next_tx(&mut scenario, admin);
        {
            let mut flag_str = ts::take_shared<FlagString>(&scenario);
            vector::append<u8>(&mut my_vector, check_in::get_vector(string(b"croal99"), &mut flag_str, scenario.ctx()));

            let len = vector::length(&my_vector);
            let mut i = 0;
            while (i < len)
            {
                let byte = *vector::borrow(&my_vector, i);
                i = i + 1;
                debug::print(&byte);
            };
            ts::return_shared<FlagString>(flag_str);
        };

        // get_flag
        ts::next_tx(&mut scenario, admin);
        {
            let rand = ts::take_shared<Random>(&scenario);
            let mut flag_str = ts::take_shared<FlagString>(&scenario);

            check_in::get_flag(my_vector, string(b"croal99"), &mut flag_str, &rand, scenario.ctx());

            ts::return_shared<FlagString>(flag_str);
            ts::return_shared<Random>(rand);
        };

        ts::end(scenario);
        // pass
    }
}
