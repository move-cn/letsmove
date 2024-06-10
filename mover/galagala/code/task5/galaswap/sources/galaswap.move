module galaswap::galaswap {
    use galaswap::galapool::{Self, Pool, LPCoin};
    use sui::coin::{Self, Coin};
    use sui::pay;
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};

    public entry fun create_pool<CoinX, CoinY>(ctx: &mut TxContext) {
        galapool::create_pool<CoinX, CoinY>(ctx);
    }

    public entry fun add_pool_amount<CoinX,CoinY>(pool: &mut Pool<CoinX,CoinY>, coin_x_vec: vector<Coin<CoinX>>,
                                           coin_y_vec: vector<Coin<CoinY>>, amount_x: u64,
                                           amount_y: u64, ctx: &mut TxContext){
        let coin_x = coin::zero<CoinX>(ctx);
        pay::join_vec(&mut coin_x, coin_x_vec);
        let truth_coin_x = coin::split(&mut coin_x, amount_x, ctx);

        let coin_y = coin::zero<CoinY>(ctx);
        pay::join_vec(&mut coin_y, coin_y_vec);
        let truth_coin_y = coin::split(&mut coin_y, amount_y, ctx);

        let lp_coin = galapool::add_pool(pool, truth_coin_x, truth_coin_y, ctx);
        transfer::public_transfer(lp_coin, sender(ctx));

        //return exact coin
        transfer::public_transfer(coin_x, sender(ctx));
        transfer::public_transfer(coin_y, sender(ctx));
    }

    public entry fun remove<CoinX,CoinY>(pool: &mut Pool<CoinX,CoinY>,lp_vec: vector<Coin<LPCoin<CoinX,CoinY>>>, amount_x:u64, amount_y:u64,ctx: &mut TxContext){
        let coin_lp = coin::zero<LPCoin<CoinX,CoinY>>(ctx);
        pay::join_vec(&mut coin_lp, lp_vec);

        let (coin_x,coin_y) = galapool::remove_pool(pool, &mut coin_lp, amount_x, amount_y, ctx);
        //transfer their own token
        transfer::public_transfer(coin_x, sender(ctx));
        transfer::public_transfer(coin_y, sender(ctx));

        //transfer lp
        transfer::public_transfer(coin_lp,sender(ctx))
    }

    public entry fun swap_x_to_y<CoinX,CoinY>(pool: &mut Pool<CoinX,CoinY>,
                                              inVec: vector<Coin<CoinX>>,
                                              amount: u64,
                                              ctx: &mut TxContext) {
        let coin_x = coin::zero<CoinX>(ctx);
        pay::join_vec(&mut coin_x, inVec);

        let in_x = coin::split(&mut coin_x, amount, ctx);
        let coin_y = galapool::swap_x_to_y(pool, in_x, ctx);
        transfer::public_transfer(coin_y,sender(ctx));
        transfer::public_transfer(coin_x, sender(ctx));
    }

    public entry fun swap_y_to_x<CoinX,CoinY>(pool: &mut Pool<CoinX,CoinY>,
                                              inVec: vector<Coin<CoinY>>,
                                              amount: u64,
                                              ctx: &mut TxContext) {
        let coin_y = coin::zero<CoinY>(ctx);
        pay::join_vec(&mut coin_y, inVec);

        let in_y = coin::split(&mut coin_y, amount, ctx);
        let coin_x = galapool::swap_y_to_x(pool, in_y, ctx);
        transfer::public_transfer(coin_y,sender(ctx));
        transfer::public_transfer(coin_x, sender(ctx));
    }
}

