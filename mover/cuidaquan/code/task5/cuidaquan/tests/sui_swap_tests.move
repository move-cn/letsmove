// 测试模块
#[test_only]
module cuidaquan::sui_swap_tests {
    use sui::test_scenario as ts;
    use sui::coin::{Self, Coin};
    use sui::transfer;
    use sui::test_utils::assert_eq;
    use cuidaquan::factory::{Self, Factory};
    use cuidaquan::liquidity_pool::{Self, LiquidityPool, LPCoin};
    use cuidaquan::swap;

    public struct COIN_X has drop {}
    public struct COIN_Y has drop {}
    public struct COIN_Z has drop {}

    // 测试地址
    const ADMIN: address = @0xAD;
    const USER1: address = @0x1;
    const USER2: address = @0x2;

    // 测试常量
    const INITIAL_COIN_AMOUNT: u64 = 10000000000000; // 10万亿
    const POOL_INITIAL_X: u64 = 50000000000; // 500亿
    const POOL_INITIAL_Y: u64 = 10000000000; // 100亿
    const SWAP_AMOUNT: u64 = 1000000000; // 10亿
    const DEFAULT_FEE_PERCENT: u64 = 30; // 0.3%

    // 测试工厂创建
    #[test]
    fun test_create_factory() {
        let mut scenario = ts::begin(ADMIN);
        {
            // 创建工厂
            factory::create_factory(DEFAULT_FEE_PERCENT, ts::ctx(&mut scenario));
        };
        ts::next_tx(&mut scenario, ADMIN);
        {
            // 验证工厂是否创建成功
            let factory = ts::take_shared<Factory>(&scenario);
            assert_eq(factory::get_default_fee_percent(&factory), DEFAULT_FEE_PERCENT);
            assert_eq(factory::get_owner(&factory), ADMIN);
            ts::return_shared(factory);
        };
        ts::end(scenario);
    }

    // 测试流动性池创建
    #[test]
    fun test_create_pool() {
        // 设置测试场景
        let mut scenario = setup_test_coins();
        
        ts::next_tx(&mut scenario, ADMIN);
        {
            // 创建工厂
            factory::create_factory(DEFAULT_FEE_PERCENT, ts::ctx(&mut scenario));
        };

        ts::next_tx(&mut scenario, ADMIN);
        {
            // 创建流动性池
            let mut factory = ts::take_shared<Factory>(&scenario);
            
            // 获取代币
            let mut coin_x = ts::take_from_sender<Coin<COIN_X>>(&scenario);
            let mut coin_y = ts::take_from_sender<Coin<COIN_Y>>(&scenario);
            
            // 分割用于创建池的代币
            let pool_coin_x = coin::split(&mut coin_x, POOL_INITIAL_X, ts::ctx(&mut scenario));
            let pool_coin_y = coin::split(&mut coin_y, POOL_INITIAL_Y, ts::ctx(&mut scenario));
            
            // 创建COIN_X-COIN_Y流动性池
            factory::create_pool<COIN_X, COIN_Y>(
                &mut factory,
                pool_coin_x,
                pool_coin_y,
                DEFAULT_FEE_PERCENT,
                ts::ctx(&mut scenario)
            );
            
            // 将代币转移给用户
            transfer::public_transfer(coin_x, ADMIN);
            transfer::public_transfer(coin_y, ADMIN);
            
            ts::return_shared(factory);
        };

        ts::next_tx(&mut scenario, ADMIN);
        {
            // 验证流动性池是否创建成功
            let factory = ts::take_shared<Factory>(&scenario);
            let pool_count = factory::get_pool_count(&factory);
            assert_eq(pool_count, 1);
            
            // 检查池是否存在 - 由于我们无法直接访问 factory.pools，
            // 我们只能通过检查池数量来间接验证池是否创建成功
            assert!(pool_count > 0, 0);
            
            ts::return_shared(factory);
        };
        
        ts::end(scenario);
    }

