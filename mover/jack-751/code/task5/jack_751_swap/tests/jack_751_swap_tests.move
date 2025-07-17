/*
#[test_only]
module jack_751_swap::jack_751_swap_tests;
// 取消注释这行来导入模块
// use jack_751_swap::jack_751_swap;

const ENotImplemented: u64 = 0;

#[test]
fun test_jack_751_swap() {
    // 通过
}

#[test, expected_failure(abort_code = ::jack_751_swap::jack_751_swap_tests::ENotImplemented)]
fun test_jack_751_swap_fail() {
    abort ENotImplemented
}
*/

#[test_only]
module jack_751_swap::jack_751_swap_tests {
    use sui::test_scenario;
    use sui::coin::{Self, Coin};
    use jack_751_swap::jack_751_swap::{Self, SwapPool};
    use my_coin::jack_751::{JACK_751};
    use my_coin::jack_751_faucet_coin::{JACK_751_FAUCET_COIN};

    const ADMIN: address = @0xABCD;
    const USER1: address = @0x1234;
    const USER2: address = @0x5678;

    #[test]
    fun test_swap_initialization() {
        let mut scenario = test_scenario::begin(ADMIN);
        
        // 初始化交换模块
        {
            jack_751_swap::init_for_testing(test_scenario::ctx(&mut scenario));
        };
        
        // 检查交换池是否已创建
        test_scenario::next_tx(&mut scenario, ADMIN);
        {
            assert!(test_scenario::has_most_recent_shared<SwapPool>(), 0);
        };
        
        test_scenario::end(scenario);
    }

    #[test]
    fun test_add_liquidity() {
        let mut scenario = test_scenario::begin(ADMIN);
        
        // 初始化交换模块
        {
            jack_751_swap::init_for_testing(test_scenario::ctx(&mut scenario));
        };
        
        // 添加流动性
        test_scenario::next_tx(&mut scenario, USER1);
        {
            let mut pool = test_scenario::take_shared<SwapPool>(&scenario);
            
            // 创建测试代币
            let jack_751_coin = coin::mint_for_testing<JACK_751>(1000, test_scenario::ctx(&mut scenario));
            let faucet_coin = coin::mint_for_testing<JACK_751_FAUCET_COIN>(1000, test_scenario::ctx(&mut scenario));
            
            // 添加流动性
            jack_751_swap::add_liquidity(&mut pool, jack_751_coin, faucet_coin, test_scenario::ctx(&mut scenario));
            
            // 检查池子余额
            let (jack_751_balance, faucet_balance, ratio) = jack_751_swap::get_pool_info(&pool);
            assert!(jack_751_balance == 1000, 1);
            assert!(faucet_balance == 1000, 2);
            assert!(ratio == 1000, 3);
            
            test_scenario::return_shared(pool);
        };
        
        test_scenario::end(scenario);
    }

    #[test]
    fun test_swap_jack_751_to_faucet() {
        let mut scenario = test_scenario::begin(ADMIN);
        
        // 初始化并添加流动性
        {
            jack_751_swap::init_for_testing(test_scenario::ctx(&mut scenario));
        };
        
        test_scenario::next_tx(&mut scenario, USER1);
        {
            let mut pool = test_scenario::take_shared<SwapPool>(&scenario);
            let jack_751_coin = coin::mint_for_testing<JACK_751>(2000, test_scenario::ctx(&mut scenario));
            let faucet_coin = coin::mint_for_testing<JACK_751_FAUCET_COIN>(2000, test_scenario::ctx(&mut scenario));
            jack_751_swap::add_liquidity(&mut pool, jack_751_coin, faucet_coin, test_scenario::ctx(&mut scenario));
            test_scenario::return_shared(pool);
        };
        
        // 执行交换
        test_scenario::next_tx(&mut scenario, USER2);
        {
            let mut pool = test_scenario::take_shared<SwapPool>(&scenario);
            let jack_751_coin = coin::mint_for_testing<JACK_751>(100, test_scenario::ctx(&mut scenario));
            
            jack_751_swap::swap_jack_751_to_faucet(&mut pool, jack_751_coin, test_scenario::ctx(&mut scenario));
            
            // 检查交换后的池子余额
            let (jack_751_balance, faucet_balance, _) = jack_751_swap::get_pool_info(&pool);
            assert!(jack_751_balance == 2100, 4); // 2000 + 100
            assert!(faucet_balance == 1900, 5); // 2000 - 100
            
            test_scenario::return_shared(pool);
        };
        
        // 检查USER2是否收到了faucet代币
        test_scenario::next_tx(&mut scenario, USER2);
        {
            assert!(test_scenario::has_most_recent_for_sender<Coin<JACK_751_FAUCET_COIN>>(&scenario), 6);
            let faucet_coin = test_scenario::take_from_sender<Coin<JACK_751_FAUCET_COIN>>(&scenario);
            assert!(coin::value(&faucet_coin) == 100, 7);
            test_scenario::return_to_sender(&scenario, faucet_coin);
        };
        
        test_scenario::end(scenario);
    }

