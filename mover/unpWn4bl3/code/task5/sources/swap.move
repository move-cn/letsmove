module task5::swap {
    use sui::object::{Self,UID};
    use sui::balance::{Self,Balance,Supply};
    use sui::coin::{Self,Coin};
    use sui::tx_context::{Self,TxContext};
    use sui::math;
    use sui::transfer;

    // simple AMM swap
    struct LPCoin<phantom CoinA, phantom CoinB> has drop{}

    struct LiquidityPool<phantom CoinA, phantom CoinB> has key{
        id: UID,
        coin_a_balance: Balance<CoinA>,
        coin_b_balance: Balance<CoinB>,
        lp_supply: Supply<LPCoin<CoinA,CoinB>>,
    }

    public fun create_liquidity_pool<CoinA,CoinB>(
        coin_a: Coin<CoinA>,
        coin_b: Coin<CoinB>,
        ctx:&mut TxContext,
    // ):Coin<LPCoin<CoinA,CoinB>>{
    ) {
        let value_a:u64 = coin::value(&coin_a);
        let value_b:u64 = coin::value(&coin_b);

        let lp_supply = balance::create_supply(LPCoin<CoinA,CoinB>{});
        let value_lp:u64 = math::sqrt(value_a * value_b);
        let lp_balance = balance::increase_supply(&mut lp_supply, value_lp);
        
        let liquidity_pool = LiquidityPool<CoinA,CoinB>{
            id: object::new(ctx),
            coin_a_balance: coin::into_balance(coin_a),
            coin_b_balance: coin::into_balance(coin_b),
            lp_supply,
        };

        transfer::share_object(liquidity_pool);
        // coin::from_balance(lp_balance,ctx)
        let lp_coin = coin::from_balance(lp_balance,ctx);
        transfer::public_transfer(lp_coin, tx_context::sender(ctx));
    }

    public fun supply_liquidity<CoinA,CoinB>(
        coin_a: Coin<CoinA>,
        coin_b: Coin<CoinB>,
        pool:&mut LiquidityPool<CoinA,CoinB>,
        ctx:&mut TxContext,
    // ): Coin<LPCoin<CoinA,CoinB>> {
    ) {
        let value_coin_a_inpool = balance::value(&pool.coin_a_balance);
        let value_coin_b_inpool = balance::value(&pool.coin_b_balance);
        let value_lp_supply_inpool = balance::supply_value(&pool.lp_supply);

        let cash_a_balance = coin::into_balance(coin_a);
        let cash_b_balance = coin::into_balance(coin_b);

        let new_value_lp_supply = math::min(
            balance::value(&cash_a_balance) * value_lp_supply_inpool / value_coin_a_inpool,
            balance::value(&cash_b_balance) * value_lp_supply_inpool / value_coin_b_inpool,
        );

        balance::join(&mut pool.coin_a_balance, cash_a_balance);
        balance::join(&mut pool.coin_b_balance, cash_b_balance);

        let lp_balance = balance::increase_supply(&mut pool.lp_supply, new_value_lp_supply);
        // coin::from_balance(lp_balance,ctx)
        let lp_coin = coin::from_balance(lp_balance,ctx);
        transfer::public_transfer(lp_coin, tx_context::sender(ctx));
    }

    public fun remove_liquidity<CoinA,CoinB>(
        lp_coin: Coin<LPCoin<CoinA,CoinB>>,
        pool:&mut LiquidityPool<CoinA,CoinB>,
        ctx:&mut TxContext,
    // ): (Coin<CoinA>,Coin<CoinB>) {
    ) {
        let value_lp_coin = coin::value(&lp_coin);
        let value_coin_a_balance = balance::value(&pool.coin_a_balance);
        let value_coin_b_balance = balance::value(&pool.coin_b_balance);
        let value_lp_supply = balance::supply_value(&pool.lp_supply);

        let new_value_coin_a_balance = value_lp_coin * value_coin_a_balance / value_lp_supply;
        let new_value_coin_b_balance = value_lp_coin * value_coin_b_balance / value_lp_supply;

        let coin_a_balance = balance::split(
            &mut pool.coin_a_balance,
            value_coin_a_balance - new_value_coin_a_balance,
        );
        let coin_b_balance = balance::split(
            &mut pool.coin_b_balance,
            value_coin_b_balance - new_value_coin_b_balance,
        );

        balance::decrease_supply(&mut pool.lp_supply, coin::into_balance(lp_coin));
        let coin_a = coin::from_balance(coin_a_balance,ctx);
        let coin_b = coin::from_balance(coin_b_balance,ctx);
        // (coin_a, coin_b)
        transfer::public_transfer(coin_a, tx_context::sender(ctx));
        transfer::public_transfer(coin_b, tx_context::sender(ctx));
    }

    public fun swap_a_for_b<CoinA,CoinB>(
        coin_a: Coin<CoinA>,
        pool:&mut LiquidityPool<CoinA,CoinB>,
        ctx:&mut TxContext,
    // ): Coin<CoinB> {
    ) {
        let value_coin_a = coin::value(&coin_a);
        let value_coin_a_in_pool = balance::value(&pool.coin_a_balance);
        let value_coin_b_in_pool = balance::value(&pool.coin_b_balance);
        let value_lp_supply = balance::supply_value(&pool.lp_supply);
        // B = b - k / (a+A) 
        let value_coin_b = value_coin_b_in_pool - value_lp_supply / (value_coin_a_in_pool + value_coin_a);
        balance::join(&mut pool.coin_a_balance, coin::into_balance(coin_a));
        let coin_b_balance = balance::split(&mut pool.coin_b_balance,value_coin_b);
        // coin::from_balance(coin_b_balance, ctx)
        let coin_b = coin::from_balance(coin_b_balance,ctx);
        transfer::public_transfer(coin_b, tx_context::sender(ctx));
    }

    public fun swap_b_for_a<CoinA,CoinB>(
        coin_b: Coin<CoinB>,
        pool:&mut LiquidityPool<CoinA,CoinB>,
        ctx:&mut TxContext,
    // ): Coin<CoinA> {
    ) {
        let value_coin_b = coin::value(&coin_b);
        let value_coin_a_in_pool = balance::value(&pool.coin_a_balance);
        let value_coin_b_in_pool = balance::value(&pool.coin_b_balance);
        let value_lp_supply = balance::supply_value(&pool.lp_supply);
        // B = b - k / (a+A) 
        let value_coin_a = value_coin_a_in_pool - value_lp_supply / (value_coin_b_in_pool + value_coin_b);
        balance::join(&mut pool.coin_b_balance, coin::into_balance(coin_b));
        let coin_a_balance = balance::split(&mut pool.coin_a_balance,value_coin_a);
        // coin::from_balance(coin_a_balance, ctx)
        let coin_a = coin::from_balance(coin_a_balance,ctx);
        transfer::public_transfer(coin_a, tx_context::sender(ctx));
    }
}