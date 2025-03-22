module ydamw22::ydamw22 {
    use std::u64;
    use sui::balance::{Self, Balance, Supply};
    use sui::coin::{Self, Coin};
    use sui::transfer::{share_object, public_transfer};

    const EInvalidInputForPoolToken: u64 = 0; // 非法输入

    public struct Pool<phantom A, phantom B> has key {
        id: UID,
        token_a: Balance<A>,
        token_b: Balance<B>,
        lp: Supply<LP<A, B>>,
    }

    public struct LP<phantom A, phantom B> has drop {}

    // 创建池子
    public entry fun create_pool<A, B> (ctx: &mut TxContext) {
        let lp = balance::create_supply(LP<A, B>{});
        let pool = Pool<A, B> {
            id: object::new(ctx),
            token_a: balance::zero(),
            token_b: balance::zero(),
            lp,
        };
        share_object(pool);
    }

    // 存
    public entry fun add_liquidity<A, B> (
        pool: &mut Pool<A, B>,
        in_token_a: Coin<A>,
        in_token_b: Coin<B>,
        ctx: &mut TxContext,
    ) {
        // 原池ab数量
        let pool_a_value = pool.token_a.value();
        let pool_b_value = pool.token_b.value();
        // 传入ab数量
        let in_value_a = in_token_a.value();
        let in_value_b = in_token_b.value();

        if (pool_a_value != 0 && pool_a_value != 0) {
            assert!( pool_a_value / pool_b_value == in_value_a / in_value_b, EInvalidInputForPoolToken);
        };

        // 加入池
        pool.token_a.join(coin::into_balance(in_token_a));
        pool.token_b.join(coin::into_balance(in_token_b));

        // lp凭证
        let lp_sqrt_price = u64::sqrt(in_value_a * in_value_b);
        let lp = pool.lp.increase_supply(lp_sqrt_price);

        public_transfer(coin::from_balance(lp, ctx), ctx.sender());
    }

    // 交换
    public entry fun swap_a_to_b<A, B> (
        pool: &mut Pool<A, B>,
        pay_a: Coin<A>,
        ctx: &mut TxContext
    ) {
        // 原池ab数量
        let pool_a_value = pool.token_a.value();
        let pool_b_value = pool.token_b.value();
        // 恒定乘积
        let const_k = pool_a_value * pool_b_value;
        // 传入的A的数量
        let pay_a_value = pay_a.value();
        // 最终的a
        let total_a = pay_a_value + pool_a_value;
        // 最终的b 减少
        let total_b = const_k / total_a;
        // b差额，即交换后得到的b，池减少b
        let recive_b_amount = pool_b_value - total_b;
        // A 加入池
        pool.token_a.join(coin::into_balance(pay_a));

        let recive_b_balance = pool.token_b.split(recive_b_amount);
        public_transfer(coin::from_balance(recive_b_balance, ctx), ctx.sender());
    }
    public entry fun swap_b_to_a<A, B> (
        pool: &mut Pool<A, B>,
        pay_b: Coin<B>,
        ctx: &mut TxContext
    ) {
        // 原池ab数量
        let pool_a_value = pool.token_a.value();
        let pool_b_value = pool.token_b.value();
        // 恒定乘积
        let const_k = pool_a_value * pool_b_value;
        // 传入的B的数量
        let pay_b_value = pay_b.value();
        // 最终的b
        let total_b = pay_b_value + pool_b_value;
        // 最终的a 减少
        let total_a = const_k / total_b;
        // a差额，即交换后得到的b，池减少b
        let recive_a_amount = pool_a_value - total_a;
        // b加入池
        pool.token_b.join(coin::into_balance(pay_b));

        let recive_a_balance = pool.token_a.split(recive_a_amount);
        public_transfer(coin::from_balance(recive_a_balance, ctx), ctx.sender());
    }

    // 取
    public entry fun remove_liquidity<A, B> (
        pool: &mut Pool<A,B>,
        lp: Coin<LP<A, B>>,
        ctx: &mut TxContext,
    ) {
        // 获取sqrt_price
        let lp_value = lp.value();
        // 获取token_a数量、token_b数量、当前总供应量
        let pool_a_value = pool.token_a.value();
        let pool_b_value = pool.token_b.value();
        let total_supply = pool.lp.supply_value();

        // 取出AB
        let token_a = (pool_a_value * lp_value) / total_supply;
        let token_b = (pool_b_value * lp_value) / total_supply;
        // 减少流动性
        pool.lp.decrease_supply(coin::into_balance(lp));

        // take方法，Take a `Coin` worth of `value` from `Balance`.
        let coin_a= coin::take(&mut pool.token_a, token_a, ctx);
        let coin_b= coin::take(&mut pool.token_b, token_b, ctx);

        // 还给用户
        public_transfer(coin_a, ctx.sender());
        public_transfer(coin_b, ctx.sender());
    }
}
