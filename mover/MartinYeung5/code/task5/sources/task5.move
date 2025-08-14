module martinyeung5::liquidity {
    use sui::object::{Self, UID};
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};
    use sui::transfer;
    use sui::math;
    use sui::tx_context::{Self, TxContext};

    ///When Coin is zero
    const EZeroAmount: u64 = 0;

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

    ///Liquidity provider, parameter 'X' and 'Y'
    ///are coins held in the pool.
    public struct LP<phantom X, phantom Y> has drop {}

    /// Pool with exchange
    public struct Pool<phantom X, phantom Y> has key {
        id: UID,
        coin_x: Balance<X>,
        coin_y: Balance<Y>,
        lsp_supply: Supply<LP<X, Y>>,
        fee_percent: u64
    }

    ///create a new pool
    public fun new_pool<X, Y>(
        coin_x: Coin<X>,
        coin_y: Coin<Y>,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            create_pool_inner(coin_x, coin_y, ctx),
            tx_context::sender(ctx)
        );
    }

    public fun create_pool_inner<X, Y> (
        coin_x: Coin<X>,
        coin_y: Coin<Y>,
        ctx: &mut TxContext
    ): Coin<LP<X, Y>> {
        let fee_percent = (FEE_PERCENT as u64);
        let token_x_amt = coin::value(&coin_x);
        let token_y_amt = coin::value(&coin_y);

        assert!(token_x_amt > 0 && token_y_amt > 0, EZeroAmount);
        assert!(token_x_amt < MAX_POOL_VALUE && token_y_amt < MAX_POOL_VALUE, EPoolFull);

        let share = math::sqrt(token_x_amt) * math::sqrt(token_y_amt);
        let mut lsp_supply = balance::create_supply(LP<X, Y> {});
        let lsp = balance::increase_supply(&mut lsp_supply, share);

        transfer::share_object(Pool {
            id: object::new(ctx),
            coin_x: coin::into_balance(coin_x),
            coin_y: coin::into_balance(coin_y),
            lsp_supply,
            fee_percent,
        });

        coin::from_balance(lsp, ctx)
    }

    ///Add liquidity into pool
    public entry fun add_liquidity<X, Y> (
        pool: &mut Pool<X, Y>,
        coin_x: Coin<X>,
        coin_y: Coin<Y>,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            add_liquidity_inner(pool, coin_x, coin_y, ctx),
            tx_context::sender(ctx)
        )
    }

    public fun add_liquidity_inner<X, Y> (
        pool: &mut Pool<X, Y>,
        coin_x: Coin<X>,
        coin_y: Coin<Y>,
        ctx: &mut TxContext
    ): Coin<LP<X, Y>> {
        assert!(coin::value(&coin_x) > 0 && coin::value(&coin_y) > 0, EZeroAmount);

        let (token_x_amt, token_y_amt, lsp_supply) = get_amounts(pool);
        assert!(token_x_amt > 0 && token_y_amt > 0, EReservesEmpty);

        let token_x_balance = coin::into_balance(coin_x);
        let token_y_balance = coin::into_balance(coin_y);

        let token_x_added = balance::value(&token_x_balance);
        let token_y_added = balance::value(&token_y_balance);

        let share_minted = math::min(
            (token_x_added * lsp_supply) / token_x_amt,
            (token_y_added * lsp_supply) / token_y_amt
        );

        let token_x_amt = balance::join(&mut pool.coin_x, token_x_balance);
        let token_y_amt = balance::join(&mut pool.coin_y, token_y_balance);

        assert!(token_x_amt < MAX_POOL_VALUE && token_y_amt < MAX_POOL_VALUE, EPoolFull);

        let balance = balance::increase_supply(&mut pool.lsp_supply, share_minted);

        coin::from_balance(balance, ctx)
    }

    ///Remove the liquidity and balance from pool
    public entry fun remove_liquidity<X, Y> (
        pool: &mut Pool<X, Y>,
        lsp: Coin<LP<X, Y>>,
        ctx: &mut TxContext
    ) {
        let (coin_x, coin_y) = remove_liquidity_inner(pool, lsp, ctx);
        let sender = tx_context::sender(ctx);

        transfer::public_transfer(coin_x, sender);
        transfer::public_transfer(coin_y, sender);
    }

    public fun remove_liquidity_inner<X, Y> (
        pool: &mut Pool<X, Y>,
        lsp: Coin<LP<X, Y>>,
        ctx: &mut TxContext
    ): (Coin<X>, Coin<Y>) {
        let lsp_amount = coin::value(&lsp);
        assert!(lsp_amount > 0, EZeroAmount);

        let (token_x_amt, token_y_amt, total_supply) = get_amounts(pool);

        let coin_x = (token_x_amt * lsp_amount) / total_supply;
        let coin_y = (token_y_amt * lsp_amount) / total_supply;

        balance::decrease_supply(&mut pool.lsp_supply, coin::into_balance(lsp));

        (
            coin::take(&mut pool.coin_x, coin_x, ctx),
            coin::take(&mut pool.coin_y, coin_y, ctx),
        )
    }

    //swap the coin from x to y
    public entry fun swap_a_to_b<X, Y> (
        pool: &mut Pool<X, Y>,
        coin_x: Coin<X>,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            swap_a_to_b_inner(pool, coin_x, ctx),
            tx_context::sender(ctx)
        )
    }

    public fun swap_a_to_b_inner<X, Y> (
        pool: &mut Pool<X, Y>,
        coin_x: Coin<X>,
        ctx: &mut TxContext
    ): Coin<Y> {
        let token_x_amt = coin::value(&coin_x);
        assert!(token_x_amt > 0, EZeroAmount);

        let (token_x_amt, token_y_amt, _) = get_amounts(pool);
        assert!(token_x_amt > 0 && token_y_amt > 0, EReservesEmpty);

        let token_y_amt = sell_token_a(pool, token_x_amt);

        balance::join(&mut pool.coin_x, coin::into_balance(coin_x));

        coin::take(&mut pool.coin_y, token_y_amt, ctx)
    }

    entry fun swap_b_to_a<X, Y> (
        pool: &mut Pool<X, Y>,
        coin_y: Coin<Y>,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            swap_b_to_a_inner(pool, coin_y, ctx),
            tx_context::sender(ctx)
        )
    }

    fun swap_b_to_a_inner<X, Y> (
        pool: &mut Pool<X, Y>,
        coin_y: Coin<Y>,
        ctx: &mut TxContext
    ): Coin<X> {
        let token_y_amt = coin::value(&coin_y);
        assert!(token_y_amt > 0, EZeroAmount);

        let (token_x_amt, token_y_amt, _) = get_amounts(pool);
        assert!(token_x_amt > 0 && token_y_amt > 0, EReservesEmpty);

        let token_x_amt = sell_token_b(pool, token_y_amt);

        balance::join(&mut pool.coin_y, coin::into_balance(coin_y));

        coin::take(&mut pool.coin_x, token_x_amt, ctx)
    }


    public fun sell_token_a<X, Y>(pool: &Pool<X, Y>, to_sell: u64): u64 {
        let (token_x_amt, token_y_amt, _) = get_amounts(pool);
        calcualte_output_amount(
            to_sell,
            token_x_amt,
            token_y_amt,
            pool.fee_percent
        )
    }

    public fun sell_token_b<X, Y>(pool: &Pool<X, Y>, to_sell: u64): u64 {
        let (token_x_amt, token_y_amt, _) = get_amounts(pool);
        calcualte_output_amount(
            to_sell,
            token_y_amt,
            token_x_amt,
            pool.fee_percent
        )
    }

    /// Get most used values in a handy way:
    /// - amount of token x
    /// - amount of token y
    /// - total supply of LP
    public fun get_amounts<X, Y>(pool: &Pool<X, Y>): (u64, u64, u64) {
        (
            balance::value(&pool.coin_x),
            balance::value(&pool.coin_y),
            balance::supply_value(&pool.lsp_supply),
        )
    }

    /// Calculate the output amount minus the fee
    public fun calcualte_output_amount(
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