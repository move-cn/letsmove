module cuidaquan::liquidity_pool {
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;
    use sui::coin::{Self, Coin};
    use sui::event;
    use sui::balance::{Self, Balance};
    use std::string::{Self, String};
    use std::u128;

    /// 流动性池结构
    public struct LiquidityPool<phantom CoinTypeX, phantom CoinTypeY> has key, store {
        id: UID,
        reserve_x: Balance<CoinTypeX>,
        reserve_y: Balance<CoinTypeY>,
        lp_supply: u64,
        fee_percent: u64, // 以基点表示，例如30表示0.3%
        coin_x_type: String,
        coin_y_type: String,
    }

    /// LP代币结构
    public struct LPCoin<phantom CoinTypeX, phantom CoinTypeY> has key, store {
        id: UID,
        amount: u64,
    }

    /// 流动性池创建事件
    public struct PoolCreatedEvent has copy, drop {
        pool_id: address,
        coin_x_type: String,
        coin_y_type: String,
    }

    /// 添加流动性事件
    public struct LiquidityAddedEvent has copy, drop {
        provider: address,
        pool_id: address,
        amount_x: u64,
        amount_y: u64,
        lp_tokens: u64,
    }

    /// 移除流动性事件
    public struct LiquidityRemovedEvent has copy, drop {
        provider: address,
        pool_id: address,
        amount_x: u64,
        amount_y: u64,
        lp_tokens: u64,
    }

    /// 错误码
    const E_ZERO_AMOUNT: u64 = 0;
    const E_INSUFFICIENT_LIQUIDITY: u64 = 1;
    const E_INSUFFICIENT_X_AMOUNT: u64 = 2;
    const E_INSUFFICIENT_Y_AMOUNT: u64 = 3;
    const E_INVALID_FEE_PERCENT: u64 = 4;
    const E_K_VALUE_INVARIANT: u64 = 5;
    const E_SAME_COIN_TYPE: u64 = 6;

    /// 创建新的流动性池
    public fun create_pool<CoinTypeX, CoinTypeY>(
        coin_x: Coin<CoinTypeX>,
        coin_y: Coin<CoinTypeY>,
        fee_percent: u64,
        ctx: &mut TxContext
    ): LiquidityPool<CoinTypeX, CoinTypeY> {
        // 验证费率在合理范围内 (0-5%)
        assert!(fee_percent <= 500, E_INVALID_FEE_PERCENT);
        
        // 确保代币类型不同
        assert!(!is_same_type<CoinTypeX, CoinTypeY>(), E_SAME_COIN_TYPE);
        
        // 获取代币数量
        let amount_x = coin::value(&coin_x);
        let amount_y = coin::value(&coin_y);
        
        // 确保数量不为零
        assert!(amount_x > 0 && amount_y > 0, E_ZERO_AMOUNT);
        
        // 创建流动性池
        let pool_id = object::new(ctx);
        let pool_address = object::uid_to_address(&pool_id);
        
        // 使用u128进行大数计算
        let amount_x_u128 = (amount_x as u128);
        let amount_y_u128 = (amount_y as u128);
        let product = amount_x_u128 * amount_y_u128;
        let sqrt_product = u128::sqrt(product);
        // 转回u64，确保不会溢出
        let lp_supply = if (sqrt_product > (18446744073709551615 as u128)) {
            18446744073709551615 // u64::MAX
        } else {
            (sqrt_product as u64)
        };
        
        // 创建流动性池对象
        let pool = LiquidityPool<CoinTypeX, CoinTypeY> {
            id: pool_id,
            reserve_x: coin::into_balance(coin_x),
            reserve_y: coin::into_balance(coin_y),
            lp_supply,
            fee_percent,
            coin_x_type: get_coin_name<CoinTypeX>(),
            coin_y_type: get_coin_name<CoinTypeY>(),
        };
        
        // 发出池创建事件
        event::emit(PoolCreatedEvent {
            pool_id: pool_address,
            coin_x_type: get_coin_name<CoinTypeX>(),
            coin_y_type: get_coin_name<CoinTypeY>(),
        });
        
        pool
    }

    /// 添加流动性
    public fun add_liquidity<CoinTypeX, CoinTypeY>(
        pool: &mut LiquidityPool<CoinTypeX, CoinTypeY>,
        mut coin_x: Coin<CoinTypeX>,
        mut coin_y: Coin<CoinTypeY>,
        ctx: &mut TxContext
    ): (LPCoin<CoinTypeX, CoinTypeY>, Coin<CoinTypeX>, Coin<CoinTypeY>) {
        let amount_x = coin::value(&coin_x);
        let amount_y = coin::value(&coin_y);
        
        // 确保数量不为零
        assert!(amount_x > 0 && amount_y > 0, E_ZERO_AMOUNT);
        
        // 获取当前池状态
        let reserve_x = balance::value(&pool.reserve_x);
        let reserve_y = balance::value(&pool.reserve_y);
        
        // 确保 reserve_x 和 reserve_y 不为零
        assert!(reserve_x > 0 && reserve_y > 0, E_INSUFFICIENT_LIQUIDITY);
        
        let (actual_x, actual_y, lp_amount);
        
        // 使用u128进行计算，避免溢出
        let reserve_x_u128 = (reserve_x as u128);
        let reserve_y_u128 = (reserve_y as u128);
        let amount_x_u128 = (amount_x as u128);
        let amount_y_u128 = (amount_y as u128);
        
        // 计算应该添加的代币Y数量（基于比例）
        let y_optimal_u128 = (amount_x_u128 * reserve_y_u128) / reserve_x_u128;
        let y_optimal = if (y_optimal_u128 > (18446744073709551615 as u128)) {
            18446744073709551615 // u64::MAX
        } else {
            (y_optimal_u128 as u64)
        };
        
        // 确定实际添加的数量
        if (y_optimal <= amount_y) {
            actual_x = amount_x;
            actual_y = y_optimal;
        } else {
            // 计算应该添加的代币X数量
            let x_optimal_u128 = (amount_y_u128 * reserve_x_u128) / reserve_y_u128;
            let x_optimal = if (x_optimal_u128 > (18446744073709551615 as u128)) {
                18446744073709551615 // u64::MAX
            } else {
                (x_optimal_u128 as u64)
            };
            
            actual_x = x_optimal;
            actual_y = amount_y;
        };
        
        // 计算LP代币数量，使用u128避免溢出
        let actual_x_u128 = (actual_x as u128);
        let actual_y_u128 = (actual_y as u128);
        let product = actual_x_u128 * actual_y_u128;
        let sqrt_product = u128::sqrt(product);
        
        lp_amount = if (sqrt_product > (18446744073709551615 as u128)) {
            18446744073709551615 // u64::MAX
        } else {
            (sqrt_product as u64)
        };
        
        // 分割代币，只使用实际需要的数量
        let coin_x_to_add;
        let coin_y_to_add;
        
        // 处理X代币
        if (actual_x == amount_x) {
            // 如果需要全部使用X代币，直接使用整个代币
            coin_x_to_add = coin_x;
            // 创建一个空的X代币作为返回值
            coin_x = coin::zero<CoinTypeX>(ctx);
        } else {
            // 否则分割出需要的部分
            coin_x_to_add = coin::split(&mut coin_x, actual_x, ctx);
        };
        
        // 处理Y代币
        if (actual_y == amount_y) {
            // 如果需要全部使用Y代币，直接使用整个代币
            coin_y_to_add = coin_y;
            // 创建一个空的Y代币作为返回值
            coin_y = coin::zero<CoinTypeY>(ctx);
        } else {
            // 否则分割出需要的部分
            coin_y_to_add = coin::split(&mut coin_y, actual_y, ctx);
        };
        
        // 添加流动性到池中
        let coin_x_balance = coin::into_balance(coin_x_to_add);
        let coin_y_balance = coin::into_balance(coin_y_to_add);
        
        let added_x = balance::value(&coin_x_balance);
        let added_y = balance::value(&coin_y_balance);
        
        balance::join(&mut pool.reserve_x, coin_x_balance);
        balance::join(&mut pool.reserve_y, coin_y_balance);
        
        // 更新LP代币总供应量
        pool.lp_supply = pool.lp_supply + lp_amount;
        
        // 创建LP代币
        let lp_coin = LPCoin<CoinTypeX, CoinTypeY> {
            id: object::new(ctx),
            amount: lp_amount,
        };
        
        // 发出添加流动性事件
        event::emit(LiquidityAddedEvent {
            provider: tx_context::sender(ctx),
            pool_id: object::uid_to_address(&pool.id),
            amount_x: added_x,
            amount_y: added_y,
            lp_tokens: lp_amount,
        });
        
        (lp_coin, coin_x, coin_y)
    }

    /// 移除流动性
    public fun remove_liquidity<CoinTypeX, CoinTypeY>(
        pool: &mut LiquidityPool<CoinTypeX, CoinTypeY>,
        lp_coin: LPCoin<CoinTypeX, CoinTypeY>,
        ctx: &mut TxContext
    ): (Coin<CoinTypeX>, Coin<CoinTypeY>) {
        let lp_amount = lp_coin.amount;
        let LPCoin { id, amount: _ } = lp_coin;
        object::delete(id);
        
        // 确保LP代币数量不为零
        assert!(lp_amount > 0, E_ZERO_AMOUNT);
        assert!(lp_amount <= pool.lp_supply, E_INSUFFICIENT_LIQUIDITY);
        
        // 计算应返还的代币数量，使用u128避免溢出
        let reserve_x = balance::value(&pool.reserve_x);
        let reserve_y = balance::value(&pool.reserve_y);
        
        let lp_amount_u128 = (lp_amount as u128);
        let reserve_x_u128 = (reserve_x as u128);
        let reserve_y_u128 = (reserve_y as u128);
        let lp_supply_u128 = (pool.lp_supply as u128);
        
        let amount_x_u128 = (lp_amount_u128 * reserve_x_u128) / lp_supply_u128;
        let amount_y_u128 = (lp_amount_u128 * reserve_y_u128) / lp_supply_u128;
        
        let amount_x = if (amount_x_u128 > (18446744073709551615 as u128)) {
            18446744073709551615 // u64::MAX
        } else {
            (amount_x_u128 as u64)
        };
        
        let amount_y = if (amount_y_u128 > (18446744073709551615 as u128)) {
            18446744073709551615 // u64::MAX
        } else {
            (amount_y_u128 as u64)
        };
        
        // 确保返还数量不为零
        assert!(amount_x > 0, E_INSUFFICIENT_X_AMOUNT);
        assert!(amount_y > 0, E_INSUFFICIENT_Y_AMOUNT);
        
        // 从池中提取代币
        let coin_x = coin::from_balance(balance::split(&mut pool.reserve_x, amount_x), ctx);
        let coin_y = coin::from_balance(balance::split(&mut pool.reserve_y, amount_y), ctx);
        
        // 更新LP代币总供应量
        pool.lp_supply = pool.lp_supply - lp_amount;
        
        // 发出移除流动性事件
        event::emit(LiquidityRemovedEvent {
            provider: tx_context::sender(ctx),
            pool_id: object::uid_to_address(&pool.id),
            amount_x,
            amount_y,
            lp_tokens: lp_amount,
        });
        
        (coin_x, coin_y)
    }

    /// 获取池中的储备量
    public fun get_reserves<CoinTypeX, CoinTypeY>(
        pool: &LiquidityPool<CoinTypeX, CoinTypeY>
    ): (u64, u64) {
        (balance::value(&pool.reserve_x), balance::value(&pool.reserve_y))
    }

    /// 获取LP代币数量
    public fun get_lp_supply<CoinTypeX, CoinTypeY>(
        pool: &LiquidityPool<CoinTypeX, CoinTypeY>
    ): u64 {
        pool.lp_supply
    }

    /// 获取LP代币数量
    public fun get_lp_amount<CoinTypeX, CoinTypeY>(
        lp_coin: &LPCoin<CoinTypeX, CoinTypeY>
    ): u64 {
        lp_coin.amount
    }

    /// 获取代币名称（辅助函数）
    fun get_coin_name<CoinType>(): String {
        let type_name = std::type_name::get<CoinType>();
        string::utf8(std::ascii::into_bytes(std::type_name::into_string(type_name)))
    }

    /// 获取池ID
    public fun get_pool_id<CoinTypeX, CoinTypeY>(
        pool: &LiquidityPool<CoinTypeX, CoinTypeY>
    ): &UID {
        &pool.id
    }

    /// 获取手续费百分比
    public fun get_fee_percent<CoinTypeX, CoinTypeY>(
        pool: &LiquidityPool<CoinTypeX, CoinTypeY>
    ): u64 {
        pool.fee_percent
    }

    /// 执行X->Y代币兑换
    public fun swap_x_to_y<CoinTypeX, CoinTypeY>(
        pool: &mut LiquidityPool<CoinTypeX, CoinTypeY>,
        coin_x: Coin<CoinTypeX>,
        amount_out: u64,
        ctx: &mut TxContext
    ): Coin<CoinTypeY> {
        let amount_in = coin::value(&coin_x);
        
        // 确保数量不为零
        assert!(amount_in > 0, E_ZERO_AMOUNT);
        assert!(amount_out > 0, E_ZERO_AMOUNT);
        
        // 获取当前池状态
        let reserve_x = balance::value(&pool.reserve_x);
        let reserve_y = balance::value(&pool.reserve_y);
        
        // 确保池有足够的流动性
        assert!(reserve_x > 0 && reserve_y > 0, E_INSUFFICIENT_LIQUIDITY);
        
        // 确保输出数量不超过池中的储备量
        assert!(amount_out < reserve_y, E_INSUFFICIENT_Y_AMOUNT);
        
        // 计算交换前的K值，使用u128避免溢出
        let reserve_x_u128 = (reserve_x as u128);
        let reserve_y_u128 = (reserve_y as u128);
        let k_before_u128 = reserve_x_u128 * reserve_y_u128;
        
        // 添加输入代币到池中
        let coin_in_balance = coin::into_balance(coin_x);
        balance::join(&mut pool.reserve_x, coin_in_balance);
        let out_balance = balance::split(&mut pool.reserve_y, amount_out);
        
        // 检查K值不变性，使用u128
        let new_reserve_x = balance::value(&pool.reserve_x);
        let new_reserve_y = balance::value(&pool.reserve_y);
        let new_reserve_x_u128 = (new_reserve_x as u128);
        let new_reserve_y_u128 = (new_reserve_y as u128);
        let k_after_u128 = new_reserve_x_u128 * new_reserve_y_u128;
        
        // K值应该保持不变或增加（考虑手续费）
        assert!(k_after_u128 >= k_before_u128, E_K_VALUE_INVARIANT);
        
        coin::from_balance(out_balance, ctx)
    }

    /// 执行Y->X代币兑换
    public fun swap_y_to_x<CoinTypeX, CoinTypeY>(
        pool: &mut LiquidityPool<CoinTypeX, CoinTypeY>,
        coin_y: Coin<CoinTypeY>,
        amount_out: u64,
        ctx: &mut TxContext
    ): Coin<CoinTypeX> {
        let amount_in = coin::value(&coin_y);
        
        // 确保数量不为零
        assert!(amount_in > 0, E_ZERO_AMOUNT);
        assert!(amount_out > 0, E_ZERO_AMOUNT);
        
        // 获取当前池状态
        let reserve_x = balance::value(&pool.reserve_x);
        let reserve_y = balance::value(&pool.reserve_y);
        
        // 确保池有足够的流动性
        assert!(reserve_x > 0 && reserve_y > 0, E_INSUFFICIENT_LIQUIDITY);
        
        // 确保输出数量不超过池中的储备量
        assert!(amount_out < reserve_x, E_INSUFFICIENT_X_AMOUNT);
        
        // 计算交换前的K值，使用u128避免溢出
        let reserve_x_u128 = (reserve_x as u128);
        let reserve_y_u128 = (reserve_y as u128);
        let k_before_u128 = reserve_x_u128 * reserve_y_u128;
        
        // 添加输入代币到池中
        let coin_in_balance = coin::into_balance(coin_y);
        balance::join(&mut pool.reserve_y, coin_in_balance);
        let out_balance = balance::split(&mut pool.reserve_x, amount_out);
        
        // 检查K值不变性，使用u128
        let new_reserve_x = balance::value(&pool.reserve_x);
        let new_reserve_y = balance::value(&pool.reserve_y);
        let new_reserve_x_u128 = (new_reserve_x as u128);
        let new_reserve_y_u128 = (new_reserve_y as u128);
        let k_after_u128 = new_reserve_x_u128 * new_reserve_y_u128;
        
        // K值应该保持不变或增加（考虑手续费）
        assert!(k_after_u128 >= k_before_u128, E_K_VALUE_INVARIANT);
        
        coin::from_balance(out_balance, ctx)
    }

    /// 计算特定数量LP代币的价值（以代币X和Y的数量表示）
    public fun calculate_lp_value<CoinTypeX, CoinTypeY>(
        pool: &LiquidityPool<CoinTypeX, CoinTypeY>,
        lp_amount: u64
    ): (u64, u64) {
        let reserve_x = balance::value(&pool.reserve_x);
        let reserve_y = balance::value(&pool.reserve_y);
        let lp_supply = pool.lp_supply;
        
        // 如果LP供应量为0，返回0值以避免除以0错误
        if (lp_supply == 0) {
            return (0, 0)
        };
        
        // 计算LP代币对应的X和Y代币数量
        let x_value = (lp_amount * reserve_x) / lp_supply;
        let y_value = (lp_amount * reserve_y) / lp_supply;
        
        (x_value, y_value)
    }
    
    /// 计算流动性提供者的收益（与初始提供的流动性相比）
    public fun calculate_lp_profit<CoinTypeX, CoinTypeY>(
        pool: &LiquidityPool<CoinTypeX, CoinTypeY>,
        lp_amount: u64,
        initial_x: u64,
        initial_y: u64
    ): (u64, u64, bool, bool) {
        // 计算当前LP代币的价值
        let (current_x, current_y) = calculate_lp_value(pool, lp_amount);
        
        // 计算X和Y代币的收益（可能为负）
        let x_profit = if (current_x > initial_x) { current_x - initial_x } else { 0 };
        let y_profit = if (current_y > initial_y) { current_y - initial_y } else { 0 };
        
        // 确定是否有收益
        let has_x_profit = current_x > initial_x;
        let has_y_profit = current_y > initial_y;
        
        (x_profit, y_profit, has_x_profit, has_y_profit)
    }
    
    /// 检查两个类型是否相同（辅助函数）
    fun is_same_type<T1, T2>(): bool {
        get_coin_name<T1>() == get_coin_name<T2>()
    }
}