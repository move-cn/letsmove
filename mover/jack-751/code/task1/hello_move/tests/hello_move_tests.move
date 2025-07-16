#[test_only]
module hello_move::hello_move_tests {
    use sui::test_scenario::{Self as test};

    #[test]
    fun test_scenario_setup() {
        let addr = @0xA;
        let scenario = test::begin(addr);
        
        // 基本的場景設置測試
        assert!(test::sender(&scenario) == addr, 0);
        
        test::end(scenario);
    }

    #[test]
    fun test_address_validation() {
        let addr = @0xB;
        let scenario = test::begin(addr);
        
        // 驗證測試地址設置正確
        let sender = test::sender(&scenario);
        assert!(sender == addr, 1);
        
        test::end(scenario);
    }
}
