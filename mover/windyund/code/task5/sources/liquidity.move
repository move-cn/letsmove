module windyund::liquidity{

    use sui::table::{Self,Table};
    use sui::coin::{Self,Coin};
    use sui::transfer;
    use sui::pay;
    use sui::tx_context::{Self,TxContext};
    use sui::balance::{Self,Balance,Supply};

    const ErrZeroAmount: u64= 0;
    const ErrNotEnoughYInPool:u64 =1;
    const ErrNotEnoughXInPool:u64 =2;
    ///Liquidity provider, parameter 'X' and 'Y'
    ///are coins held in the pool.
    public struct LP<phantom X, phantom Y> has drop {}

    /// Pool with exchange
    public struct Pool<phantom X, phantom Y> has key {
        id: UID,
        coin_x: Balance<X>,
        coin_y: Balance<Y>,
        lp_supply: Supply<LP<X, Y>>
    }

    ///pocket to keep the Liquidity provider
    ///and balance of Coin X/Y
    public struct Pocket has key, store {
        id: UID,
        table: Table<ID, vector<u64>>
    }


    ///create a new pool
    public fun new_pool<X, Y>(ctx: &mut TxContext) {
        let new_pool = Pool<X, Y> {
            id: object::new(ctx),
            coin_x: balance::zero(),
            coin_y: balance::zero(),
            lp_supply: balance::create_supply<LP<X, Y>>(LP {})
        };
        transfer::share_object(new_pool);
    }

    ///entry function to generate new pool
    public entry fun generate_pool<X, Y>(ctx: &mut TxContext) {
        new_pool<X, Y>(ctx);
    }


    ///entry function to create new pocket
    public entry fun create_pocket(ctx: &mut TxContext) {
        // 构造新的 Pocket
        let pocket = Pocket {
            id: object::new(ctx),
            table: table::new<ID, vector<u64>>(ctx) //初始化table 容器，存储 Coin X/Y在流水凭证中的数额
        };
        // 将新的 Pocket transer 给交易发送人
        transfer::public_transfer(pocket, tx_context::sender(ctx));
    }

    ///Add liquidity into pool, exchange rate is 1 between X and Y
    public fun add_liquidity<X, Y>(pool: &mut Pool<X, Y>,
                                   coin_x: Coin<X>,
                                   coin_y: Coin<Y>,
                                   ctx: &mut TxContext): (Coin<LP<X, Y>>, vector<u64>) {
        let coin_x_value = coin::value(&coin_x);
        let coin_y_value = coin::value(&coin_y);
        assert!(coin_x_value > 0 && coin_y_value > 0, ErrZeroAmount);
        coin::put(&mut pool.coin_x, coin_x);
        coin::put(&mut pool.coin_y, coin_y);
        let lp_bal = balance::increase_supply(&mut pool.lp_supply, coin_x_value + coin_y_value);
        let mut vec_value = vector::empty<u64>();
        vector::push_back(&mut vec_value, coin_x_value);
        vector::push_back(&mut vec_value, coin_y_value);
        (coin::from_balance(lp_bal, ctx), vec_value)
    }

        ///entry function to deposit total Coin X and Y to pool
    public entry fun deposit_totally<X, Y>(pool: &mut Pool<X, Y>,
                                        coin_x: Coin<X>,
                                        coin_y: Coin<Y>,
                                        pocket: &mut Pocket,
                                        ctx: &mut TxContext) {
        let (lp, vec) = add_liquidity(pool, coin_x, coin_y, ctx);
        let lp_id = object::id(&lp);
        table::add(&mut pocket.table, lp_id, vec);
        transfer::public_transfer(lp, tx_context::sender(ctx));
    }

    ///swap Coin X to Y, return Coin Y
public fun swap_x_outto_y<X, Y>(pool: &mut Pool<X, Y>,
                                paid_in: Coin<X>,
                                ctx: &mut TxContext): Coin<Y> {
    let paid_value = coin::value(&paid_in);// 获取 Coin X的数额
    coin::put(&mut pool.coin_x, paid_in); // 将 Coin X的数额增加到流动池中，并销毁这枚 coin
    assert!(paid_value < balance::value(&mut pool.coin_y), ErrNotEnoughYInPool);
    coin::take(&mut pool.coin_y, paid_value, ctx)// 从流动池中获取 Coin Y并返回
}

public entry fun swap_x_to_y<X, Y>(pool: &mut Pool<X, Y>,
                                    coin_x_vec: vector<Coin<X>>,
                                    amount: u64,
                                    ctx: &mut TxContext) {
    let mut coin_x = coin::zero<X>(ctx); // 构造一个0数额的 Coin X: coin_x
    pay::join_vec<X>(&mut coin_x, coin_x_vec); // 将一组 Coin X合并至上面新的coin_x
    // 从coin_x中分离出数额为 amount 的 Coin:coin_x_in
    let coin_x_in = coin::split(&mut coin_x, amount, ctx);
    // 调用swap_x_outto_y函数，获取 Coin Y: coin_y_out
    let coin_y_out = swap_x_outto_y(pool, coin_x_in, ctx);
    let sender_addres = tx_context::sender(ctx);
    // 将coin_x 和coin_y_out 传输给发送人
    transfer::public_transfer(coin_x, sender_addres);
    transfer::public_transfer(coin_y_out, sender_addres);
}

///swap Coin Y to X, return Coin X
public fun swap_y_into_x<X, Y>(pool: &mut Pool<X, Y>,
                                paid_in: Coin<Y>,
                                ctx: &mut TxContext): Coin<X> {
    let paid_value = coin::value(&paid_in);// 获取 Coin Y的数额
    coin::put(&mut pool.coin_y, paid_in);// 将 Coin Y的数额增加到流动池中，并销毁这枚 coin
    assert!(paid_value < balance::value(&mut pool.coin_x), ErrNotEnoughXInPool);
    coin::take(&mut pool.coin_x, paid_value, ctx) // 从流动池中获取 Coin X并返回
}

public entry fun swap_y_to_x<X, Y>(pool: &mut Pool<X, Y>,
                                    coin_y_vec: vector<Coin<Y>>,
                                    amount: u64,
                                    ctx: &mut TxContext) {
    let mut coin_y = coin::zero<Y>(ctx); // 构造一个0数额的 Coin Y: coin_y
    pay::join_vec<Y>(&mut coin_y, coin_y_vec); // 将一组 Coin Y合并至上面新的coin_y
    // 从coin_y中分离出数额为 amount 的 Coin:coin_y_in
    let coin_y_in = coin::split(&mut coin_y, amount, ctx);
    // 调用swap_y_into_x函数，获取 Coin X: coin_x_out
    let coin_x_out = swap_y_into_x(pool, coin_y_in, ctx);
    let sender_addres = tx_context::sender(ctx);
    // 将coin_x_out 和coin_y 传输给发送人
    transfer::public_transfer(coin_x_out, sender_addres);
    transfer::public_transfer(coin_y, sender_addres);
}

}