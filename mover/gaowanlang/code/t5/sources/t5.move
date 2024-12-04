/// Module: t5
module t5::gaowanlang_swap {
    use sui::balance;
    use sui::balance::{Balance, Supply};
    use sui::coin;
    use sui::coin::Coin;
    use sui::math;
    use sui::object::{new as obj_new};
    use sui::transfer::{public_transfer, share_object};
    use sui::tx_context::sender;

    // 最大池子值,u64的最大值/10000
    const MAX_POOL_VALUE: u64 = {
        18446744073709551615 / 10000
    };

    //coin A或者coin B的value为0
    const EZeroAmount: u64 = 0;
    //大于池子的最大值MAX_POOL_VALUE
    const EPoolFull: u64 = 1;
    //判断池子是不是空的
    const EReservesEmpty: u64 = 2;


    /// 交换收取的费率.
    /// Set to 0.3%. 千3  30/10000
    /// 分子
    const FEE_PERCENT: u128 = 30;
    /// 分母
    const FEE_SCALING: u128 = 10000;

    ///liquidity share provider. 流动性提供者
    public struct LSP<phantom TA, phantom TB> has drop {}

    //流动性池子
    public struct Pool<phantom A, phantom B> has key {
        id: UID,
        coin_a: Balance<A>,
        coin_b: Balance<B>,
        //流动性提供者供应量
        lsp_supply: Supply<LSP<A, B>>,
        //费率百分比
        fee_percent: u64
    }

    fun init(_: &mut TxContext) {}

    //创建流动性池子,并将凭证转给用户,在这个例子中,a和b都全给池子,不找零
    public entry fun create_pool<A, B>(
        coin_a: Coin<A>,
        coin_b: Coin<B>,
        ctx: &mut TxContext,
    ) {
        public_transfer(
            createa_pool_inner(coin_a, coin_b, ctx),
            sender(ctx),
        );
    }

    //创建流动性池子
    fun createa_pool_inner<A, B>(
        coin_a: Coin<A>,
        coin_b: Coin<B>,
        ctx: &mut TxContext,
    ): Coin<LSP<A, B>> {
        let fee_percent = (FEE_PERCENT as u64);

        //从coin中解出balance
        let a_balance = coin::value(&coin_a);
        let b_balance = coin::value(&coin_b);
        //确保余额都大于0
        assert!(a_balance > 0 && b_balance > 0, EZeroAmount);
        //确保余额都小于最大值
        assert!(a_balance < MAX_POOL_VALUE && b_balance < MAX_POOL_VALUE, EPoolFull);

        // 计算两个数的平方根之积
        let share = math::sqrt(a_balance) * math::sqrt(b_balance);
        // 创建LSP供应
        let mut lsp_supply = balance::create_supply(LSP<A, B> {});
        // 增加LSP供应
        let lsp = balance::increase_supply(&mut lsp_supply, share);
        share_object(Pool<A, B> {
            id: obj_new(ctx),
            coin_a: coin::into_balance(coin_a),
            coin_b: coin::into_balance(coin_b),
            lsp_supply,
            fee_percent,
        });
        coin::from_balance(lsp, ctx)
    }

    //添加流动性,将凭证转给调用者
    public entry fun add_liquidity<A, B>(
        pool: &mut Pool<A, B>,
        coin_a: Coin<A>,
        coin_b: Coin<B>,
        ctx: &mut TxContext,
    ) {
        public_transfer(
            add_liquidity_inner(pool, coin_a, coin_b, ctx),
            sender(ctx),
        );
    }

    //添加流动性
    fun add_liquidity_inner<A, B>(
        pool: &mut Pool<A, B>,
        coin_a: Coin<A>,
        coin_b: Coin<B>,
        ctx: &mut TxContext,
    ): Coin<LSP<A, B>> {
        //两个币的余额必须大于0
        assert!(coin::value(&coin_a) > 0 && coin::value(&coin_b) > 0, EZeroAmount);

        let (pool_a_value, pool_b_value, lsp_supply) = get_amounts(pool);
        //判断池子是否为空
        assert!(pool_a_value > 0 && pool_b_value > 0, EReservesEmpty);

        //解构获取coin的balance
        let a_balance = coin::into_balance(coin_a);
        let b_balance = coin::into_balance(coin_b);
        //获取balance的value
        let a_value = balance::value(&a_balance);
        let b_value = balance::value(&b_balance);

        //获取LSP供应
        let share_minted = math::min(
            // 将要添加a的额度 * LSP供应 / 池子a的余额
            a_value * lsp_supply / pool_a_value,
            // 将要添加b的额度 * LSP供应 / 池子b的余额
            b_value * lsp_supply / pool_b_value,
        );
        //将coin加入池子
        let pool_a_balance = balance::join(&mut pool.coin_a, a_balance);
        let pool_b_balance = balance::join(&mut pool.coin_b, b_balance);
        assert!(pool_a_balance < MAX_POOL_VALUE && pool_b_balance < MAX_POOL_VALUE, EPoolFull);
        let balance = balance::increase_supply(&mut pool.lsp_supply, share_minted);
        coin::from_balance(balance, ctx)
    }

    //移除流动性
    public entry fun remove_liquidity<A, B>(
        pool: &mut Pool<A, B>,
        lsp: Coin<LSP<A, B>>,
        ctx: &mut TxContext,
    ) {
        //将lsp兑换成coin
        let (coin_a, coin_b) = remove_liquidity_inner(pool, lsp, ctx);
        public_transfer(coin_a, sender(ctx));
        public_transfer(coin_b, sender(ctx));
    }

