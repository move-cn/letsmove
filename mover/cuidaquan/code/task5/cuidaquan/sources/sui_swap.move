module cuidaquan::sui_swap {
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use sui::coin::Coin;
    use cuidaquan::factory::{Self, Factory};
    use cuidaquan::liquidity_pool::{Self, LiquidityPool, LPCoin};
    use cuidaquan::swap;

    /// 默认手续费率（0.3%）
    const DEFAULT_FEE_PERCENT: u64 = 30;

    /// 一次性见证类型，用于初始化
    public struct SUI_SWAP has drop {}

    /// 初始化函数
    fun init(_witness: SUI_SWAP, ctx: &mut TxContext) {
        // 创建工厂
        factory::create_factory(DEFAULT_FEE_PERCENT, ctx);
    }

    /// 创建流动性池
    public entry fun create_pool<CoinTypeX, CoinTypeY>(
        factory: &mut Factory,
        coin_x: Coin<CoinTypeX>,
        coin_y: Coin<CoinTypeY>,
        fee_percent: u64,
        ctx: &mut TxContext
    ) {
        factory::create_pool(factory, coin_x, coin_y, fee_percent, ctx);
    }

    /// 使用默认费率创建流动性池
    public entry fun create_pool_with_default_fee<CoinTypeX, CoinTypeY>(
        factory: &mut Factory,
        coin_x: Coin<CoinTypeX>,
        coin_y: Coin<CoinTypeY>,
        ctx: &mut TxContext
    ) {
        factory::create_pool_with_default_fee(factory, coin_x, coin_y, ctx);
    }

    /// 添加流动性
    public entry fun add_liquidity<CoinTypeX, CoinTypeY>(
        pool: &mut LiquidityPool<CoinTypeX, CoinTypeY>,
        coin_x: Coin<CoinTypeX>,
        coin_y: Coin<CoinTypeY>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let (lp_coin, remaining_x, remaining_y) = liquidity_pool::add_liquidity(pool, coin_x, coin_y, ctx);
        
        // 转移LP代币和剩余代币给用户
        transfer::public_transfer(lp_coin, sender);
        transfer::public_transfer(remaining_x, sender);
        transfer::public_transfer(remaining_y, sender);
    }

    /// 移除流动性
    public entry fun remove_liquidity<CoinTypeX, CoinTypeY>(
        pool: &mut LiquidityPool<CoinTypeX, CoinTypeY>,
        lp_coin: LPCoin<CoinTypeX, CoinTypeY>,
        ctx: &mut TxContext
    ) {
        let (coin_x, coin_y) = liquidity_pool::remove_liquidity(pool, lp_coin, ctx);
        transfer::public_transfer(coin_x, tx_context::sender(ctx));
        transfer::public_transfer(coin_y, tx_context::sender(ctx));
    }

    /// X->Y代币兑换
    public entry fun swap_x_to_y<CoinTypeX, CoinTypeY>(
        pool: &mut LiquidityPool<CoinTypeX, CoinTypeY>,
        coin_x: Coin<CoinTypeX>,
        min_amount_out: u64,
        deadline: u64,
        ctx: &mut TxContext
    ) {
        let coin_y = swap::swap_x_to_y(pool, coin_x, min_amount_out, deadline, ctx);
        transfer::public_transfer(coin_y, tx_context::sender(ctx));
    }

    /// Y->X代币兑换
    public entry fun swap_y_to_x<CoinTypeX, CoinTypeY>(
        pool: &mut LiquidityPool<CoinTypeX, CoinTypeY>,
        coin_y: Coin<CoinTypeY>,
        min_amount_out: u64,
        deadline: u64,
        ctx: &mut TxContext
    ) {
        let coin_x = swap::swap_y_to_x(pool, coin_y, min_amount_out, deadline, ctx);
        transfer::public_transfer(coin_x, tx_context::sender(ctx));
    }

    /// 更新工厂默认费率
    public entry fun update_default_fee_percent(
        factory: &mut Factory,
        new_fee_percent: u64,
        ctx: &mut TxContext
    ) {
        factory::update_default_fee_percent(factory, new_fee_percent, ctx);
    }

    /// 转移工厂所有权
    public entry fun transfer_factory_ownership(
        factory: &mut Factory,
        new_owner: address,
        ctx: &mut TxContext
    ) {
        factory::transfer_ownership(factory, new_owner, ctx);
    }
}


