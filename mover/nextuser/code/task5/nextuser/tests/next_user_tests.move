#[test_only]
module nextuser::swap_tests {
    use sui::test_scenario::{Self as test};
    use sui::test_utils::{Self, assert_eq};
    use sui::coin::{Self};
    
    // 导入两种代币的类型
    use coin_faucet::jp::JP;
    use coin_own::yuan_da_tou::YUAN_DA_TOU;
    use nextuser::swap::{Self};
    #[test]
    fun test_swap() {
        let owner = @0xA;
        let user = @0xB;
        
        let mut scenario = test::begin(owner);
   
        
        // 第一步：设置初始代币
        test::next_tx(&mut scenario, owner);
        {
            // 为测试创建YUAN_DA_TOU代币
            let yuan_coin = coin::mint_for_testing<YUAN_DA_TOU>(1000, test::ctx(&mut scenario));
            // 为测试创建JP代币
            let jp_coin = coin::mint_for_testing<JP>(8000, test::ctx(&mut scenario));

    
            
            // 初始化swap池
            swap::create_pool(yuan_coin, jp_coin,  800, test::ctx(&mut scenario));

        };

        // 第二步：用户进行swap操作
        test::next_tx(&mut scenario, user);
        {
            let mut pool : swap::LiquidPool<YUAN_DA_TOU,JP> = test::take_shared<swap::LiquidPool<YUAN_DA_TOU,JP>>(&scenario);
            let (a_balance,b_balance) = swap::get_pool_balance<YUAN_DA_TOU,JP>(&pool);
            assert_eq(a_balance, 1000);
            assert_eq(b_balance, 8000);

            let yuan_coin = coin::mint_for_testing<YUAN_DA_TOU>(100, test::ctx(&mut scenario));
            
            let jp_out = swap::swap_a2b<YUAN_DA_TOU,JP>(
                &mut pool,
                yuan_coin,
                test::ctx(&mut scenario)
            );
            
            // 验证输出的代币数量
            assert_eq(coin::value(&jp_out), 800);
            let (a_balance,b_balance) = swap::get_pool_balance<YUAN_DA_TOU,JP>(&pool);
            std::debug::print(&a_balance);
            std::debug::print(&b_balance);
            assert_eq(a_balance, 1100);
            assert_eq(b_balance, 7200);
            test::return_shared(pool);
            // 清理测试代币
            test_utils::destroy(jp_out);
        };

        // 第三步：反向swap测试
        test::next_tx(&mut scenario, user);
        {

            let jp_coin = coin::mint_for_testing<JP>(1000, test::ctx(&mut scenario));
            let mut pool = test::take_shared<swap::LiquidPool<YUAN_DA_TOU,JP>>(&scenario);
            let yuan_out = swap::swap_b2a<YUAN_DA_TOU,JP>(
                &mut pool,
                jp_coin,
                test::ctx(&mut scenario)
            );


            
            // 验证输出的代币数量
            
            assert_eq(yuan_out.value(), 125);
            let (a_balance,b_balance) = swap::get_pool_balance<YUAN_DA_TOU,JP>(&pool);
            std::debug::print(&a_balance);
            std::debug::print(&b_balance);
            assert_eq(a_balance, 1100 - 125);
            assert_eq(b_balance, 7200 + 1000);
            test::return_shared(pool);
            // 清理测试代币
            test_utils::destroy(yuan_out);
        };

        test::end(scenario);
    }
} 