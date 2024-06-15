/// Module: vv1133_swap
module vv1133_swap::vv1133_swap {
    use sui::object::{Self, UID};
    use sui::tx_context::{TxContext, sender};
    use sui::math;
    use sui::balance::{Self, Balance, Supply};
    use sui::coin::{Self, Coin};

    const EAmount: u64 = 1;

    public struct LP<phantom CoinA, phantom CoinB> has drop {}
    public struct Pool<phantom CoinA, phantom CoinB> has key {
        id: UID,
        coin_a_bal: Balance<CoinA>,
        coin_b_bal: Balance<CoinB>,
        lp_supply: Supply<LP<CoinA, CoinB>>,
    }

    public entry fun create_pool<CoinA, CoinB>(coin_a: Coin<CoinA>, coin_b: Coin<CoinB>, ctx: &mut TxContext) {
        let coin_a_amount = coin::value(&coin_a);
        let coin_b_amount = coin::value(&coin_b);

        assert!(coin_a_amount > 0 && coin_b_amount > 0, EAmount);

        let coin_a_balance = coin::into_balance(coin_a);
        let coin_b_balance = coin::into_balance(coin_b);

        let lp_amount = math::sqrt(coin_a_amount * coin_b_amount); // 计算初始LP
        let mut lp_supply = balance::create_supply(LP<CoinA, CoinB> {});
        let lp_balance = balance::increase_supply(&mut lp_supply, lp_amount);

        let pool = Pool {
            id: object::new(ctx),
            coin_a_bal: coin_a_balance,
            coin_b_bal: coin_b_balance,
            lp_supply,
        };
        
        transfer::share_object(pool);
        // lp数量加到pool中，并给用户返回凭证
        transfer::public_transfer(coin::from_balance(lp_balance, ctx), sender(ctx));
    }

    public entry fun add_liquidity<CoinA, CoinB> (pool: &mut Pool<CoinA, CoinB>, coin_a: Coin<CoinA>, coin_b: Coin<CoinB>, ctx: &mut TxContext) {
        let coin_a_amount = coin::value(&coin_a);
        let coin_b_amount = coin::value(&coin_b);

        assert!(coin_a_amount > 0 && coin_b_amount > 0, EAmount);

        let coin_a_amount_in_pool = balance::value(&pool.coin_a_bal);
        let coin_b_amount_in_pool = balance::value(&pool.coin_b_bal);

        // coin_a和coin_b加到pool中
        balance::join(&mut pool.coin_a_bal, coin::into_balance(coin_a));
        balance::join(&mut pool.coin_b_bal, coin::into_balance(coin_b));

        let factor_a = coin_a_amount / coin_a_amount_in_pool;
        let factor_b = coin_b_amount / coin_b_amount_in_pool;
        let add_coin_a_amount;
        let add_coin_b_amount;
        // 用户给的coin_a和coin_b比例如果和原始比例不一样，需要按原始比例加到pool中，将多出部分返还给用户
        if (factor_a >= factor_b) { // coin_a给的太多了，需返还部分给用户
            add_coin_a_amount = factor_b * coin_a_amount_in_pool;
            add_coin_b_amount = coin_b_amount;
            let refund_coin_a_amount = coin_a_amount - add_coin_a_amount;
            let refund_coin_a_balance = balance::split(&mut pool.coin_a_bal, refund_coin_a_amount);
            transfer::public_transfer(coin::from_balance(refund_coin_a_balance, ctx), sender(ctx));
        } else { // coin_b给的太多了，需返还部分给用户
            add_coin_a_amount = coin_a_amount;
            add_coin_b_amount = factor_a * coin_b_amount_in_pool;
            let refund_coin_b_amount = coin_b_amount - add_coin_b_amount;
            let refund_coin_b_balance = balance::split(&mut pool.coin_b_bal, refund_coin_b_amount);
            transfer::public_transfer(coin::from_balance(refund_coin_b_balance, ctx), sender(ctx));
        };

        let lp_amount_in_pool = balance::supply_value(&pool.lp_supply);
        let new_lp_amount = math::sqrt((coin_a_amount + add_coin_a_amount) * (coin_b_amount + add_coin_b_amount)); // 计算新的LP
        let add_lp_amount = new_lp_amount - lp_amount_in_pool;

        // 增加pool中lp数量，并给用户返回凭证
        let lp_balance = balance::increase_supply(&mut pool.lp_supply, add_lp_amount);
        transfer::public_transfer(coin::from_balance(lp_balance, ctx), sender(ctx));
    }