    fun remove_liquidity_inner<A, B>(
        pool: &mut Pool<A, B>,
        lsp: Coin<LSP<A, B>>,
        ctx: &mut TxContext,
    ): (Coin<A>, Coin<B>) {
        let lsp_value = coin::value(&lsp);
        assert!(lsp_value > 0, EZeroAmount);
        let (pool_a_value, pool_b_value, lsp_supply) = get_amounts(pool);

        let a_value = pool_a_value * lsp_value / lsp_supply;
        let b_value = pool_b_value * lsp_value / lsp_supply;
        //移除LSP供应
        balance::decrease_supply(&mut pool.lsp_supply, coin::into_balance(lsp));
        (
            coin::take(&mut pool.coin_a, a_value, ctx),
            coin::take(&mut pool.coin_b, b_value, ctx),
        )
    }

    //交换a到b,并将b的凭证转给调用者
    public entry fun swap_a_to_b<A, B>(
        pool: &mut Pool<A, B>,
        coin_a: Coin<A>,
        ctx: &mut TxContext,
    ) {
        public_transfer(
            swap_a_to_b_inner(pool, coin_a, ctx),
            sender(ctx),
        );
    }

    //交换a到b
    fun swap_a_to_b_inner<A, B>(
        pool: &mut Pool<A, B>,
        coin_a: Coin<A>,
        ctx: &mut TxContext,
    ): Coin<B> {
        let a_value = coin::value(&coin_a);
        assert!(a_value > 0, EZeroAmount);

        let (pool_a_value, pool_b_value, _) = get_amounts(pool);
        assert!(pool_a_value > 0 && pool_b_value > 0, EReservesEmpty);

        //卖出a,返回b的数量
        let output_coin_b_value = sell_token_a(pool, a_value);
        //给池子的coin_a增加
        balance::join(&mut pool.coin_a, coin::into_balance(coin_a));
        //给池子的coin_b减少, 注意,take返回的是将要被加入到池子的coin
        coin::take(&mut pool.coin_b, output_coin_b_value, ctx)
    }

    //交换b到a,并将a的凭证转给调用者
    public entry fun swap_b_to_a<A, B>(
        pool: &mut Pool<A, B>,
        coin_b: Coin<B>,
        ctx: &mut TxContext,
    ) {
        public_transfer(
            swap_b_to_a_inner(pool, coin_b, ctx),
            sender(ctx)
        );
    }

    //交换b到a
    fun swap_b_to_a_inner<A, B>(
        pool: &mut Pool<A, B>,
        coin_b: Coin<B>,
        ctx: &mut TxContext,
    ): Coin<A> {
        let b_value = coin::value(&coin_b);
        assert!(b_value > 0, EZeroAmount);

        let (pool_a_value, pool_b_value, _) = get_amounts(pool);
        assert!(pool_a_value > 0 && pool_b_value > 0, EReservesEmpty);

        //卖出b,返回a的数量
        let output_coin_a_value = sell_token_b(pool, b_value);
        //给池子的coin_b增加
        balance::join(&mut pool.coin_b, coin::into_balance(coin_b));
        //给池子的coin_a减少, 注意,take中使用的split函数,返回的是被减去的coin
        coin::take(&mut pool.coin_a, output_coin_a_value, ctx)
    }


    ///******************************** 以下就是交易的算法核心 *******************************************

    /// 获取池子的各种余额
    public fun get_amounts<TA, TB>(pool: &Pool<TA, TB>): (u64, u64, u64) {
        (
            balance::value(&pool.coin_a),
            balance::value(&pool.coin_b),
            balance::supply_value(&pool.lsp_supply),
        )
    }

    /// 出售代币A    计算售出指定数量的 coin A，会得到多少数量的 coin B
    public fun sell_token_a<TA, TB>(pool: &Pool<TA, TB>, to_sell: u64): u64 {
        let (pool_a_value, pool_b_value, _) = get_amounts(pool);
        calc_output_amount(
            to_sell,
            pool_a_value,
            pool_b_value,
            pool.fee_percent
        )
    }

    /// 出售代币B    计算售出指定数量的 coin B，会得到多少数量的 coin A
    public fun sell_token_b<TA, TB>(pool: &Pool<TA, TB>, to_sell: u64): u64 {
        let (pool_a_value, pool_b_value, _) = get_amounts(pool);
        calc_output_amount(
            to_sell,
            //注意这里的顺序和上面是反的
            pool_b_value,
            pool_a_value,
            pool.fee_percent
        )
    }


    /// Calculate 通过输入金额,算出减去手续费的输出金额
    /// x, y 分别表示池中两个资产的数量
    /// k 表示常数，代表池中资产的总价值,在不考虑手续费的情况下,交易前后k值不变，使用 x * y = k,(****注意,这个公式是核心*****)
    /// 当交易发生时，池中资产的总价值应该保持不变
    /// dx, dy  分别表示池中两个资产的变化值
    /// (x + dx) * (y - dy) = k
    public fun calc_output_amount(
        input_amount: u64,
        input_reserve: u64,
        output_reserve: u64,
        fee_percent: u64
    ): u64 {
        let (
            input_amount,
            x,
            y,
            fee_percent
        ) = (
            (input_amount as u128),
            (input_reserve as u128),
            (output_reserve as u128),
            (fee_percent as u128),
        );
        // 计算手续费后的输入数量           输入数量 ✖️ (扣除手续费后的万分比) todo 这里和例子不一样
        let input_with_fee = input_amount * (FEE_SCALING - fee_percent) / FEE_SCALING ;
        // k = x * y
        let k = x * y;

        // 根据公式,交易后的池子表示为 (x + input_a) * (y - output_y) = k
        // 得到 dy = y - k / (x + dx)
        let output_amount = y - (k / (x + input_with_fee));
        (output_amount as u64)
    }
}