    #[test]
    fun test_swap_faucet_to_jack_751() {
        let mut scenario = test_scenario::begin(ADMIN);
        
        // 初始化并添加流动性
        {
            jack_751_swap::init_for_testing(test_scenario::ctx(&mut scenario));
        };
        
        test_scenario::next_tx(&mut scenario, USER1);
        {
            let mut pool = test_scenario::take_shared<SwapPool>(&scenario);
            let jack_751_coin = coin::mint_for_testing<JACK_751>(2000, test_scenario::ctx(&mut scenario));
            let faucet_coin = coin::mint_for_testing<JACK_751_FAUCET_COIN>(2000, test_scenario::ctx(&mut scenario));
            jack_751_swap::add_liquidity(&mut pool, jack_751_coin, faucet_coin, test_scenario::ctx(&mut scenario));
            test_scenario::return_shared(pool);
        };
        
        // 执行交换
        test_scenario::next_tx(&mut scenario, USER2);
        {
            let mut pool = test_scenario::take_shared<SwapPool>(&scenario);
            let faucet_coin = coin::mint_for_testing<JACK_751_FAUCET_COIN>(200, test_scenario::ctx(&mut scenario));
            
            jack_751_swap::swap_faucet_to_jack_751(&mut pool, faucet_coin, test_scenario::ctx(&mut scenario));
            
            // 检查交换后的池子余额
            let (jack_751_balance, faucet_balance, _) = jack_751_swap::get_pool_info(&pool);
            assert!(jack_751_balance == 1800, 8); // 2000 - 200
            assert!(faucet_balance == 2200, 9); // 2000 + 200
            
            test_scenario::return_shared(pool);
        };
        
        // 检查USER2是否收到了jack_751代币
        test_scenario::next_tx(&mut scenario, USER2);
        {
            assert!(test_scenario::has_most_recent_for_sender<Coin<JACK_751>>(&scenario), 10);
            let jack_751_coin = test_scenario::take_from_sender<Coin<JACK_751>>(&scenario);
            assert!(coin::value(&jack_751_coin) == 200, 11);
            test_scenario::return_to_sender(&scenario, jack_751_coin);
        };
        
        test_scenario::end(scenario);
    }

    #[test]
    fun test_calculate_swap_output() {
        let mut scenario = test_scenario::begin(ADMIN);
        
        {
            jack_751_swap::init_for_testing(test_scenario::ctx(&mut scenario));
        };
        
        test_scenario::next_tx(&mut scenario, ADMIN);
        {
            let pool = test_scenario::take_shared<SwapPool>(&scenario);
            
            // 测试计算交换输出
            let output1 = jack_751_swap::calculate_swap_output(&pool, 100, true); // jack_751 到 faucet
            let output2 = jack_751_swap::calculate_swap_output(&pool, 100, false); // faucet 到 jack_751
            
            assert!(output1 == 100, 12); // 1:1 比例
            assert!(output2 == 100, 13); // 1:1 比例
            
            test_scenario::return_shared(pool);
        };
        
        test_scenario::end(scenario);
    }
}
