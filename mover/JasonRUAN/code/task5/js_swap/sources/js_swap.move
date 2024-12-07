module js_swap::js_swap {
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};

    /// 提供数量不可为0
    const EZeroAmount: u64 = 0;

    /// 池子费率值设置错误。允许范围为：[0-10000)，表示费率为：0-100%
    const EWrongFee: u64 = 1;

    /// 池子已空，无法交换
    const EReservesEmpty: u64 = 2;

    /// 池子已满，单边达到MAX_POOL_VALUE
    const EPoolFull: u64 = 4;

    /// 费用计算基准值，表示100%
    const FEE_SCALING: u128 = 10000;

    /// 池子单边最大余额
    /// U64 MAX / FEE_SCALING
    const MAX_POOL_VALUE: u64 = {
        18446744073709551615 / 10000
    };

    /// The Pool token that will be used to mark the pool share
    /// of a liquidity provider. The first type parameter stands
    /// for the witness type of a pool. The seconds is for the
    /// coin held in the pool.
    public struct LSP<phantom P, phantom TokenA, phantom TokenB> has drop {}

    /// The pool with exchange.
    ///
    /// - `fee_percent` should be in the range: [0-10000), meaning
    /// that 10000 is 100% and 10 is 0.1%
    public struct Pool<phantom P, phantom TokenA, phantom TokenB> has key {
        id: UID,
        coinA: Balance<TokenA>,
        coinB: Balance<TokenB>,
        lsp_supply: Supply<LSP<P, TokenA, TokenB>>,
        /// Fee Percent is denominated in basis points.
        fee_percent: u64
    }

    #[allow(unused_function)]
    /// Module initializer is empty - to publish a new Pool one has
    /// to create a type which will mark LSPs.
    fun init(_: &mut TxContext) {}

    /// Create new `Pool` for token `TokenA` and `TokenB`.
    /// Each Pool holds a `Coin<TokenA>` and a `Coin<TokenB>`.
    /// Swaps are available in both directions.
    ///
    /// Share is calculated based on Uniswap's constant product formula:
    ///  liquidity = sqrt( X * Y )
    public fun create_pool<P: drop, TokenA, TokenB>(
        _: P,
        coinA: Coin<TokenA>,
        coinB: Coin<TokenB>,
        fee_percent: u64,
        ctx: &mut TxContext
    ): Coin<LSP<P, TokenA, TokenB>> {
        let token_a_amt = coinA.value();
        let token_b_amt = coinB.value();

        assert!(token_a_amt > 0 && token_b_amt > 0, EZeroAmount);
        assert!(token_a_amt < MAX_POOL_VALUE && token_b_amt < MAX_POOL_VALUE, EPoolFull);
        assert!(fee_percent >= 0 && fee_percent < 10000, EWrongFee);

        // Initial share of LSP is the sqrt(a) * sqrt(b)
        let share = std::u64::sqrt(token_a_amt) * std::u64::sqrt(token_b_amt);
        let mut lsp_supply = balance::create_supply(LSP<P, TokenA, TokenB> {});
        let lsp = balance::increase_supply(&mut lsp_supply, share);

        // 创建共享交易池对象，包含了组成池子的两种代币，其比例决定了初始价格
        // 例如：100 JSC + 200 JSFC，则说明：1 JSC = 2 JSFC
        transfer::share_object(Pool {
            id: object::new(ctx),
            coinA: coin::into_balance(coinA),
            coinB: coin::into_balance(coinB),
            lsp_supply,
            fee_percent
        });

        coin::from_balance(lsp, ctx)
    }

    // 使用精确数量的TokenA兑换TokenB
    entry fun swap_exact_a_for_b<P, TokenA, TokenB>(
        pool: &mut Pool<P, TokenA, TokenB>, coin_a_in: Coin<TokenA>, ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            swap_exact_a_for_b_(pool, coin_a_in, ctx),
            ctx.sender()
        )
    }

    public fun swap_exact_a_for_b_<P, TokenA, TokenB>(
        pool: &mut Pool<P, TokenA, TokenB>, coin_a_in: Coin<TokenA>, ctx: &mut TxContext
    ): Coin<TokenB> {
        assert!(coin_a_in.value() > 0, EZeroAmount);

        let coin_a_balance = coin::into_balance(coin_a_in);

        let (coin_a_reserve, coin_b_reserve, _) = get_amounts(pool);

        assert!(coin_a_reserve > 0 && coin_b_reserve > 0, EReservesEmpty);

        let output_amount = get_input_price(
            balance::value(&coin_a_balance),
            coin_a_reserve,
            coin_b_reserve,
            pool.fee_percent
        );

        balance::join(&mut pool.coinA, coin_a_balance);
        coin::take(&mut pool.coinB, output_amount, ctx)
    }

    // 使用精确数量的TokenB兑换TokenA
    entry fun swap_exact_b_for_a<P, TokenA, TokenB>(
        pool: &mut Pool<P, TokenA, TokenB>, coin_b_out: Coin<TokenB>, ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            swap_exact_b_for_a_(pool, coin_b_out, ctx),
            tx_context::sender(ctx)
        )
    }

    public fun swap_exact_b_for_a_<P, TokenA, TokenB>(
        pool: &mut Pool<P, TokenA, TokenB>, coin_b_out: Coin<TokenB>, ctx: &mut TxContext
    ): Coin<TokenA> {
        assert!(coin_b_out.value() > 0, EZeroAmount);

        let coin_b_balance = coin::into_balance(coin_b_out);
        let (coin_a_reserve, coin_b_reserve, _) = get_amounts(pool);

        assert!(coin_a_reserve > 0 && coin_b_reserve > 0, EReservesEmpty);

        let output_amount = get_input_price(
            balance::value(&coin_b_balance),
            coin_b_reserve,
            coin_a_reserve,
            pool.fee_percent
        );

        balance::join(&mut pool.coinB, coin_b_balance);
        coin::take(&mut pool.coinA, output_amount, ctx)
    }

    /// Entrypoint for the `add_liquidity` method. Sends `Coin<LSP>` to
    /// the transaction sender.
    entry fun add_liquidity<P, TokenA, TokenB>(
        pool: &mut Pool<P, TokenA, TokenB>, coin_a: Coin<TokenA>, coin_b: Coin<TokenB>, ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            add_liquidity_(pool, coin_a, coin_b, ctx),
            tx_context::sender(ctx)
        );
    }

    /// Add liquidity to the `Pool`. Sender needs to provide both
    /// `Coin<TokenA>` and `Coin<TokenB>`, and in exchange he gets `Coin<LSP>` -
    /// liquidity provider tokens.
    public fun add_liquidity_<P, TokenA, TokenB>(
        pool: &mut Pool<P, TokenA, TokenB>, coin_a: Coin<TokenA>, coin_b: Coin<TokenB>, ctx: &mut TxContext
    ): Coin<LSP<P, TokenA, TokenB>> {
        assert!(coin_a.value() > 0 && coin_b.value() > 0, EZeroAmount);

        let coin_a_balance = coin::into_balance(coin_a);
        let coin_b_balance = coin::into_balance(coin_b);

        let (coin_a_amount, coin_b_amount, lsp_supply) = get_amounts(pool);

        let coin_a_added = balance::value(&coin_a_balance);
        let coin_b_added = balance::value(&coin_b_balance);

        // 取最小值是为了维持价格稳定性和防止价格操纵
        // 用户获得的LP数量与其贡献的资产价值成正比
        // 原有LP持有者的份额没有被稀释
        // 任何时候都可以按比例赎回对应的资产
        // 新LP数量 = 用户添加的代币数量 * 当前LP总供应量 / 池子中该代币储备量
        // 新LP数量 = 用户添加的代币数量 * 每个代币代表多少LP
        let amount_lp_value = std::u64::min(
            (coin_a_added * lsp_supply) / coin_a_amount,
            (coin_b_added * lsp_supply) / coin_b_amount
        );

        // 省略多余资产退回操作

        let token_a_amt = balance::join(&mut pool.coinA, coin_a_balance);
        let token_b_amt = balance::join(&mut pool.coinB, coin_b_balance);

        assert!(token_a_amt < MAX_POOL_VALUE, EPoolFull);
        assert!(token_b_amt < MAX_POOL_VALUE, EPoolFull);

        let balance = balance::increase_supply(&mut pool.lsp_supply, amount_lp_value);
        coin::from_balance(balance, ctx)
    }

    /// Entrypoint for the `remove_liquidity` method. Transfers
    /// withdrawn assets to the sender.
    entry fun remove_liquidity<P, TokenA, TokenB>(
        pool: &mut Pool<P, TokenA, TokenB>,
        lsp: Coin<LSP<P, TokenA, TokenB>>,
        ctx: &mut TxContext
    ) {
        let (coin_a, coin_b) = remove_liquidity_(pool, lsp, ctx);
        let sender = ctx.sender();

        transfer::public_transfer(coin_a, sender);
        transfer::public_transfer(coin_b, sender);
    }

    /// Remove liquidity from the `Pool` by burning `Coin<LSP>`.
    public fun remove_liquidity_<P, TokenA, TokenB>(
        pool: &mut Pool<P, TokenA, TokenB>,
        lsp: Coin<LSP<P, TokenA, TokenB>>,
        ctx: &mut TxContext
    ): (Coin<TokenA>, Coin<TokenB>) {
        let lsp_amount = coin::value(&lsp);

        // If there's a non-empty LSP, we can
        assert!(lsp_amount > 0, EZeroAmount);

        let (token_a_amt, token_b_amt, lsp_supply) = get_amounts(pool);

        // 按是有LP的比例赎回对应的资产
        let token_a_removed = (token_a_amt * lsp_amount) / lsp_supply;
        let token_b_removed = (token_b_amt * lsp_amount) / lsp_supply;

        balance::decrease_supply(&mut pool.lsp_supply, coin::into_balance(lsp));

        (
            coin::take(&mut pool.coinA, token_a_removed, ctx),
            coin::take(&mut pool.coinB, token_b_removed, ctx)
        )
    }

    public fun coin_a_price<P, TokenA, TokenB>(pool: &Pool<P, TokenA, TokenB>, to_sell: u64): u64 {
        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        get_input_price(to_sell, token_b_amt, token_a_amt, pool.fee_percent)
    }

    public fun coin_b_price<P, TokenA, TokenB>(pool: &Pool<P, TokenA, TokenB>, to_sell: u64): u64 {
        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        get_input_price(to_sell, token_a_amt, token_b_amt, pool.fee_percent)
    }

    public fun get_amounts<P, TokenA, TokenB>(pool: &Pool<P, TokenA, TokenB>): (u64, u64, u64) {
        (
            balance::value(&pool.coinA),
            balance::value(&pool.coinB),
            balance::supply_value(&pool.lsp_supply)
        )
    }

    /// Calculate the output amount minus the fee - 0.3%
    // 举例：`100 JSC`可兑换`181 JSFC`
    //
    // 1. 输入参数:
    // - input_amount = 100 (JSC)
    // - input_reserve = 1000 (JSC)
    // - output_reserve = 2000 (JSFC)
    // - fee_percent = 30 (0.3%)
    // - FEE_SCALING = 10000

    // 2. 计算步骤:
    // a) input_amount_with_fee = 100 * (10000 - 30)
    //    = 100 * 9970
    //    = 997000

    // b) numerator = 997000 * 2000
    //    = 1,994,000,000

    // c) denominator = (1000 * 10000) + 997000
    //    = 10,000,000 + 997,000
    //    = 10,997,000

    // d) 最终结果 = numerator / denominator
    //    = 1,994,000,000 / 10,997,000
    //    ≈ 181.32...
    public fun get_input_price(
        input_amount: u64, input_reserve: u64, output_reserve: u64, fee_percent: u64
    ): u64 {
        // up casts
        let (
            input_amount,
            input_reserve,
            output_reserve,
            fee_percent
        ) = (
            (input_amount as u128),
            (input_reserve as u128),
            (output_reserve as u128),
            (fee_percent as u128)
        );

        let input_amount_with_fee = input_amount * (FEE_SCALING - fee_percent);
        let numerator = input_amount_with_fee * output_reserve;
        let denominator = (input_reserve * FEE_SCALING) + input_amount_with_fee;

        (numerator / denominator as u64)
    }

    #[test_only]
    public fun init_for_testing(ctx: &mut TxContext) {
        init(ctx)
    }
}
