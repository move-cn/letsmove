#[test_only]
module move_castle::utils_tests {
    use sui::test_scenario::Self;
    use move_castle::utils;
    use std::debug::print;

    #[test]
    fun serial_number_test() {
        let sender = @0xABC;

        let mut scenario_val = test_scenario::begin(sender);
        let scenario = &mut scenario_val;
        {
            let ctx = test_scenario::ctx(scenario);
            let uid = object::new(ctx);
            let result = utils::generate_castle_serial_number(0, & uid);
            print(&result);
            assert!(result >= 0, 0);
            assert!(result < 100000, 0);
            object::delete(uid);
        };
        test_scenario::end(scenario_val);
    }
}