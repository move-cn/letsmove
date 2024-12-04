module canwaiting::swap {
    use canwaiting::pool::{Self, Pool, LPCoin};
    use sui::coin::{Self, Coin};
    use sui::pay;
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};

    public entry fun create_pool<CoinX, CoinY>(ctx: &mut TxContext) {
        pool::create_pool<CoinX, CoinY>(ctx);
    }

    public entry fun add_pool<CoinX, CoinY>(pool: &mut Pool<CoinX, CoinY>,
                                            coin_x_vec: vector<Coin<CoinX>>,
                                            coin_y_vec: vector<Coin<CoinY>>,
                                            amount_x: u64,
                                            amount_y: u64,
                                            ctx: &mut TxContext) {
        let mut coin_x = coin::zero<CoinX>(ctx);
        pay::join_vec(&mut coin_x, coin_x_vec);

        let coin_real_x = coin::split(&mut coin_x, amount_x, ctx);

        let mut coin_y = coin::zero<CoinY>(ctx);
        pay::join_vec(&mut coin_y, coin_y_vec);
        let coin_real_y = coin::split(&mut coin_y, amount_y, ctx);

        let lp_coin = pool::add_pool<CoinX, CoinY>(pool, coin_real_x, coin_real_y, ctx);

        transfer::public_transfer(lp_coin, sender(ctx));


        transfer::public_transfer(coin_x, sender(ctx));
        transfer::public_transfer(coin_y, sender(ctx));
    }


    public entry fun remove<CoinX, CoinY>(pool: &mut Pool<CoinX, CoinY>,
                                          lp_vec: vector<Coin<LPCoin<CoinX, CoinY>>>,
                                          amount_x: u64,
                                          amount_y: u64,
                                          ctx: &mut TxContext) {
        let mut coin_lp = coin::zero<LPCoin<CoinX, CoinY>>(ctx);
        pay::join_vec(&mut coin_lp, lp_vec);

        let (x, y, lp) = pool::remove(pool, coin_lp, amount_x, amount_y, ctx);

        transfer::public_transfer(x, sender(ctx));
        transfer::public_transfer(y, sender(ctx));
        transfer::public_transfer(lp, sender(ctx));
    }


    public entry fun swap_x_y<CoinX, CoinY>(pool: &mut Pool<CoinX, CoinY>,
                                            in: vector<Coin<CoinX>>,
                                            amount: u64,
                                            ctx: &mut TxContext) {
        let mut coin_in = coin::zero<CoinX>(ctx);
        pay::join_vec(&mut coin_in, in);


        let coin_real = coin::split(&mut coin_in, amount, ctx);

        let y = pool::swap_x_to_y(pool, coin_real, ctx);
        transfer::public_transfer(y, sender(ctx));
        transfer::public_transfer(coin_in, sender(ctx));
    }

    public entry fun swap_y_x<CoinX, CoinY>(pool: &mut Pool<CoinX, CoinY>,
                                            in: vector<Coin<CoinY>>,
                                            amount: u64,
                                            ctx: &mut TxContext) {
        let mut coin_in = coin::zero<CoinY>(ctx);
        pay::join_vec(&mut coin_in, in);

        let coin_real = coin::split(&mut coin_in, amount, ctx);

        let x = pool::swap_y_to_x(pool, coin_real, ctx);
        transfer::public_transfer(x, sender(ctx));
        transfer::public_transfer(coin_in, sender(ctx));
    }
}