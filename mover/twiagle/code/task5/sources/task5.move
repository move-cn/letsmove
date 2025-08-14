module twiagle::swap {
    use sui::object::{Self,UID, ID};
    use sui::tx_context::{Self, TxContext, sender};
    use sui::math;
    use sui::balance::{Self, Balance, Supply};
    use sui::coin::{Self, Coin};

    // use task2::twiaglecoin::TWIAGLECOIN;
    // use faucet::twiaglefaucet::TWIAGLEFAUCET;

    const EInsufficientLiquidity: u64 = 1;
    const ESlippageLimitExceeded: u64 = 2;
    const EInvalidSwapParameters: u64 = 3;

    public struct LPCoin<phantom CoinA, phantom CoinB> has drop {}

    public struct LiquidityPool<phantom CoinA, phantom CoinB> has key {
        id: UID, // The unique ID of the liquidity pool
        coin_a_balance: Balance<CoinA>, // The reserve of the first coin
        coin_b_balance: Balance<CoinB>, // The reserve of the second coin
        lp_coin_supply: Supply<LPCoin<CoinA, CoinB>>, // The total supply of the LP coins - this is how
        // the LPCoins are tracked
        initial_lp_coin_reserve: Balance<LPCoin<CoinA, CoinB>>, // The initial LP coin reserve
    }

    public entry fun create_liquidity_pool<CoinA, CoinB>(
        coin_a: Coin<CoinA>,
        coin_b: Coin<CoinB>,
        ctx: &mut TxContext
    ){
        let amount_coin_a = coin::value(&coin_a);
        let amount_coin_b = coin::value(&coin_b);

        let amount_a_b_sqrt = math::sqrt(amount_coin_a * amount_coin_b);

        assert!(amount_a_b_sqrt >= 1000, EInsufficientLiquidity);

        let coin_a_balance = coin::into_balance(coin_a);
        let coin_b_balance = coin::into_balance(coin_b);

        let lp_value = amount_a_b_sqrt - 1000;
        let mut lp_coin_supply = balance::create_supply(LPCoin<CoinA, CoinB> {});

        let lp_balance = balance::increase_supply(
            &mut lp_coin_supply, lp_value);

        let initial_lp_coin_reserve_balance = balance::increase_supply(
            &mut lp_coin_supply, 1000);

        let liquidityPool = LiquidityPool {
            id: object::new(ctx),
            coin_a_balance,
            coin_b_balance,
            lp_coin_supply,
            initial_lp_coin_reserve: initial_lp_coin_reserve_balance,
        };

        transfer::share_object(liquidityPool);
        transfer::public_transfer(coin::from_balance(lp_balance, ctx), sender(ctx));
    }

    public entry fun supply_liquidity<CoinA, CoinB>(
        coin_a: Coin<CoinA>,
        coin_b: Coin<CoinB>,
        pool: &mut LiquidityPool<CoinA, CoinB>,
        ctx: &mut TxContext
    ){
        let amount_coin_a = coin::value(&coin_a);
        let amount_coin_b = coin::value(&coin_b);

        assert!(amount_coin_a > 0, EInsufficientLiquidity);
        assert!(amount_coin_b > 0, EInsufficientLiquidity);

        let lp_coins_total_supply = balance::supply_value(&pool.lp_coin_supply);

        let amount_coin_a_reserve = balance::value(&pool.coin_a_balance);
        let amount_coin_b_reserve = balance::value(&pool.coin_b_balance);

        let amount_lp_value = math::min(
            amount_coin_a * lp_coins_total_supply / amount_coin_a_reserve,
            amount_coin_b * lp_coins_total_supply / amount_coin_b_reserve
        );

        balance::join(&mut pool.coin_a_balance, coin::into_balance(coin_a));
        balance::join(&mut pool.coin_b_balance, coin::into_balance(coin_b));

        let lp_balance = balance::increase_supply(
            &mut pool.lp_coin_supply, amount_lp_value);
        transfer::public_transfer(coin::from_balance(lp_balance, ctx), sender(ctx));
    }

    public entry fun remove_liquidity<CoinA, CoinB>(
        lp_coins_to_redeem: Coin<LPCoin<CoinA, CoinB>>,
        pool: &mut LiquidityPool<CoinA, CoinB>,
        ctx: &mut TxContext
    ){

        let amount_lp_coins = coin::value(&lp_coins_to_redeem);
        assert!(amount_lp_coins > 0, EInsufficientLiquidity);

        let amount_coin_a_reserve = balance::value(&pool.coin_a_balance);
        let amount_coin_b_reserve = balance::value(&pool.coin_b_balance);
        let lp_coins_total_supply = balance::supply_value(&pool.lp_coin_supply);

        let amount_coin_a = amount_lp_coins * amount_coin_a_reserve / lp_coins_total_supply;
        let amount_coin_b = amount_lp_coins * amount_coin_b_reserve / lp_coins_total_supply;

        let coin_a_balance = balance::split(&mut pool.coin_a_balance, amount_coin_a);
        let coin_b_balance = balance::split(&mut pool.coin_b_balance, amount_coin_b);

        let coin_a = coin::from_balance(coin_a_balance, ctx);
        let coin_b = coin::from_balance(coin_b_balance, ctx);

        let lp_coins_to_redeem_balance = coin::into_balance(lp_coins_to_redeem);

        balance::decrease_supply(&mut pool.lp_coin_supply, lp_coins_to_redeem_balance);
        transfer::public_transfer(coin_a, sender(ctx));
        transfer::public_transfer(coin_b, sender(ctx));
    }

    public fun swap_exact_a_for_b<CoinA, CoinB>(
        coin_a_in: Coin<CoinA>,
        pool: &mut LiquidityPool<CoinA, CoinB>,
        min_amount_coin_b_out: u64, // avoid too much price slip
        ctx: &mut TxContext
    ) {

        let prev_coin_a_reserve = balance::value(&pool.coin_a_balance);
        let prev_coin_b_reserve = balance::value(&pool.coin_b_balance);

        let coin_a_in_value = coin::value(&coin_a_in);
        let new_coin_a_reserve = coin_a_in_value + prev_coin_a_reserve;

        let new_coin_b_reserve = prev_coin_b_reserve * prev_coin_a_reserve / new_coin_a_reserve;

        assert!(min_amount_coin_b_out > 0, EInvalidSwapParameters);
        assert!(prev_coin_b_reserve - new_coin_b_reserve >= min_amount_coin_b_out, ESlippageLimitExceeded);

        balance::join(&mut pool.coin_a_balance, coin::into_balance(coin_a_in));

        let coin_b_balance = balance::split(&mut pool.coin_b_balance,
            prev_coin_b_reserve - new_coin_b_reserve);
        transfer::public_transfer(coin::from_balance(coin_b_balance, ctx), sender(ctx));
    }

    public entry fun swap_exact_b_for_a<CoinA, CoinB>(
        coin_b_in: Coin<CoinB>,
        pool: &mut LiquidityPool<CoinA, CoinB>,
        min_amount_coin_a_out: u64,
        ctx: &mut TxContext
    ) {
        let prev_coin_a_reserve = balance::value(&pool.coin_a_balance);
        let prev_coin_b_reserve = balance::value(&pool.coin_b_balance);

        let coin_b_in_value = coin::value(&coin_b_in);
        let new_coin_b_reserve = coin_b_in_value + prev_coin_b_reserve;

        let new_coin_a_reserve = prev_coin_b_reserve * prev_coin_a_reserve / new_coin_b_reserve;

        assert!(min_amount_coin_a_out > 0, EInvalidSwapParameters);
        assert!(prev_coin_a_reserve - new_coin_a_reserve >= min_amount_coin_a_out, ESlippageLimitExceeded);

        balance::join(&mut pool.coin_b_balance, coin::into_balance(coin_b_in));

        let coin_a_balance = balance::split(&mut pool.coin_a_balance,
            prev_coin_a_reserve - new_coin_a_reserve);
        transfer::public_transfer(coin::from_balance(coin_a_balance, ctx), sender(ctx));
    }
}