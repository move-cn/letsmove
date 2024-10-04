#[test_only]
module task4::utils_test {
    use task4::utils;
    use task4::jeasonnow_game;
    use sui::test_scenario::{Self, next_tx, ctx};

    const RAND_RANGE_ERROR: u64 = 0;

    #[test]
    fun test_rand_u64_range() {
        let addr1 = @0xA;
        let min = 1;
        let max = 10;

        let mut scenario = test_scenario::begin(addr1);

        {
            jeasonnow_game::test_init(ctx(&mut scenario))
        };

        next_tx(&mut scenario, addr1);
        {
            let rand = utils::rand_u64_range(min, max, ctx(&mut scenario));
            let result = if (rand >= min && rand <= max) {
                true
            } else {
                false
            };
            assert!(result, RAND_RANGE_ERROR);
        };

        test_scenario::end(scenario);
    }
}