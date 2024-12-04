module w626w::w626w {
    use sui::object::{Self, UID};
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};
    use sui::transfer;
    use sui::math;
    use sui::tx_context::{Self, TxContext};

    /// =======================================================================
    /// ============================= 数据结构 =================================
    /// =======================================================================

    /// For when supplied Coin is zero.
    const EZeroAmount: u64 = 0;

    /// For when pool fee is set incorrectly.
    /// Allowed values are: [0-10000).
    // const EWrongFee: u64 = 1;

    /// For when someone tries to swap in an empty pool.
    const EReservesEmpty: u64 = 2;

    /// For when someone attempts to add more liquidity than u128 Math allows.
    const EPoolFull: u64 = 4;

    /// The integer scaling setting for fees calculation.
    const FEE_SCALING: u128 = 10000;

    /// The fee percent that will be taken from the swap.
    /// Set to 0.3%.
    const FEE_PERCENT: u128 = 30;

    /// The max value that can be held in one of the Balances of
    /// a Pool. U64 MAX / FEE_SCALING
    const MAX_POOL_VALUE: u64 = {
        18446744073709551615 / 10000
    };

    /// The Pool token that will be used to mark the pool share
    /// of a liquidity provider.
    /// The first type parameter stands for the witness type of a pool.
    /// The seconds and thirds is for the coin held in the pool.
    public struct LSP<phantom TA, phantom TB> has drop {}

    /// The pool with exchange.
    ///
    /// - `fee_percent` should be in the range: [0-10000), meaning
    /// that 10000 is 100% and 1 is 0.01%
    public struct Pool<phantom TA, phantom TB> has key {
        id: UID,
        token_a: Balance<TA>,
        token_b: Balance<TB>,
        lsp_supply: Supply<LSP<TA, TB>>,
        /// Fee Percent is denominated in basis points.
        fee_percent: u64
    }


    /// =======================================================================
    /// ============================= 初始化函数 ===============================
    /// =======================================================================

    /// Module initializer is empty - to publish a new Pool one has
    /// to create a type which will mark LSPs.
    fun init(_: &mut TxContext) {
    }

    /// =======================================================================
    /// ============================= 流动性池 =================================
    /// =======================================================================

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

    fun create_pool_inner<TA, TB> (
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ): Coin<LSP<TA, TB>> {
        let fee_percent = (FEE_PERCENT as u64);

        let token_a_amt = coin::value(&token_a);
        let token_b_amt = coin::value(&token_b);

        assert!(token_a_amt > 0 && token_b_amt > 0, EZeroAmount);
        assert!(token_a_amt < MAX_POOL_VALUE && token_b_amt < MAX_POOL_VALUE, EPoolFull);

        let share = math::sqrt(token_a_amt) * math::sqrt(token_b_amt);
        let mut lsp_supply = balance::create_supply(LSP<TA, TB> {});
        let lsp = balance::increase_supply(&mut lsp_supply, share);

        transfer::share_object(Pool {
            id: object::new(ctx),
            token_a: coin::into_balance(token_a),
            token_b: coin::into_balance(token_b),
            lsp_supply,
            fee_percent,
        });

        coin::from_balance(lsp, ctx)
    }

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

    fun add_liquidity_inner<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ): Coin<LSP<TA, TB>> {
        assert!(coin::value(&token_a) > 0 && coin::value(&token_b) > 0, EZeroAmount);

        let (token_a_amt, token_b_amt, lsp_supply) = get_amounts(pool);
        assert!(token_a_amt > 0 && token_b_amt > 0, EReservesEmpty);

        let token_a_balance = coin::into_balance(token_a);
        let token_b_balance = coin::into_balance(token_b);

        let token_a_added = balance::value(&token_a_balance);
        let token_b_added = balance::value(&token_b_balance);

        // XXX - 可以对新增的流动性进行计算，查看比值是否和原来的比值一致
        // assert!(token_a_added * token_b_amt == token_b_added * token_a_amt, EWrongFee);
        // assert!(math::abs_diff(token_a_added * token_b_amt, token_b_added * token_a_amt) < 100, EWrongFee);

        let share_minted = math::min(
            (token_a_added * lsp_supply) / token_a_amt,
            (token_b_added * lsp_supply) / token_b_amt
        );

        let token_a_amt = balance::join(&mut pool.token_a, token_a_balance);
        let token_b_amt = balance::join(&mut pool.token_b, token_b_balance);

        assert!(token_a_amt < MAX_POOL_VALUE && token_b_amt < MAX_POOL_VALUE, EPoolFull);

        let balance = balance::increase_supply(&mut pool.lsp_supply, share_minted);

        coin::from_balance(balance, ctx)
    }

    entry fun remove_liquidity<TA, TB> (
        pool: &mut Pool<TA, TB>,
        lsp: Coin<LSP<TA, TB>>,
        ctx: &mut TxContext
    ) {
        let (token_a, token_b) = remove_liquidity_inner(pool, lsp, ctx);
        let sender = tx_context::sender(ctx);

        transfer::public_transfer(token_a, sender);
        transfer::public_transfer(token_b, sender);
    }

    fun remove_liquidity_inner<TA, TB> (
        pool: &mut Pool<TA, TB>,
        lsp: Coin<LSP<TA, TB>>,
        ctx: &mut TxContext
    ): (Coin<TA>, Coin<TB>) {
        let lsp_amount = coin::value(&lsp);
        assert!(lsp_amount > 0, EZeroAmount);

        let (token_a_amt, token_b_amt, total_supply) = get_amounts(pool);

        let token_a = (token_a_amt * lsp_amount) / total_supply;
        let token_b = (token_b_amt * lsp_amount) / total_supply;

        balance::decrease_supply(&mut pool.lsp_supply, coin::into_balance(lsp));

        (
            coin::take(&mut pool.token_a, token_a, ctx),
            coin::take(&mut pool.token_b, token_b, ctx),
        )
    }

    /// =======================================================================
    /// ============================= 交易函数 =================================
    /// =======================================================================

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

    fun swap_a_to_b_inner<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        ctx: &mut TxContext
    ): Coin<TB> {
        let token_a_amt = coin::value(&token_a);
        assert!(token_a_amt > 0, EZeroAmount);

        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        assert!(token_a_amt > 0 && token_b_amt > 0, EReservesEmpty);

        let token_b_amt = sell_token_a(pool, token_a_amt);

        balance::join(&mut pool.token_a, coin::into_balance(token_a));

        coin::take(&mut pool.token_b, token_b_amt, ctx)
    }

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

    fun swap_b_to_a_inner<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ): Coin<TA> {
        let token_b_amt = coin::value(&token_b);
        assert!(token_b_amt > 0, EZeroAmount);

        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        assert!(token_a_amt > 0 && token_b_amt > 0, EReservesEmpty);

        let token_a_amt = sell_token_b(pool, token_b_amt);

        balance::join(&mut pool.token_b, coin::into_balance(token_b));

        coin::take(&mut pool.token_a, token_a_amt, ctx)
    }

    /// =======================================================================
    /// ============================= 辅助函数 =================================
    /// =======================================================================

    /// 计算售出指定数量的 Token A，会得到多少数量的 Token B
    public fun sell_token_a<TA, TB>(pool: &Pool<TA, TB>, to_sell: u64): u64 {
        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        calc_output_amount(
            to_sell,
            token_a_amt,
            token_b_amt,
            pool.fee_percent
        )
    }

    /// 计算售出指定数量的 Token B，会得到多少数量的 Token A
    public fun sell_token_b<TA, TB>(pool: &Pool<TA, TB>, to_sell: u64): u64 {
        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        calc_output_amount(
            to_sell,
            token_b_amt,
            token_a_amt,
            pool.fee_percent
        )
    }

    /// Get most used values in a handy way:
    /// - amount of token a
    /// - amount of token b
    /// - total supply of LSP
    public fun get_amounts<TA, TB>(pool: &Pool<TA, TB>): (u64, u64, u64) {
        (
            balance::value(&pool.token_a),
            balance::value(&pool.token_b),
            balance::supply_value(&pool.lsp_supply),
        )
    }

    /// Calculate the output amount minus the fee
    /// x, y 分别表示池中两个资产的数量
    /// k 表示常数，代表池中资产的总价值，使用 x * y = k
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

