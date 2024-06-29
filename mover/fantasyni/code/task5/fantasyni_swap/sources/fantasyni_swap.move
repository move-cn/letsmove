/// Module: fantasyni_swap
module fantasyni_swap::fantasyni_swap {
    use sui::coin::{Self, Coin};
    use sui::object::{Self, UID};
    use sui::balance::{Self, Balance};
    use sui::dynamic_field::{Self as df};
    use sui::tx_context::{TxContext, sender};
    use sui::transfer::{share_object, public_transfer};

    const EBalanceNotEnough: u64 = 0;

    struct CoinKey<phantom CoinType> has copy, drop, store {

    }

    struct CoinPool has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let pool = CoinPool {
            id: object::new(ctx),
        };
        share_object(pool);
    }

    public entry fun deposit_coin<CoinType>(pool: &mut CoinPool, coin: Coin<CoinType>){
        let coin_balance = coin::into_balance(coin);
        let key = CoinKey<CoinType> {};

        if (df::exists_(&pool.id, key)) {
            let pool_coin_balance = df::borrow_mut<CoinKey<CoinType>, Balance<CoinType>>(&mut pool.id, key);
            balance::join(pool_coin_balance, coin_balance);
        } else {
            df::add(&mut pool.id, key, coin_balance);
        }
    }

    fun withdraw_coin<CoinType>(pool: &mut CoinPool, amount: u64, ctx: &mut TxContext): Coin<CoinType> {
        let key = CoinKey<CoinType> {};

        if (df::exists_(&pool.id, key)) {
            let pool_coin_balance = df::borrow_mut<CoinKey<CoinType>, Balance<CoinType>>(&mut pool.id, key);
            coin::from_balance(balance::split(pool_coin_balance, amount), ctx)
        } else {
            abort EBalanceNotEnough
        }
    }

    public entry fun swap_x_y<CoinX, CoinY>(pool: &mut CoinPool, x_coin: Coin<CoinX>, ctx: &mut TxContext) {
        let amount = coin::value(&x_coin);

        deposit_coin<CoinX>(pool, x_coin);

        let coin_y = withdraw_coin<CoinY>(pool, amount, ctx);

        public_transfer(coin_y, sender(ctx));
    }
}

/*
sui move build --skip-fetch-latest-git-deps
sui client publish  --skip-fetch-latest-git-deps
scripts/index.js
*/
