// Module: zhaoxilingcheng_swap
module zhaoxilingcheng_swap::zhaoxilingcheng_swap {
    use sui::object::{Self, UID};
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};
    use sui::transfer;
    use sui::math;
    use sui::tx_context::{Self, TxContext};

    // 当提供的代币数量为零时的错误代码
    const EZeroAmount: u64 = 0;

    // 当有人试图在空池中进行交换时的错误代码
    const EReservesEmpty: u64 = 2;

    // 当有人试图添加超过 u128 数学允许的流动性时的错误代码
    const EPoolFull: u64 = 4;

    // 用于计算费用的整数缩放设置
    const FEE_SCALING: u128 = 10000;

    // 交换时收取的费用百分比，设置为 0.3%
    const FEE_PERCENT: u128 = 30;

    // 流动池中一个余额可以持有的最大值，U64 MAX / FEE_SCALING
    const MAX_POOL_VALUE: u64 = {
        18446744073709551615 / 10000
    };

    // 用于标记流动性提供者的池份额的 Pool 代币
    // 第一个类型参数表示池的见证类型
    // 第二和第三个参数表示池中持有的代币
    public struct LSP<phantom TA, phantom TB> has drop {}

    // 交换池结构体
    // fee_percent 应在范围 [0-10000) 内，表示 10000 是 100%，1 是 0.01%
    public struct Pool<phantom TA, phantom TB> has key {
        id: UID,  // 池的唯一标识
        token_a: Balance<TA>,  // 代币 A 的余额
        token_b: Balance<TB>,  // 代币 B 的余额
        lsp_supply: Supply<LSP<TA, TB>>,  // LSP 供应量
        fee_percent: u64  // 费用百分比，以基点表示
    }

    /// =======================================================================
    /// ============================= 初始化函数 ===============================
    /// =======================================================================

    // 模块初始化函数 - 要发布一个新的池，必须创建一个标记 LSP 的类型
    fun init(_: &mut TxContext) {
    }

    /// =======================================================================
    /// ============================= 流动性池 =================================
    /// =======================================================================

    // 创建流动池的入口函数
    entry fun create_pool<TA, TB> (
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            create_pool_inner(token_a, token_b, ctx),
            tx_context::sender(ctx)
        );
    }

    // 创建流动池的内部函数
    fun create_pool_inner<TA, TB> (
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ): Coin<LSP<TA, TB>> {
        let fee_percent = (FEE_PERCENT as u64);

        let token_a_amt = coin::value(&token_a);  // 获取代币 A 的数量
        let token_b_amt = coin::value(&token_b);  // 获取代币 B 的数量

        assert!(token_a_amt > 0 && token_b_amt > 0, EZeroAmount);  // 确保代币数量大于 0
        assert!(token_a_amt < MAX_POOL_VALUE && token_b_amt < MAX_POOL_VALUE, EPoolFull);  // 确保代币数量小于最大值

        let share = math::sqrt(token_a_amt) * math::sqrt(token_b_amt);  // 计算池的初始份额
        let mut lsp_supply = balance::create_supply(LSP<TA, TB> {});  // 创建 LSP 供应
        let lsp = balance::increase_supply(&mut lsp_supply, share);  // 增加 LSP 供应

        transfer::share_object(Pool {
            id: object::new(ctx),  // 创建新的池对象
            token_a: coin::into_balance(token_a),  // 将代币 A 转换为余额
            token_b: coin::into_balance(token_b),  // 将代币 B 转换为余额
            lsp_supply,  // LSP 供应
            fee_percent,  // 费用百分比
        });

        coin::from_balance(lsp, ctx)  // 从余额中生成代币
    }

    // 添加流动性的入口函数
    entry fun add_liquidity<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            add_liquidity_inner(pool, token_a, token_b, ctx),
            tx_context::sender(ctx)
        )
    }

    // 添加流动性的内部函数
    fun add_liquidity_inner<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ): Coin<LSP<TA, TB>> {
        assert!(coin::value(&token_a) > 0 && coin::value(&token_b) > 0, EZeroAmount);  // 确保代币数量大于 0

        let (token_a_amt, token_b_amt, lsp_supply) = get_amounts(pool);  // 获取池中代币和 LSP 供应量
        assert!(token_a_amt > 0 && token_b_amt > 0, EReservesEmpty);  // 确保池中有足够的代币

        let token_a_balance = coin::into_balance(token_a);  // 将代币 A 转换为余额
        let token_b_balance = coin::into_balance(token_b);  // 将代币 B 转换为余额

        let token_a_added = balance::value(&token_a_balance);  // 获取新增的代币 A 数量
        let token_b_added = balance::value(&token_b_balance);  // 获取新增的代币 B 数量

        // XXX - 可以对新增的流动性进行计算，查看比值是否和原来的比值一致
        // assert!(token_a_added * token_b_amt == token_b_added * token_a_amt, EWrongFee);
        // assert!(math::abs_diff(token_a_added * token_b_amt, token_b_added * token_a_amt) < 100, EWrongFee);

        // 计算新铸造的份额数量
        let share_minted = math::min(
            (token_a_added * lsp_supply) / token_a_amt,
            (token_b_added * lsp_supply) / token_b_amt
        );

        let token_a_amt = balance::join(&mut pool.token_a, token_a_balance);  // 将代币 A 加入池中
        let token_b_amt = balance::join(&mut pool.token_b, token_b_balance);  // 将代币 B 加入池中

        assert!(token_a_amt < MAX_POOL_VALUE && token_b_amt < MAX_POOL_VALUE, EPoolFull);  // 确保代币数量小于最大值

        let balance = balance::increase_supply(&mut pool.lsp_supply, share_minted);  // 增加 LSP 供应

        coin::from_balance(balance, ctx)  // 从余额中生成代币
    }

    // 移除流动性的入口函数
    entry fun remove_liquidity<TA, TB> (
        pool: &mut Pool<TA, TB>,
        lsp: Coin<LSP<TA, TB>>,
        ctx: &mut TxContext
    ) {
        let (token_a, token_b) = remove_liquidity_inner(pool, lsp, ctx);
        let sender = tx_context::sender(ctx);

        transfer::public_transfer(token_a, sender);  // 转移代币 A 给发送者
        transfer::public_transfer(token_b, sender);  // 转移代币 B 给发送者
    }

    // 移除流动性的内部函数
    fun remove_liquidity_inner<TA, TB> (
        pool: &mut Pool<TA, TB>,
        lsp: Coin<LSP<TA, TB>>,
        ctx: &mut TxContext
    ): (Coin<TA>, Coin<TB>) {
        let lsp_amount = coin::value(&lsp);  // 获取 LSP 数量
        assert!(lsp_amount > 0, EZeroAmount);  // 确保 LSP 数量大于 0

        let (token_a_amt, token_b_amt, total_supply) = get_amounts(pool);  // 获取池中代币和 LSP 供应量

        // 计算移除的代币 A 和 B 数量
        let token_a = (token_a_amt * lsp_amount) / total_supply;
        let token_b = (token_b_amt * lsp_amount) / total_supply;

        balance::decrease_supply(&mut pool.lsp_supply, coin::into_balance(lsp));  // 减少 LSP 供应

        (
            coin::take(&mut pool.token_a, token_a, ctx),  // 从池中取出代币 A
            coin::take(&mut pool.token_b, token_b, ctx)   // 从池中取出代币 B
        )
    }

    /// =======================================================================
    /// ============================= 交易函数 =================================
    /// =======================================================================

    // 交换代币 A 为代币 B 的入口函数
    entry fun swap_a_to_b<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            swap_a_to_b_inner(pool, token_a, ctx),
            tx_context::sender(ctx)
        )
    }

    // 交换代币 A 为代币 B 的内部函数
    fun swap_a_to_b_inner<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        ctx: &mut TxContext
    ): Coin<TB> {
        let token_a_amt = coin::value(&token_a);  // 获取代币 A 数量
        assert!(token_a_amt > 0, EZeroAmount);  // 确保代币数量大于 0

        let (token_a_amt, token_b_amt, _) = get_amounts(pool);  // 获取池中代币数量
        assert!(token_a_amt > 0 && token_b_amt > 0, EReservesEmpty);  // 确保池中有足够的代币

        let token_b_amt = sell_token_a(pool, token_a_amt);  // 计算售出代币 A 得到的代币 B 数量

        balance::join(&mut pool.token_a, coin::into_balance(token_a));  // 将代币 A 加入池中

        coin::take(&mut pool.token_b, token_b_amt, ctx)  // 从池中取出代币 B
    }

    // 交换代币 B 为代币 A 的入口函数
    entry fun swap_b_to_a<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            swap_b_to_a_inner(pool, token_b, ctx),
            tx_context::sender(ctx)
        )
    }

    // 交换代币 B 为代币 A 的内部函数
    fun swap_b_to_a_inner<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ): Coin<TA> {
        let token_b_amt = coin::value(&token_b);  // 获取代币 B 数量
        assert!(token_b_amt > 0, EZeroAmount);  // 确保代币数量大于 0

        let (token_a_amt, token_b_amt, _) = get_amounts(pool);  // 获取池中代币数量
        assert!(token_a_amt > 0 && token_b_amt > 0, EReservesEmpty);  // 确保池中有足够的代币

        let token_a_amt = sell_token_b(pool, token_b_amt);  // 计算售出代币 B 得到的代币 A 数量

        balance::join(&mut pool.token_b, coin::into_balance(token_b));  // 将代币 B 加入池中

        coin::take(&mut pool.token_a, token_a_amt, ctx)  // 从池中取出代币 A
    }

    /// =======================================================================
    /// ============================= 辅助函数 =================================
    /// =======================================================================

    // 计算售出指定数量的 Token A，会得到多少数量的 Token B
    public fun sell_token_a<TA, TB>(pool: &Pool<TA, TB>, to_sell: u64): u64 {
        let (token_a_amt, token_b_amt, _) = get_amounts(pool);  // 获取池中代币数量
        calc_output_amount(
            to_sell,
            token_a_amt,
            token_b_amt,
            pool.fee_percent
        )
    }

    // 计算售出指定数量的 Token B，会得到多少数量的 Token A
    public fun sell_token_b<TA, TB>(pool: &Pool<TA, TB>, to_sell: u64): u64 {
        let (token_a_amt, token_b_amt, _) = get_amounts(pool);  // 获取池中代币数量
        calc_output_amount(
            to_sell,
            token_b_amt,
            token_a_amt,
            pool.fee_percent
        )
    }

    // 获取池中代币 A 和 B 的数量以及 LSP 的总供应量
    public fun get_amounts<TA, TB>(pool: &Pool<TA, TB>): (u64, u64, u64) {
        (
            balance::value(&pool.token_a),
            balance::value(&pool.token_b),
            balance::supply_value(&pool.lsp_supply),
        )
    }

    // 计算输出代币数量
    public fun calc_output_amount(
        input_amount: u64,
        input_reserve: u64,
        output_reserve: u64,
        fee_percent: u64
    ): u64 {
        let (
            input_amount,
            input_reserve,
            output_reserve,
            fee_percent
        ) = (
            (input_amount as u128),
            (input_reserve as u128),
            (output_reserve as u128),
            (fee_percent as u128),
        );

        // 计算手续费后的输入数量
        let input_with_fee = input_amount * FEE_SCALING / (FEE_SCALING - fee_percent);

        // 根据公式 (x + dx) * (y - dy) = k
        // 得到 dy = y - k / (x + dx)
        let total = input_reserve * output_reserve;
        let output_amount = output_reserve - total / (input_reserve + input_with_fee);

        (output_amount as u64)
    }
}
