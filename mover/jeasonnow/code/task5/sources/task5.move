module task5::task5 {
    use sui::balance::{Self, Balance, Supply};
    use sui::coin::{Self, Coin};
    use sui::pay;
    use sui::tx_context::{sender};

    public struct PoolCoin<phantom Coin_a, phantom Coin_b> has drop {}

    public struct Pool<phantom Coin_a, phantom Coin_b> has key{
        id: UID,
        coin_a: Balance<Coin_a>,
        coin_b: Balance<Coin_b>,
        pool_coin: Supply<PoolCoin<Coin_a, Coin_b>>,
    }

    public entry fun create_pool<Coin_a, Coin_b>(ctx: &mut TxContext) {
        let pool = Pool<Coin_a, Coin_b> {
            id: object::new(ctx),
            coin_a: balance::zero(),
            coin_b: balance::zero(),
            pool_coin: balance::create_supply(PoolCoin<Coin_a, Coin_b> {}),
        };
        transfer::share_object(pool);
    }
0
    public entry fun add_pool<Coin_a, Coin_b>(
        pool: &mut Pool<Coin_a, Coin_b>, 
        coin_a: Coin<Coin_a>,
        coin_b: Coin<Coin_b>,
        a_amount: u64,
        b_amount: u64,
        ctx: &mut TxContext,
    ) {
        // create empty coin
        let mut new_coin_a = coin::zero<Coin_a>(ctx);
        let mut new_coin_b = coin::zero<Coin_b>(ctx);
        // merge coin to empty
        pay::join(&mut new_coin_a, coin_a);
        pay::join(&mut new_coin_b, coin_b);
        // split coin amount
        let real_coin_a = coin::split(&mut new_coin_a, a_amount, ctx);
        let real_coin_b = coin::split(&mut new_coin_b, b_amount, ctx);
        // put coin to pool
        coin::put(&mut pool.coin_a, real_coin_a);
        coin::put(&mut pool.coin_b, real_coin_b);
        // get pool coin
        let pool_coin = coin::from_balance(balance::increase_supply(&mut pool.pool_coin,  (a_amount + b_amount)), ctx);
        transfer::public_transfer(pool_coin, sender(ctx));
        // get back coin_a and coin_b
        transfer::public_transfer(new_coin_a, sender(ctx));
        transfer::public_transfer(new_coin_b, sender(ctx));
    }

    public entry fun swap_a_b<Coin_a, Coin_b>(
        pool: &mut Pool<Coin_a, Coin_b>,
        in: Coin<Coin_a>,
        amount: u64,
        ctx: &mut TxContext
    ) {
        let mut coin_in = coin::zero<Coin_a>(ctx);
        pay::join(&mut coin_in, in);

        let swap_coin = coin::split(&mut coin_in, amount, ctx);
        coin::put(&mut pool.coin_a, swap_coin);
        let swaped_coin = coin::take(&mut pool.coin_b, amount, ctx);

        transfer::public_transfer(swaped_coin, sender(ctx));
        transfer::public_transfer(coin_in, sender(ctx));
    }

    public entry fun swap_b_a<Coin_a, Coin_b>(
        pool: &mut Pool<Coin_a, Coin_b>,
        in: Coin<Coin_b>,
        amount: u64,
        ctx: &mut TxContext
    ) {
        let mut coin_in = coin::zero<Coin_b>(ctx);
        pay::join(&mut coin_in, in);

        let swap_coin = coin::split(&mut coin_in, amount, ctx);
        coin::put(&mut pool.coin_b, swap_coin);
        let swaped_coin = coin::take(&mut pool.coin_b, amount, ctx);

        transfer::public_transfer(swaped_coin, sender(ctx));
        transfer::public_transfer(coin_in, sender(ctx));
    }
}