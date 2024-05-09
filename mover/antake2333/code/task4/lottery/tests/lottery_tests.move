#[test_only]
module lottery::lottery_tests {
    use sui::test_scenario::{Self};

    use lottery::lottery;

    #[test]
    fun test_init() {
        let mut senario = test_scenario::begin(@0x123);
        lottery::init_test(test_scenario::ctx(&mut senario));
        test_scenario::end(senario);
    }
}