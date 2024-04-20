module canwaiting::pool {

    use sui::balance::{Self, Balance, Supply};
    use sui::coin::{Self, Coin};
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::TxContext;

    public struct LPCoin<phantom CoinX, phantom CoinY> has drop {}

    public struct Pool<phantom CoinX, phantom CoinY> has key {
        id: UID,
        coin_x: Balance<CoinX>,
        coin_y: Balance<CoinY>,
        lp_coin: Supply<LPCoin<CoinX, CoinY>>
    }

    public fun create_pool<CoinX, CoinY>(ctx: &mut TxContext) {
        let pool = Pool<CoinX, CoinY> {
            id: object::new(ctx),
            coin_x: balance::zero(),
            coin_y: balance::zero(),
            lp_coin: balance::create_supply(LPCoin<CoinX, CoinY> {})
        };
        transfer::share_object(pool);
    }

    public fun add_pool<CoinX, CoinY>(pool: &mut Pool<CoinX, CoinY>, coin_x: Coin<CoinX>, coin_y: Coin<CoinY>, ctx: &mut TxContext):
    Coin<LPCoin<CoinX, CoinY>> {
        let coin_x_value = coin::value(&coin_x);
        let coin_y_value = coin::value(&coin_y);
        coin::put(&mut pool.coin_x, coin_x);
        coin::put(&mut pool.coin_y, coin_y);
        let coin = balance::increase_supply(&mut pool.lp_coin, (coin_x_value + coin_y_value));
        coin::from_balance(coin, ctx)
    }


    public fun remove<CoinX, CoinY>(pool: &mut Pool<CoinX, CoinY>, mut lp_coin: Coin<LPCoin<CoinX, CoinY>>, amount_x: u64, amount_y: u64, ctx: &mut TxContext):
    (Coin<CoinX>, Coin<CoinY>, Coin<LPCoin<CoinX, CoinY>>)
    {
        let tack = coin::split(&mut lp_coin, amount_x + amount_y, ctx);

        balance::decrease_supply(&mut pool.lp_coin, coin::into_balance(tack));
        let coin_x = coin::take(&mut pool.coin_x, amount_x, ctx);
        let coin_y = coin::take(&mut pool.coin_y, amount_y, ctx);
        (coin_x, coin_y, lp_coin)
    }


    public fun swap_x_to_y<CoinX, CoinY>(pool: &mut Pool<CoinX, CoinY>, in: Coin<CoinX>, ctx: &mut TxContext): Coin<CoinY> {
        let coin_in_vcalue = coin::value(&in);
        coin::put(&mut pool.coin_x, in);
        coin::take(&mut pool.coin_y, coin_in_vcalue, ctx)
    }


    public fun swap_y_to_x<CoinX, CoinY>(pool: &mut Pool<CoinX, CoinY>, in: Coin<CoinY>, ctx: &mut TxContext): Coin<CoinX> {
        let coin_in_vcalue = coin::value(&in);
        coin::put(&mut pool.coin_y, in);
        coin::take(&mut pool.coin_x, coin_in_vcalue, ctx)
    }
}