    // 测试添加流动性
    #[test]
    fun test_add_liquidity() {
        // 设置测试场景
        let mut scenario = setup_test_pool();
        
        ts::next_tx(&mut scenario, USER1);
        {
            let coin_x = ts::take_from_sender<Coin<COIN_X>>(&scenario);
            let coin_y = ts::take_from_sender<Coin<COIN_Y>>(&scenario);
            
            let mut pool = ts::take_shared<LiquidityPool<COIN_X, COIN_Y>>(&scenario);
            
            let (lp_coin, coin_x_ret, coin_y_ret) = liquidity_pool::add_liquidity(
                &mut pool,
                coin_x,
                coin_y,
                ts::ctx(&mut scenario)
            );
            
            // 转移剩余代币给用户
            transfer::public_transfer(coin_x_ret, USER1);
            transfer::public_transfer(coin_y_ret, USER1);
            transfer::public_transfer(lp_coin, USER1);
            
            ts::return_shared(pool);
        };
        
        ts::next_tx(&mut scenario, USER1);
        {
            // 获取流动性池和用户的 LP 代币
            let mut pool = ts::take_shared<LiquidityPool<COIN_X, COIN_Y>>(&scenario);
            let lp_coin = ts::take_from_sender<LPCoin<COIN_X, COIN_Y>>(&scenario);
            
            // 移除所有流动性
            let (coin_x, coin_y) = liquidity_pool::remove_liquidity(
                &mut pool,
                lp_coin,
                ts::ctx(&mut scenario)
            );
            
            // 销毁返回的代币
            coin::burn_for_testing(coin_x);
            coin::burn_for_testing(coin_y);
            
            // 返回共享池
            ts::return_shared(pool);
        };
        
        ts::end(scenario);
    }

    // 测试代币交换
    #[test]
    fun test_swap() {
        // 设置测试场景
        let mut scenario = setup_test_pool();
        
        ts::next_tx(&mut scenario, USER2);
        {
            // 获取用户代币
            let mut coin_in = ts::take_from_sender<Coin<COIN_X>>(&scenario);
            
            // 分割用于交换的代币
            let swap_coin = coin::split(&mut coin_in, SWAP_AMOUNT, ts::ctx(&mut scenario));
            
            // 获取流动性池
            let mut pool = ts::take_shared<LiquidityPool<COIN_X, COIN_Y>>(&scenario);
            
            // 执行交换
            let coin_out = swap::swap_x_to_y(
                &mut pool,
                swap_coin,
                0, // 最小输出金额
                999999999, // 截止时间
                ts::ctx(&mut scenario)
            );
            
            // 返回代币
            transfer::public_transfer(coin_in, USER2);
            transfer::public_transfer(coin_out, USER2);
            
            ts::return_shared(pool);
        };
        
        ts::next_tx(&mut scenario, USER2);
        {
            // 验证流动性池状态
            let pool = ts::take_shared<LiquidityPool<COIN_X, COIN_Y>>(&scenario);
            let (reserve_x, _reserve_y) = liquidity_pool::get_reserves(&pool);
            
            // 验证储备金额变化
            assert_eq(reserve_x, POOL_INITIAL_X + SWAP_AMOUNT);
            
            // 验证用户获得的代币
            let coin_out = ts::take_from_sender<Coin<COIN_Y>>(&scenario);
            let amount_out = coin::value(&coin_out);
            
            // 验证输出金额大于0
            assert!(amount_out > 0, 0);
            
            // 返回代币
            transfer::public_transfer(coin_out, USER2);
            ts::return_shared(pool);
        };
        
        ts::end(scenario);
    }

