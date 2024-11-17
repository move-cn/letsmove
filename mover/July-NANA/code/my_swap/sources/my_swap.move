/// Module: my_swap
module my_swap::my_swap {
    use std::u64::min;
    use sui::balance;
    use sui::coin;
    use sui::coin::{Coin, value};
    use sui::math;
    use sui::object;
    use sui::object::UID;
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    /// 错误码
    const EAMOUNT_ZERO: u64 = 0;
    const EOUTPUT_NOT_ENOUGH: u64 = 1;

    // 精度因子，假设为 10^6
    const PRECISION_FACTOR: u64 = 1_000_000;

    public struct LiquidPool<phantom A, phantom B> has key, store {
        id: UID,
        coin_a: Coin<A>,
        coin_b: Coin<B>,
        reserve_a: u64,
        reserve_b: u64,
        liquidity: u64,
    }

    public struct LiquidityToken<phantom A, phantom B>  has key, store {
        id: UID,
        amount: u64,
    }

    entry fun create_pool<A, B>(coin_a: Coin<A>, coin_b: Coin<B>, ctx: &mut TxContext) {
        let reserve_a = balance::value(coin::balance(&coin_a));
        let reserve_b = balance::value(coin::balance(&coin_b));
        let liquidity = math::sqrt(reserve_a * reserve_b);
        let liquidpool = LiquidPool {
            id: object::new(ctx),
            coin_a: coin_a,
            coin_b: coin_b,
            reserve_a: reserve_a,
            reserve_b: reserve_b,
            liquidity: liquidity,
        };

        let liquidity_token = LiquidityToken<A, B> {
            id: object::new(ctx),
            amount: liquidity,
        };
        transfer::public_transfer(liquidity_token, tx_context::sender(ctx));
        transfer::public_share_object(liquidpool);
    }

    entry fun swap_a_for_b<A, B>(
        pool: &mut LiquidPool<A, B>,
        input_coin: Coin<A>,
        min_output: u64,
        ctx: &mut TxContext
    ) {
        let input_value = balance::value(coin::balance(&input_coin));
        assert!(input_value > 0, EAMOUNT_ZERO);

        let new_reserve_a = pool.reserve_a + input_value;
        let new_reserve_b = pool.reserve_a * pool.reserve_b / new_reserve_a;

        // 计算输出的代币数
        let output_amount = pool.reserve_b - new_reserve_b;
        assert!(output_amount > min_output, EOUTPUT_NOT_ENOUGH);
        let output_coin = coin::split(&mut pool.coin_b, output_amount, ctx);

        // 更新流动性池库存
        pool.reserve_a = new_reserve_a;
        coin::join(&mut pool.coin_a, input_coin);
        pool.reserve_b = new_reserve_b;

        // 转移代币给发起调用者
        transfer::public_transfer(output_coin, tx_context::sender(ctx));
    }

    entry fun swap_b_for_a<A, B>(
        pool: &mut LiquidPool<A, B>,
        input_coin: Coin<B>,
        min_output: u64,
        ctx: &mut TxContext
    ) {
        let input_value = balance::value(coin::balance(&input_coin));
        assert!(input_value > 0, EAMOUNT_ZERO);

        let new_reserve_b = pool.reserve_b + input_value;
        let new_reserve_a = pool.reserve_a * pool.reserve_b / new_reserve_b;

        // 计算输出的代币数
        let output_amount = pool.reserve_a - new_reserve_a;
        assert!(output_amount > min_output, EOUTPUT_NOT_ENOUGH);
        let output_coin = coin::split(&mut pool.coin_a, output_amount, ctx);

        // 更新流动性池库存
        pool.reserve_a = new_reserve_a;
        coin::join(&mut pool.coin_b, input_coin);
        pool.reserve_b = new_reserve_b;

        // 转移代币给发起调用者
        transfer::public_transfer(output_coin, tx_context::sender(ctx));
    }

    public entry fun add_liquidity<A, B>(
        pool: &mut LiquidPool<A, B>,
        mut coin_a: Coin<A>,
        mut coin_b: Coin<B>,
        ctx: &mut TxContext
    ) {
        let new_a_amount = balance::value(coin::balance(&coin_a));
        let new_b_amount = balance::value(coin::balance(&coin_b));
        let rate_a = new_a_amount * PRECISION_FACTOR / pool.reserve_a;
        let rate_b = new_b_amount * PRECISION_FACTOR / pool.reserve_a;

        // 计算新增流动性
        let share = min(rate_a, rate_b);
        let new_liquidity = share * pool.liquidity / PRECISION_FACTOR;
        // 创建流动性代币并转移给调用者
        let liquidity_token = LiquidityToken<A, B> {
            id: object::new(ctx),
            amount: new_liquidity,
        };
        transfer::public_transfer(liquidity_token, tx_context::sender(ctx));

        // 计算多余的,影响比例的,代币
        // 并将多余的返回给调用者
        if (rate_a > rate_b) {
            let redundant_a_amount = new_a_amount - rate_b * pool.reserve_a / PRECISION_FACTOR;
            let redundant_a = coin::split(&mut coin_a, redundant_a_amount, ctx);
            transfer::public_transfer(redundant_a, tx_context::sender(ctx));
        }else if (rate_b > rate_a) {
            let redundant_b_amount = new_b_amount - rate_a * pool.reserve_b / PRECISION_FACTOR;
            let redundant_b = coin::split(&mut coin_b, redundant_b_amount, ctx);
            transfer::public_transfer(redundant_b, tx_context::sender(ctx));
        };

        // 更新流动性池
        pool.liquidity = new_liquidity + pool.liquidity;
        coin::join(&mut pool.coin_a, coin_a);
        coin::join(&mut pool.coin_b, coin_b);
        pool.reserve_a = pool.reserve_a + new_a_amount;
        pool.reserve_b = pool.reserve_b + new_b_amount;
    }

    public entry fun remove_liquidity<A, B>(
        pool: &mut LiquidPool<A, B>,
        liquidity_token: LiquidityToken<A, B>,
        ctx: &mut TxContext
    ) {
        let LiquidityToken<A, B> { id, amount } = liquidity_token;
        object::delete(id);

        // 计算提供的流动性占当前的流动性的比例
        let liquidity_rate = amount * PRECISION_FACTOR / pool.liquidity;

        // 计算可以提取的代币数量
        let remove_a_amount = pool.reserve_a * liquidity_rate / PRECISION_FACTOR;
        let remove_b_amount = pool.reserve_b * liquidity_rate / PRECISION_FACTOR;

        // 更新流动性池
        let remove_a = coin::split(&mut pool.coin_a, remove_a_amount, ctx);
        let remove_b = coin::split(&mut pool.coin_b, remove_b_amount, ctx);
        pool.reserve_a = pool.reserve_a - remove_a_amount;
        pool.reserve_b = pool.reserve_b - remove_b_amount;
        pool.liquidity = pool.liquidity - amount;

        transfer::public_transfer(remove_a, tx_context::sender(ctx));
        transfer::public_transfer(remove_b, tx_context::sender(ctx));
    }
}