//packageID  0xd6f4b1d25a401c678fcccdb72680866abc45f1c737c48e3bad2a08f83b8a0317
//coin_a: 0xa7edc406153123af11055029fc6f141138b413df1d191885607bd154ab7178e4
//coin_b: 0xa5f37c9ecf31f9593fa8397048edaee926b697a50dd889ad933b239d07d0436a
// sui client call --gas-budget 7500000 --package 0xd263908049bf7211f9719481f5bf99d7f83eed8f7dedd44521a2fdfb2cec7a56 --module coin_a --function mint --args 0xefe1aedb2ea684cfd97288a7ce14e8a69ecce087cc9a6cb0c2b2b990dd368f71 1000 0x8dc5827a93398f03913f4df834907aa38a8397b31398f63682f44de1fab90d0f
// sui client call --gas-budget 7500000 --package 0xd263908049bf7211f9719481f5bf99d7f83eed8f7dedd44521a2fdfb2cec7a56 --module coin_b --function mint --args 0x7a2ea83861c92447904aecff6a2687bde71c20866e4df34f4adbf7b31562a9c4 10000 0x8dc5827a93398f03913f4df834907aa38a8397b31398f63682f44de1fab90d0f
//coinA1:0x6a889f68bcc4ef956308f0f7173b6118868f38018202565c5d84814311e1a78d     type: 0xa7edc406153123af11055029fc6f141138b413df1d191885607bd154ab7178e4::mycoin::MYCOIN 0xc26cfb83c268b0ddc956ac5dbcc6471fba7b6ae1463b6f31e670b8ad1c3b79ea::faucetcoin::FAUCETCOIN
//coinB10:0xf6b8fccd5d24f299e508443c31b094ed8f6df54fcca2e3c560d04e0b60b7d70d    type: 0xc26cfb83c268b0ddc956ac5dbcc6471fba7b6ae1463b6f31e670b8ad1c3b79ea::faucetcoin::FAUCETCOIN
// coinA1:0x61d29c2b20ae6bc46a7ec18f7b00362cf22c239ea8b059ebe89c4935231eb281
//增加流动性：sui client call --gas-budget 7500000 --package 0xd6f4b1d25a401c678fcccdb72680866abc45f1c737c48e3bad2a08f83b8a0317 --module vklo1 --function create_pool --type-args 0x6933a19cea6793b3b8fdc7e574922d3fa6d068af5bdbb2f4b9c8882fee6e1619::mycoin::MYCOIN 0xc26cfb83c268b0ddc956ac5dbcc6471fba7b6ae1463b6f31e670b8ad1c3b79ea::faucetcoin::FAUCETCOIN  --args 0x6a889f68bcc4ef956308f0f7173b6118868f38018202565c5d84814311e1a78d 0xf6b8fccd5d24f299e508443c31b094ed8f6df54fcca2e3c560d04e0b60b7d70d 
// lp:0xd9651e9bf18f71888742036bbd96ba4516244b63cb3d8a44a33b9ec95f0250d1
// swap  sui client call --gas-budget 7500000 --package 0xd6f4b1d25a401c678fcccdb72680866abc45f1c737c48e3bad2a08f83b8a0317 --module vklo1 --function swap_a_to_b --type-args 0x6933a19cea6793b3b8fdc7e574922d3fa6d068af5bdbb2f4b9c8882fee6e1619::mycoin::MYCOIN 0xc26cfb83c268b0ddc956ac5dbcc6471fba7b6ae1463b6f31e670b8ad1c3b79ea::faucetcoin::FAUCETCOIN --args 0xd9651e9bf18f71888742036bbd96ba4516244b63cb3d8a44a33b9ec95f0250d1 0x61d29c2b20ae6bc46a7ec18f7b00362cf22c239ea8b059ebe89c4935231eb281