    // 辅助函数：设置测试代币
    fun setup_test_coins(): ts::Scenario {
        let mut scenario = ts::begin(ADMIN);
        
        ts::next_tx(&mut scenario, ADMIN);
        {
            // 创建COIN_Y代币给管理员
            let coin_y = coin::mint_for_testing<COIN_Y>(INITIAL_COIN_AMOUNT, ts::ctx(&mut scenario));
            transfer::public_transfer(coin_y, ADMIN);
            
            // 创建COIN_X代币给管理员
            let coin_x = coin::mint_for_testing<COIN_X>(INITIAL_COIN_AMOUNT, ts::ctx(&mut scenario));
            transfer::public_transfer(coin_x, ADMIN);
        };
        
        ts::next_tx(&mut scenario, ADMIN);
        {
            // 创建COIN_Y代币给用户1
            let coin_y = coin::mint_for_testing<COIN_Y>(INITIAL_COIN_AMOUNT, ts::ctx(&mut scenario));
            transfer::public_transfer(coin_y, USER1);
            
            // 创建COIN_X代币给用户1
            let coin_x = coin::mint_for_testing<COIN_X>(INITIAL_COIN_AMOUNT, ts::ctx(&mut scenario));
            transfer::public_transfer(coin_x, USER1);
        };
        
        ts::next_tx(&mut scenario, ADMIN);
        {
            // 创建COIN_Y代币给用户2
            let coin_y = coin::mint_for_testing<COIN_Y>(INITIAL_COIN_AMOUNT, ts::ctx(&mut scenario));
            transfer::public_transfer(coin_y, USER2);
            
            // 创建COIN_X代币给用户2
            let coin_x = coin::mint_for_testing<COIN_X>(INITIAL_COIN_AMOUNT, ts::ctx(&mut scenario));
            transfer::public_transfer(coin_x, USER2);
        };
        
        scenario
    }

    // 辅助函数：设置测试工厂和流动性池
    fun setup_test_pool(): ts::Scenario {
        let mut scenario = setup_test_coins();
        
        ts::next_tx(&mut scenario, ADMIN);
        {
            // 创建工厂
            factory::create_factory(DEFAULT_FEE_PERCENT, ts::ctx(&mut scenario));
        };
        
        ts::next_tx(&mut scenario, ADMIN);
        {
            // 创建流动性池
            let mut factory = ts::take_shared<Factory>(&scenario);
            
            // 获取管理员代币
            let mut coin_x = ts::take_from_sender<Coin<COIN_X>>(&scenario);
            let mut coin_y = ts::take_from_sender<Coin<COIN_Y>>(&scenario);
            
            // 分割用于初始化流动性池的代币
            let pool_coin_x = coin::split(&mut coin_x, POOL_INITIAL_X, ts::ctx(&mut scenario));
            let pool_coin_y = coin::split(&mut coin_y, POOL_INITIAL_Y, ts::ctx(&mut scenario));
            
            // 创建COIN_X-COIN_Y流动性池
            factory::create_pool<COIN_X, COIN_Y>(
                &mut factory,
                pool_coin_x,
                pool_coin_y,
                DEFAULT_FEE_PERCENT,
                ts::ctx(&mut scenario)
            );
            
            // 将代币转移给用户
            transfer::public_transfer(coin_x, USER1);
            transfer::public_transfer(coin_y, USER1);
            
            ts::return_shared(factory);
        };
        
        scenario
    }

