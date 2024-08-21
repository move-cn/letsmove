
module fantasy_move_swap::swap {

    use fantasy_move_swap::global::{Self, Global, exist_pool};
    use fantasy_move_swap::pool::{Self, Pool, LPCoin};
    use sui::coin::{Self, Coin};
    use sui::pay;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    const EHaveSlippage: u64 = 1;
    const EPoolExist: u64 = 2;

    /// create pool
    public entry fun create_pool<X, Y>(global: &mut Global, ctx: &mut TxContext) {
        assert!(!exist_pool<X, Y>(global) || !exist_pool<Y, Y>(global), EPoolExist);
        let id = pool::create_pool<X, Y>(ctx);
        global::add_pool_flag<X, Y>(global, id);
    }

    public entry fun add_liquidity<X, Y>(
        pool: &mut Pool<X, Y>,
        coin_x: vector<Coin<X>>,
        coin_y: vector<Coin<Y>>,
        coin_x_amount: u64,
        coin_x_min: u64,
        coin_y_amount: u64,
        coin_y_min: u64,
        ctx: &mut TxContext
    ){
        let mut coin_x_in = coin::zero<X>(ctx);
        pay::join_vec(&mut coin_x_in, coin_x);

        let mut coin_y_in = coin::zero<Y>(ctx);
        pay::join_vec(&mut coin_y_in, coin_y);

        let (lp_coin, rest_x, rest_y) = pool::add_liquidity(pool,coin_x_in, coin_y_in,
            coin_x_amount, coin_x_min, coin_y_amount, coin_y_min, ctx
        );

        transfer::public_transfer(lp_coin, tx_context::sender(ctx));
        transfer::public_transfer(rest_x, tx_context::sender(ctx));
        transfer::public_transfer(rest_y, tx_context::sender(ctx));
    }

    /// swap x => y
    public entry fun swap_x_to_y<CoinIn, CoinOut>(pool: &mut Pool<CoinIn, CoinOut>, in: vector<Coin<CoinIn>>, in_amount: u64, min_out: u64, ctx: &mut TxContext){
        let mut in_coin = coin::zero<CoinIn>(ctx);
        pay::join_vec(&mut in_coin, in);

        let real = coin::split(&mut in_coin, in_amount, ctx);
        let (out, out_amount) = pool::swap_x_to_y(pool, real, min_out, ctx);

        assert!(out_amount >= min_out, EHaveSlippage);

        let sender = tx_context::sender(ctx);
        transfer::public_transfer(in_coin, sender);
        transfer::public_transfer(out, sender);

    }

    /// swap y => x
    public entry fun swap_y_to_x<CoinIn, CoinOut>(pool: &mut Pool<CoinIn, CoinOut>, in: vector<Coin<CoinOut>>, in_amount: u64, min_out: u64, ctx: &mut TxContext){
        let mut in_coin = coin::zero<CoinOut>(ctx);
        pay::join_vec(&mut in_coin, in);

        let real = coin::split(&mut in_coin, in_amount, ctx);
        let (out, out_amount) = pool::swap_y_to_x(pool, real, min_out, ctx);

        assert!(out_amount >= min_out, EHaveSlippage);

        let sender = tx_context::sender(ctx);
        transfer::public_transfer(in_coin, sender);
        transfer::public_transfer(out, sender);

    }

}
