#[test_only]
module task1::task1_tests {
    use sui::test_scenario;
    use task1::task1::{Self, Message};
    
    #[test]
    fun test_create_message() {
        // 创建测试场景并设置测试账户
        let owner = @0xA;
        let mut scenario_val = test_scenario::begin(owner);
        let scenario = &mut scenario_val;
        
        // 第一个交易：创建消息
        test_scenario::next_tx(scenario, owner);
        {
            task1::create_message(test_scenario::ctx(scenario));
        };
        
        // 第二个交易：验证消息内容
        test_scenario::next_tx(scenario, owner);
        {
            let message = test_scenario::take_from_sender<Message>(scenario);
            let content = task1::get_content(&message);
            assert!(content == std::string::utf8(b"happy-zhangbo"), 0);
            test_scenario::return_to_sender(scenario, message);
        };
        
        test_scenario::end(scenario_val);
    }
} 