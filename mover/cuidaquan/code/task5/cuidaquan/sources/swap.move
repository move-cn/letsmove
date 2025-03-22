module cuidaquan::swap {
    use sui::object::{Self};
    use sui::tx_context::TxContext;
    use sui::coin::{Self, Coin};
    use sui::event;
    use cuidaquan::liquidity_pool::{Self, LiquidityPool};
    use std::string::{Self, String};

    /// 兑换事件
    public struct SwapEvent has copy, drop {
        sender: address,
        pool_id: address,
        coin_in_type: String,
        coin_out_type: String,
        amount_in: u64,
        amount_out: u64,
    }

    /// 错误码
    const E_ZERO_AMOUNT: u64 = 0;
    const E_INSUFFICIENT_OUTPUT_AMOUNT: u64 = 1;
    const E_INSUFFICIENT_LIQUIDITY: u64 = 2;
    const E_INVALID_DEADLINE: u64 = 3;

    /// X->Y代币兑换
    public fun swap_x_to_y<CoinTypeX, CoinTypeY>(
        pool: &mut LiquidityPool<CoinTypeX, CoinTypeY>,
        coin_x: Coin<CoinTypeX>,
        min_amount_out: u64,
        deadline: u64,
        ctx: &mut TxContext
    ): Coin<CoinTypeY> {
        // 检查截止时间
        assert!(tx_context::epoch(ctx) <= deadline, E_INVALID_DEADLINE);
        
        // 获取输入代币数量
        let amount_in = coin::value(&coin_x);
        assert!(amount_in > 0, E_ZERO_AMOUNT);
        
        // 获取池中的储备量
        let (reserve_x, reserve_y) = liquidity_pool::get_reserves(pool);
        assert!(reserve_x > 0 && reserve_y > 0, E_INSUFFICIENT_LIQUIDITY);
        
        // 计算输出数量（考虑手续费），使用u128避免溢出
        let fee_percent = liquidity_pool::get_fee_percent(pool);
        
        let amount_in_u128 = (amount_in as u128);
        let reserve_x_u128 = (reserve_x as u128);
        let reserve_y_u128 = (reserve_y as u128);
        let fee_percent_u128 = (fee_percent as u128);
        
        let amount_in_with_fee_u128 = amount_in_u128 * (10000 - fee_percent_u128);
        let numerator_u128 = amount_in_with_fee_u128 * reserve_y_u128;
        let denominator_u128 = (reserve_x_u128 * 10000) + amount_in_with_fee_u128;
        let amount_out_u128 = numerator_u128 / denominator_u128;
        
        let amount_out = if (amount_out_u128 > (18446744073709551615 as u128)) {
            18446744073709551615 // u64::MAX
        } else {
            (amount_out_u128 as u64)
        };
        
        // 检查输出数量是否满足最低要求
        assert!(amount_out >= min_amount_out, E_INSUFFICIENT_OUTPUT_AMOUNT);
        
        // 执行兑换
        let coin_y = liquidity_pool::swap_x_to_y(pool, coin_x, amount_out, ctx);
        
        // 发出兑换事件
        event::emit(SwapEvent {
            sender: tx_context::sender(ctx),
            pool_id: object::uid_to_address(liquidity_pool::get_pool_id(pool)),
            coin_in_type: get_coin_name<CoinTypeX>(),
            coin_out_type: get_coin_name<CoinTypeY>(),
            amount_in,
            amount_out,
        });
        
        coin_y
    }

    /// Y->X代币兑换
    public fun swap_y_to_x<CoinTypeX, CoinTypeY>(
        pool: &mut LiquidityPool<CoinTypeX, CoinTypeY>,
        coin_y: Coin<CoinTypeY>,
        min_amount_out: u64,
        deadline: u64,
        ctx: &mut TxContext
    ): Coin<CoinTypeX> {
        // 检查截止时间
        assert!(tx_context::epoch(ctx) <= deadline, E_INVALID_DEADLINE);
        
        // 获取输入代币数量
        let amount_in = coin::value(&coin_y);
        assert!(amount_in > 0, E_ZERO_AMOUNT);
        
        // 获取池中的储备量
        let (reserve_x, reserve_y) = liquidity_pool::get_reserves(pool);
        assert!(reserve_x > 0 && reserve_y > 0, E_INSUFFICIENT_LIQUIDITY);
        
        // 计算输出数量（考虑手续费），使用u128避免溢出
        let fee_percent = liquidity_pool::get_fee_percent(pool);
        
        let amount_in_u128 = (amount_in as u128);
        let reserve_x_u128 = (reserve_x as u128);
        let reserve_y_u128 = (reserve_y as u128);
        let fee_percent_u128 = (fee_percent as u128);
        
        let amount_in_with_fee_u128 = amount_in_u128 * (10000 - fee_percent_u128);
        let numerator_u128 = amount_in_with_fee_u128 * reserve_x_u128;
        let denominator_u128 = (reserve_y_u128 * 10000) + amount_in_with_fee_u128;
        let amount_out_u128 = numerator_u128 / denominator_u128;
        
        let amount_out = if (amount_out_u128 > (18446744073709551615 as u128)) {
            18446744073709551615 // u64::MAX
        } else {
            (amount_out_u128 as u64)
        };
        
        // 检查输出数量是否满足最低要求
        assert!(amount_out >= min_amount_out, E_INSUFFICIENT_OUTPUT_AMOUNT);
        
        // 执行兑换
        let coin_x = liquidity_pool::swap_y_to_x(pool, coin_y, amount_out, ctx);
        
        // 发出兑换事件
        event::emit(SwapEvent {
            sender: tx_context::sender(ctx),
            pool_id: object::uid_to_address(liquidity_pool::get_pool_id(pool)),
            coin_in_type: get_coin_name<CoinTypeY>(),
            coin_out_type: get_coin_name<CoinTypeX>(),
            amount_in,
            amount_out,
        });
        
        coin_x
    }

    /// 获取代币名称（辅助函数）
    fun get_coin_name<CoinType>(): String {
        let type_name = std::type_name::get<CoinType>();
        string::utf8(std::ascii::into_bytes(std::type_name::into_string(type_name)))
    }
}