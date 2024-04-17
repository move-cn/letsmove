module task5::kang_swap {

    // A simple swap contract based on Uniswap V1.

    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};
    use sui::math;

    // Exceptions

    const ErrNoLiquidity: u64 = 0;
    const ErrLiquidityNotEnough : u64 = 1;

    // Structs

    // The liquidity token
    public struct LiquidityToken<phantom A, phantom B> has drop {}
    // The liquidity pool
    public struct Pool<phantom A, phantom B> has key {
        id: UID,
        balance_a: Balance<A>,
        balance_b: Balance<B>,
        supply_lt: Supply<LiquidityToken<A, B>>
        // No fee
    }

    // Entrypoints

    // Create liquidity pools

    public entry fun create<A, B>(
        coin_a: Coin<A>,
        coin_b: Coin<B>,
        ctx: &mut TxContext
    ) {

        let provide_a = coin::value(&coin_a);
        let provide_b = coin::value(&coin_b);
        let mint_lt: u64 = math::sqrt(provide_a * provide_b);

        assert!(mint_lt > 0, ErrNoLiquidity);

        let mut pool = Pool<A, B> {
            id: object::new(ctx),
            balance_a: coin::into_balance(coin_a),
            balance_b: coin::into_balance(coin_b),
            supply_lt: balance::create_supply(LiquidityToken<A, B> {})
        };

        let balance_lt = balance::increase_supply(&mut pool.supply_lt, mint_lt);
        transfer::share_object(pool);
        transfer::public_transfer(coin::from_balance(balance_lt, ctx), tx_context::sender(ctx));

    }

    // Provide and remove liquidity

    public entry fun provide<A, B>(
        pool: &mut Pool<A, B>,
        coin_a: Coin<A>,
        coin_b: Coin<B>,
        ctx: &mut TxContext
    ) {

        let provide_a = coin::value(&coin_a);
        let provide_b = coin::value(&coin_b);
        let reserve_a = balance::value(&pool.balance_a);
        let reserve_b = balance::value(&pool.balance_b);
        let supply_lt = balance::supply_value(&pool.supply_lt);

        // The value of a and b,
        // evaluated by the marginal price given by the pool,
        // should be equal.
        // Here the exceeding part is simply neglected (NO GOOD!!!).
        let mint_lt = math::min(
            supply_lt * provide_a / reserve_a,
            supply_lt * provide_b / reserve_b
        );

        balance::join(&mut pool.balance_a, coin::into_balance(coin_a));
        balance::join(&mut pool.balance_b, coin::into_balance(coin_b));

        let balance_lt = balance::increase_supply(&mut pool.supply_lt, mint_lt);
        transfer::public_transfer(coin::from_balance(balance_lt, ctx), tx_context::sender(ctx));

    }

    public entry fun remove<A, B>(
        pool: &mut Pool<A, B>,
        coin_lt: Coin<LiquidityToken<A, B>>,
        ctx: &mut TxContext
    ) {

        let redeem_lt = coin::value(&coin_lt);
        let reserve_a = balance::value(&pool.balance_a);
        let reserve_b = balance::value(&pool.balance_b);
        let supply_lt = balance::supply_value(&pool.supply_lt);

        let remove_a = reserve_a * redeem_lt / supply_lt;
        let remove_b = reserve_b * redeem_lt / supply_lt;

        balance::decrease_supply(&mut pool.supply_lt, coin::into_balance(coin_lt));

        let coin_a = coin::from_balance(balance::split(&mut pool.balance_a, remove_a), ctx);
        let coin_b = coin::from_balance(balance::split(&mut pool.balance_b, remove_b), ctx);

        transfer::public_transfer(coin_a, tx_context::sender(ctx));
        transfer::public_transfer(coin_b, tx_context::sender(ctx));

    }

    // Swap

    public entry fun swap_a_to_b<A, B>(
        pool: &mut Pool<A, B>,
        coin_a: Coin<A>,
        ctx: &mut TxContext
    ) {

        let reserve_a = balance::value(&pool.balance_a);
        let reserve_b = balance::value(&pool.balance_b);
        let delta_a = coin::value(&coin_a);
        let delta_b = reserve_b * delta_a / (reserve_a + delta_a);

        assert!(reserve_b > delta_b, ErrLiquidityNotEnough);

        balance::join(&mut pool.balance_a, coin::into_balance(coin_a));
        let coin_b = coin::from_balance(balance::split(&mut pool.balance_b, delta_b), ctx);
        transfer::public_transfer(coin_b, tx_context::sender(ctx));

    }

    public entry fun swap_b_to_a<A, B>(
        pool: &mut Pool<A, B>,
        coin_b: Coin<B>,
        ctx: &mut TxContext
    ) {

        let reserve_a = balance::value(&pool.balance_a);
        let reserve_b = balance::value(&pool.balance_b);
        let delta_b = coin::value(&coin_b);
        let delta_a = reserve_a * delta_b / (reserve_b + delta_b);

        assert!(reserve_a > delta_a, ErrLiquidityNotEnough);

        balance::join(&mut pool.balance_b, coin::into_balance(coin_b));
        let coin_a = coin::from_balance(balance::split(&mut pool.balance_a, delta_a), ctx);
        transfer::public_transfer(coin_a, tx_context::sender(ctx));

    }

}