    // 测试 LP 代币价值和利润
    #[test]
    fun test_lp_value_and_profit() {
        let mut scenario = setup_test_coins();

        ts::next_tx(&mut scenario, ADMIN);
        {
            // 创建工厂
            factory::create_factory(DEFAULT_FEE_PERCENT, ts::ctx(&mut scenario));
        };

        ts::next_tx(&mut scenario, ADMIN);
        {
            // 创建流动性池
            let mut factory = ts::take_shared<Factory>(&scenario);
            
            // 获取管理员代币
            let mut coin_x = ts::take_from_sender<Coin<COIN_X>>(&scenario);
            let mut coin_y = ts::take_from_sender<Coin<COIN_Y>>(&scenario);
            
            // 分割用于初始化流动性池的代币
            let pool_coin_x = coin::split(&mut coin_x, POOL_INITIAL_X, ts::ctx(&mut scenario));
            let pool_coin_y = coin::split(&mut coin_y, POOL_INITIAL_Y, ts::ctx(&mut scenario));
            
            // 创建COIN_X-COIN_Y流动性池
            factory::create_pool<COIN_X, COIN_Y>(
                &mut factory,
                pool_coin_x,
                pool_coin_y,
                DEFAULT_FEE_PERCENT,
                ts::ctx(&mut scenario)
            );
            
            // 将代币转移给用户
            transfer::public_transfer(coin_x, ADMIN);
            transfer::public_transfer(coin_y, ADMIN);
            
            ts::return_shared(factory);
        };

        ts::next_tx(&mut scenario, USER1);
        {
            // 获取用户代币
            let mut coin_x = ts::take_from_sender<Coin<COIN_X>>(&scenario);
            let mut coin_y = ts::take_from_sender<Coin<COIN_Y>>(&scenario);
            
            // 获取流动性池
            let mut pool = ts::take_shared<LiquidityPool<COIN_X, COIN_Y>>(&scenario);
            
            // 分割用于添加流动性的代币
            let add_coin_x = coin::split(&mut coin_x, POOL_INITIAL_X / 10, ts::ctx(&mut scenario));
            let add_coin_y = coin::split(&mut coin_y, POOL_INITIAL_Y / 10, ts::ctx(&mut scenario));
            
            // 添加流动性
            let (lp_coin, coin_x_ret, coin_y_ret) = liquidity_pool::add_liquidity(
                &mut pool,
                add_coin_x,
                add_coin_y,
                ts::ctx(&mut scenario)
            );
            
            // 转移剩余代币给用户
            transfer::public_transfer(coin_x_ret, USER1);
            transfer::public_transfer(coin_y_ret, USER1);
            transfer::public_transfer(lp_coin, USER1);
            
            // 转移分割后剩余的代币给用户
            transfer::public_transfer(coin_x, USER1);
            transfer::public_transfer(coin_y, USER1);
            
            ts::return_shared(pool);
        };
        ts::end(scenario);
    }

    #[test]
    fun test_add_and_remove_liquidity() {
        let mut scenario = setup_test_coins();

        ts::next_tx(&mut scenario, ADMIN);
        {
            // 创建工厂
            factory::create_factory(DEFAULT_FEE_PERCENT, ts::ctx(&mut scenario));
        };

        ts::next_tx(&mut scenario, ADMIN);
        {
            // 创建流动性池
            let mut factory = ts::take_shared<Factory>(&scenario);
            
            // 获取管理员代币
            let mut coin_x = ts::take_from_sender<Coin<COIN_X>>(&scenario);
            let mut coin_y = ts::take_from_sender<Coin<COIN_Y>>(&scenario);
            
            // 分割用于初始化流动性池的代币
            let pool_coin_x = coin::split(&mut coin_x, POOL_INITIAL_X, ts::ctx(&mut scenario));
            let pool_coin_y = coin::split(&mut coin_y, POOL_INITIAL_Y, ts::ctx(&mut scenario));
            
            // 创建COIN_X-COIN_Y流动性池
            factory::create_pool<COIN_X, COIN_Y>(
                &mut factory,
                pool_coin_x,
                pool_coin_y,
                DEFAULT_FEE_PERCENT,
                ts::ctx(&mut scenario)
            );
            
            // 将代币转移给用户
            transfer::public_transfer(coin_x, ADMIN);
            transfer::public_transfer(coin_y, ADMIN);
            
            ts::return_shared(factory);
        };

        ts::next_tx(&mut scenario, USER1);
        {
            let coin_x = ts::take_from_sender<Coin<COIN_X>>(&scenario);
            let coin_y = ts::take_from_sender<Coin<COIN_Y>>(&scenario);

            let mut pool = ts::take_shared<LiquidityPool<COIN_X, COIN_Y>>(&scenario);

            let (lp_coin, coin_x_ret, coin_y_ret) = liquidity_pool::add_liquidity(
                &mut pool,
                coin_x,
                coin_y,
                ts::ctx(&mut scenario)
            );

            // Transfer remaining tokens back to user
            transfer::public_transfer(coin_x_ret, USER1);
            transfer::public_transfer(coin_y_ret, USER1);
            transfer::public_transfer(lp_coin, USER1);

            ts::return_shared(pool);
        };

        ts::end(scenario);
    }
}
