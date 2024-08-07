module task5::jianhawang_swap {
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};
    use sui::math;

    const EZeroAmount: u64 = 0;

    const EReservesEmpty: u64 = 2;

    const EPoolFull: u64 = 4;

    const FEE_SCALING: u128 = 10000;

    const FEE_PERCENT: u128 = 30;

    const MAX_POOL_VALUE: u64 = {
        18446744073709551615 / 10000
    };

    public struct LSP<phantom TA, phantom TB> has drop {}

    public struct Pool<phantom TA, phantom TB> has key {
        id: UID,
        token_a: Balance<TA>,
        token_b: Balance<TB>,
        lsp_supply: Supply<LSP<TA, TB>>,
        /// Fee Percent is denominated in basis points.
        fee_percent: u64
    }

    fun init(_: &mut TxContext) {
    }

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

    public fun sell_token_a<TA, TB>(pool: &Pool<TA, TB>, to_sell: u64): u64 {
        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        calc_output_amount(
            to_sell,
            token_a_amt,
            token_b_amt,
            pool.fee_percent
        )
    }

    public fun sell_token_b<TA, TB>(pool: &Pool<TA, TB>, to_sell: u64): u64 {
        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        calc_output_amount(
            to_sell,
            token_b_amt,
            token_a_amt,
            pool.fee_percent
        )
    }

    public fun get_amounts<TA, TB>(pool: &Pool<TA, TB>): (u64, u64, u64) {
        (
            balance::value(&pool.token_a),
            balance::value(&pool.token_b),
            balance::supply_value(&pool.lsp_supply),
        )
    }

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

        let input_with_fee = input_amount * FEE_SCALING / (FEE_SCALING - fee_percent);

        let total = input_reserve * output_reserve;
        let output_amount = output_reserve - total / (input_reserve + input_with_fee);

        (output_amount as u64)
    }
}
