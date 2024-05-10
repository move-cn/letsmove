#[test_only]
module lottery::lottery_tests {
    use sui::test_scenario::{Self};
    use lottery::pool::{Pool};
    use sui::clock::{Self};
    use lottery::pool_manager::PoolAdminCap;
    use std::string::Self;
    use lottery::lottery;
    use sui::sui::SUI;
    use sui::coin;

    #[test]
    fun test_init() {
        let mut senario = test_scenario::begin(@0x123);
        lottery::init_test(test_scenario::ctx(&mut senario));
        test_scenario::end(senario);
    }


    #[test]
    fun test_action(){
        let mut senario = test_scenario::begin(@0x123);
        lottery::init_test(test_scenario::ctx(&mut senario));
        // 这个时候 sender已经拥有poolAdminCap了,可以进行后续步骤了
         test_scenario::next_tx(&mut senario, @0x123);
         {
            // 这里面测试创建池子
            let pool_admin_cap=test_scenario::take_from_sender<PoolAdminCap>(&senario);
            let ctx = test_scenario::ctx(&mut senario);
            lottery::create_pool<SUI>(
                &pool_admin_cap,
                string::utf8(b"SUI-1H"),
                1,
                1*60*60*1000,
                10,
                0,
                8,
                10,
                10000,
                ctx
            );
            test_scenario::return_to_sender(&senario, pool_admin_cap);
         };
         test_scenario::next_tx(&mut senario, @0x123);
         {
            // buy 十张 ticket
            let mut sui_pool = test_scenario::take_shared<Pool<SUI>>(&senario);
            let ctx = test_scenario::ctx(&mut senario);
            let coin = coin::mint_for_testing<SUI>(10, ctx);
            let clock = clock::create_for_testing(ctx);
            lottery::buy_ticket(&mut sui_pool,coin,&clock,ctx);
            test_scenario::return_shared(sui_pool);
            clock::destroy_for_testing(clock);
         };
         test_scenario::next_tx(&mut senario, @0x123);
         {
             // 测试开奖
             let mut sui_pool = test_scenario::take_shared<Pool<SUI>>(&senario);
             let ctx = test_scenario::ctx(&mut senario);
             let clock = clock::create_for_testing(ctx);
             // 开奖
             lottery::settle_pool(&mut sui_pool,b"1223456456456465445645656",&clock,ctx);
             test_scenario::return_shared(sui_pool);
             clock::destroy_for_testing(clock);
         };
        test_scenario::end(senario);
    }
}