    public entry fun remove_liquidity<CoinA, CoinB> (pool: &mut Pool<CoinA, CoinB>, lp: Coin<LP<CoinA, CoinB>>, ctx: &mut TxContext) {
        let lp_amount = coin::value(&lp);

        assert!(lp_amount > 0, EAmount);

        let coin_a_amount_in_pool = balance::value(&pool.coin_a_bal);
        let coin_b_amount_in_pool = balance::value(&pool.coin_b_bal);
        let lp_amount_in_pool = balance::supply_value(&pool.lp_supply);

        let factor = lp_amount / lp_amount_in_pool;
        let remove_coin_a_amount = factor * coin_a_amount_in_pool;
        let remove_coin_b_amount = factor * coin_b_amount_in_pool;

        // 提取pool中的coin_a和coin_b
        let coin_a_balance = balance::split(&mut pool.coin_a_bal, remove_coin_a_amount);
        let coin_b_balance = balance::split(&mut pool.coin_b_bal, remove_coin_b_amount);

        // 减少pool中lp数量，并给用户返回coin_a和coin_b
        balance::decrease_supply(&mut pool.lp_supply, coin::into_balance(lp));
        transfer::public_transfer(coin::from_balance(coin_a_balance, ctx), sender(ctx));
        transfer::public_transfer(coin::from_balance(coin_b_balance, ctx), sender(ctx));
    }

    public entry fun swap_coin_a_to_coin_b<CoinA, CoinB> (pool: &mut Pool<CoinA, CoinB>, coin_a: Coin<CoinA>, ctx: &mut TxContext) {
        let swap_coin_a_amount = coin::value(&coin_a);
        let coin_a_amount_in_pool = balance::value(&pool.coin_a_bal);
        let coin_b_amount_in_pool = balance::value(&pool.coin_b_bal);

        assert!(swap_coin_a_amount > 0, EAmount);

        let new_coin_b_amount = coin_a_amount_in_pool * coin_b_amount_in_pool / (coin_a_amount_in_pool + swap_coin_a_amount);
        let swap_coin_b_amount = coin_b_amount_in_pool - new_coin_b_amount;
        balance::join(&mut pool.coin_a_bal, coin::into_balance(coin_a));
        let coin_b_balance = balance::split(&mut pool.coin_b_bal, swap_coin_b_amount);
        transfer::public_transfer(coin::from_balance(coin_b_balance, ctx), sender(ctx));
    }

    public entry fun swap_coin_b_to_coin_a<CoinA, CoinB> (pool: &mut Pool<CoinA, CoinB>, coin_b: Coin<CoinB>, ctx: &mut TxContext) {
        let swap_coin_b_amount = coin::value(&coin_b);
        let coin_a_amount_in_pool = balance::value(&pool.coin_a_bal);
        let coin_b_amount_in_pool = balance::value(&pool.coin_b_bal);

        assert!(swap_coin_b_amount > 0, EAmount);

        let new_coin_a_amount = coin_b_amount_in_pool * coin_a_amount_in_pool / (coin_b_amount_in_pool + swap_coin_b_amount);
        let swap_coin_a_amount = coin_a_amount_in_pool - new_coin_a_amount;
        balance::join(&mut pool.coin_b_bal, coin::into_balance(coin_b));
        let coin_a_balance = balance::split(&mut pool.coin_a_bal, swap_coin_a_amount);
        transfer::public_transfer(coin::from_balance(coin_a_balance, ctx), sender(ctx));
    }
}
