#[allow(unused_use, duplicate_alias, unused_variable, unused_field, unused_const)]
/// Module: swap
module swap::swap {
    use std::ascii::string;
    use std::debug;
    use sui::balance;
    use sui::balance::{Balance, Supply};
    use sui::object::{Self, UID};
    use sui::tx_context::{TxContext, sender};
    use sui::coin::{Self, Coin, balance};
    use sui::sui::SUI;
    use sui::transfer;
    use sui::tx_context;

    ///liquidity share provider(流动性提供者), parameter 'X' and 'Y'
    ///are coins held in the pool.
    public struct LSP<phantom X, phantom Y> has drop {}

    /// Pool with exchange
    public struct Pool<phantom X, phantom Y> has key {
        id: UID,
        coin_x: Balance<X>,
        coin_y: Balance<Y>,
        lsp_supply: Supply<LSP<X, Y>>,
        fee_percent: u64
    }

    // === Errors ===

    /// Fee is too low for the service
    const EFeeTooLow: u64 = 0;

    /// The two swap requests are not compatible
    const EBadSwap: u64 = 1;

    ///When Coin is zero
    const ErrZeroAmount: u64 = 1001;
    ///Insufficient Coin A in pool
    const ErrNotEnoughAInPool: u64 = 1002;
    ///Insufficient Coin B in pool
    const ErrNotEnoughBInPool: u64 = 1003;
    ///When vector length is not 2
    const ErrInvalidVecotrType: u64 = 1004;
    ///When balance in LP doesn't match summary in vector
    const ErrBalanceNotMatch: u64 = 1005;
    ///When balance in LP is not sufficient to withdraw
    const ErrNotEnoughBalanceLP: u64 = 1006;
    ///When withdraw failed
    const ErrRemoveFailed: u64 = 1011;
    ///When Liquidity provider vector is empty
    const ErrEmptyLPVector: u64 = 1012;

    /// 汇率（coinA:coinB=2:1）
    /// TODO: 暂时不清楚如何动态修改汇率（应该考虑只有指定人员能够设置汇率）
    const EXCHANGE_RATE: u64 = 2;

    /// 交换收取的费率.(x/1000)
    const FEE_PERCENT: u128 = 30;

    // === Public Functions ===
    // fun init(ctx: &mut TxContext) {
    //     new_pool<MY_COIN, FAUCET_COIN>(ctx);
    // }

    /// create a new pool
    public fun new_pool<X, Y>(
        ctx: &mut TxContext
    ) {
        debug::print(&string(b"init pool"));
        let new_pool = Pool<X, Y> {
            id: object::new(ctx),
            coin_x: balance::zero(),
            coin_y: balance::zero(),
            lsp_supply: balance::create_supply<LSP<X, Y>>(LSP {}),
            fee_percent: (FEE_PERCENT as u64),
        };
        transfer::share_object(new_pool);       // share object
    }

    ///Add liquidity into pool
    ///   这里按照固定汇率增加lsp的balance余额，返回新的供应量
    public entry fun add_liquidity<X, Y>(pool: &mut Pool<X, Y>,
                                         coin_x: Coin<X>,
                                         coin_y: Coin<Y>,
                                         ctx: &mut TxContext
    ) {
        let coin_x_value = coin::value(&coin_x);
        let coin_y_value = coin::value(&coin_y);
        assert!(coin_x_value >= 0 && coin_y_value >= 0, ErrZeroAmount);

        // 增加coin
        // 方法y一：balance::join
        let b_balance = coin::into_balance(coin_y);
        balance::join(&mut pool.coin_y, b_balance);
        debug::print(&string(b"coinB"));
        debug::print(&balance::value(&pool.coin_y));

        // 方法二：coin::put （源代码中就是实现上面的流程）
        coin::put(&mut pool.coin_x, coin_x);
        debug::print(&string(b"coinA"));
        debug::print(&balance::value(&pool.coin_x));

        // 根据汇率增加LSP的供应量（如果不考虑手续费，LSP可以不定义）
        let add_supple = coin_x_value * EXCHANGE_RATE + coin_y_value;
        let lsp_balance = balance::increase_supply(&mut pool.lsp_supply, add_supple);

        // 新的流动性供应
        transfer::public_transfer(coin::from_balance(lsp_balance, ctx), sender(ctx));
    }

    ///卖出coinA，添加到pool；从pool中获得相应的coinB
    /// 暂时不考虑手续费，所以供应量LSP的总量应该是不变的
    public entry fun sellA<A, B>(
        pool: &mut Pool<A, B>,
        coinA: Coin<A>,
        ctx: &mut TxContext,
    ) {
        // coinA合法性检查
        let coin_value = coin::value(&coinA);
        assert!(coin_value > 0, ErrZeroAmount);

        // 根据汇率计算coinB的数量
        let output_coin_value = coin_value / EXCHANGE_RATE;

        // 检查是否超过coinB的供应量
        let coin_supuly = balance::value(&pool.coin_y);
        debug::print(&string(b"coinB supuly"));
        debug::print(&output_coin_value);
        debug::print(&coin_supuly);
        assert!(coin_supuly > output_coin_value, ErrNotEnoughBInPool);

        // 增加现金池的coinA
        balance::join(&mut pool.coin_x, coin::into_balance(coinA));

        // 减少现金池的coinB, 注意,take中使用的split函数,返回的是被减去的coin
        let coinB = coin::take(&mut pool.coin_y, output_coin_value, ctx);

        transfer::public_transfer(coinB, sender(ctx));
    }

    ///卖出coinB，添加到pool；从pool中获得相应的coinA
    /// 暂时不考虑手续费，所以供应量LSP的总量应该是不变的
    public entry fun sellB<A, B>(
        pool: &mut Pool<A, B>,
        coinB: Coin<B>,
        ctx: &mut TxContext,
    ) {
        // coin合法性检查
        let coin_value = coin::value(&coinB);
        assert!(coin_value > 0, ErrZeroAmount);

        // 根据汇率计算coinB的数量
        let output_coin_value = coin_value * EXCHANGE_RATE;

        // 检查是否超过coinA的供应量
        let coin_supuly = balance::value(&pool.coin_x);
        debug::print(&string(b"coinA supuly"));
        debug::print(&output_coin_value);
        debug::print(&coin_supuly);
        assert!(coin_supuly > output_coin_value, ErrNotEnoughBInPool);

        // 增加现金池的coinA
        balance::join(&mut pool.coin_y, coin::into_balance(coinB));

        // 减少现金池的coinA, 注意,take中使用的split函数,返回的是被减去的coin
        let coinA = coin::take(&mut pool.coin_x, output_coin_value, ctx);

        transfer::public_transfer(coinA, sender(ctx));
    }

    /// calc_output_amount
    ///     计算卖出coinA（dx）后应该增加的coinB（dy）数量
    ///     核心思想是交易前后 coinA * coinB = k (池中资产的总价值保持不变)
    ///     dy = k / (x - dx) - y
    public fun calc_output_amount(
        coinA_value: u64,
        coinB_value: u64,
        sell_coinA_value: u64,
    ): u64 {
        let (
            x,
            y,
            dx,
        ) = (
            (coinA_value as u128),
            (coinB_value as u128),
            (sell_coinA_value as u128),
        );

        // 计算流动性池的K
        let k = x * y;

        // 根据公式计算 dy = k / (x - dx) - y
        let dy = k / (x - dx) - y;
        (dy as u64)
    }

    #[test]
    fun test_init()
    {
        debug::print(&string(b"init"));
    }
}
