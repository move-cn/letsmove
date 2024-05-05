/// Module: lihuazhang_swap
/// 大部分参考 https://foresightnews.pro/article/detail/29952
module lihuazhang_swap::lihuazhang_swap {
    // packages: 包
    use sui::balance::{Self, Supply, Balance};
    use sui::table::{Self, Table};
    use sui::tx_context::{sender};
    use sui::coin::{Self, Coin};
    use sui::pay;

    // structs: 结构体
    // 流动性提供者(Liquidity Provider)
    // X和Y的币对
    public struct LP<phantom X, phantom Y> has drop {}

    // 流动性池子，放X和Y和两种币的总储备
    // 我们这个池子，1 CoinX = 2 CoinY
    public struct Pool<phantom X, phantom Y> has key {
        id: UID,
        coin_x: Balance<X>,
        coin_y: Balance<Y>,
        lp_supply: Supply<LP<X, Y>>
    }

    // 用户的钱包，来存储流水和该笔流水中的币的数额
    public struct Pocket has key, store {
        id: UID,
        table: Table<ID, vector<u64>>
    }
    // consts: 常量
    const ErrZeroAmount:u64 = 1;
    const ErrInvalidVecotrType:u64 = 2;
    const ErrNotEnoughXInPool: u64 = 3;
    const ErrNotEnoughYInPool: u64 = 4;
    const ErrBalanceNotMatch: u64 = 5;
    const ErrRemoveFailed: u64 = 6;
    const ErrXYPairNotMatch: u64 = 7;
    
    // functions: 函数
    // 初始化一个流动性池子，都是0；
    public fun new_pool<X, Y>(ctx: &mut TxContext) {
        let new_pool = Pool<X, Y> {
            id: object::new(ctx),
            coin_x: balance::zero(),
            coin_y: balance::zero(),
            lp_supply: balance::create_supply<LP<X, Y>>(LP{})
        };
        transfer::share_object(new_pool);
    }
    // 入口
    // 创建一个流动性池子
    public entry fun create_pool<X,Y>(ctx: &mut TxContext) {
        new_pool<X, Y>(ctx);
    }
    // 创建一个钱包，table 里面，每一个lp的代币的id，对应着币对的数值
    public entry fun create_pocket(ctx: &mut TxContext) {
        let new_pocket = Pocket {
            id: object::new(ctx),
            table: table::new<ID, vector<u64>>(ctx)
        };
        transfer::public_transfer(new_pocket, sender(ctx))
    }

    // 添加流动性，返回添加的lp的代币和该lp的代币对应的币对数值，正好可以放到pocket里
    public fun add_liquidity<X, Y>(pool: &mut Pool<X, Y>, coin_x: Coin<X>, coin_y: Coin<Y>, ctx: &mut TxContext): (Coin<LP<X,Y>>, vector<u64>) {
            let coin_x_value = coin::value(&coin_x);
            let coin_y_value = coin::value(&coin_y);
            assert!(coin_x_value > 0 && coin_y_value > 0, ErrZeroAmount);
            // 1 CoinX = 2 CoinY
            assert!((coin_y_value + coin_y_value) == coin_x_value, ErrXYPairNotMatch);
            //  添加CoinX到池子里的CoinX
            //  添加CoinY到池子里的CoinY
            coin::put(&mut pool.coin_x, coin_x);
            coin::put(&mut pool.coin_y, coin_y);
            // 更新lp的supply
            let lb_balance = balance::increase_supply(&mut pool.lp_supply, coin_x_value + coin_y_value);
            // 初始化一个数组，把X和Y的币对数值放到数组里
            let mut val_vector = vector::empty<u64>();
            vector::push_back(&mut val_vector, coin_x_value);
            vector::push_back(&mut val_vector, coin_y_value);
            (coin::from_balance(lb_balance, ctx), val_vector)
    }

    ///入口函数：把 Coin X 和 Y 存到池子里
    /// 添加成功后，把添加的lp的代币和该lp的代币对应的币对数值，放到pocket里
    /// 在把lp这个代币发送给用户
    public entry fun deposit_totally<X, Y>(pool: &mut Pool<X, Y>,
                                        coin_x: Coin<X>,
                                        coin_y: Coin<Y>,
                                        pocket: &mut Pocket,
                                        ctx: &mut TxContext) {
        let (lp, vec) = add_liquidity(pool, coin_x, coin_y, ctx);
        let lp_id = object::id(&lp);
        table::add(&mut pocket.table, lp_id, vec);
        transfer::public_transfer(lp, sender(ctx));
    }

    public entry fun deposit_partial<X, Y>(pool: &mut Pool<X, Y>,
                                        coin_x_vec: vector<Coin<X>>,
                                        amont_x: u64,
                                        coin_y_vec: vector<Coin<Y>>,
                                        amont_y: u64,
                                        pocket: &mut Pocket,
                                        ctx: &mut TxContext) {
        let mut coin_x_new = coin::zero<X>(ctx);
        pay::join_vec(&mut coin_x_new, coin_x_vec);
        let coin_x_in = coin::split(&mut coin_x_new, amont_x, ctx);
        let mut coin_y_new = coin::zero<Y>(ctx);
        pay::join_vec(&mut coin_y_new, coin_y_vec);
        let coin_y_in = coin::split(&mut coin_y_new, amont_y, ctx);
        let (lp, vec) = add_liquidity(pool, coin_x_in, coin_y_in, ctx);
        table::add(&mut pocket.table, object::id(&lp), vec);
        let sender_address = sender(ctx);
        transfer::public_transfer(lp, sender_address);
        transfer::public_transfer(coin_x_new, sender_address);
        transfer::public_transfer(coin_y_new, sender_address);
    }

    public entry fun remove_liquidity<X, Y>(pool: &mut Pool<X, Y>,
                                    lp: Coin<LP<X, Y>>,
                                    pocket: &mut Pocket,
                                    ctx: &mut TxContext) {
        let lp_id = object::id(&lp);
        // 根据lp的id，从钱包里找到对应的币对。
        let vec = *table::borrow(&pocket.table, lp_id);
        // 币对肯定有两个
        assert!(vector::length(&vec) == 2, ErrInvalidVecotrType);

        let lp_balance_value = coin::value(&lp);
        let coin_x_value = *vector::borrow(&vec, 0);
        let coin_y_value = *vector::borrow(&vec, 1);
        assert!(lp_balance_value == coin_x_value + coin_y_value, ErrBalanceNotMatch);
        assert!(balance::value(&pool.coin_x) > coin_x_value, ErrNotEnoughXInPool);
        assert!(balance::value(&pool.coin_y) > coin_y_value, ErrNotEnoughYInPool);
        // 把池子的supply减少该lp的数值
        balance::decrease_supply(&mut pool.lp_supply, coin::into_balance(lp));
        
        let coin_x_out = coin::take(&mut pool.coin_x, coin_y_value, ctx);
        let coin_y_out = coin::take(&mut pool.coin_y, coin_y_value, ctx);
        assert!(coin::value(&coin_x_out) > 0 && coin::value(&coin_y_out) > 0, ErrRemoveFailed);

        let mut vec_out = table::remove(&mut pocket.table, lp_id);
        vector::remove(&mut vec_out, 0);
        vector::remove(&mut vec_out, 1);

        // 将流动池资产中获得的 Coin X/Y 传输给发送人
        let sender_address = sender(ctx);
        transfer::public_transfer(coin_x_out, sender_address);
        transfer::public_transfer(coin_y_out, sender_address);
    }

    /// Swap Coin X to Y, return Coin Y
    /// eg 100 X 返回 200 Y
    public fun swap_x_out_to_y<X, Y>(pool: &mut Pool<X, Y>,
                                    paid_in: Coin<X>,
                                    ctx: &mut TxContext): Coin<Y> {
        let paid_value = coin::value(&paid_in);// 获取 Coin X 的数额
        coin::put(&mut pool.coin_x, paid_in); // 将 Coin X 的数额增加到流动池中，并销毁这枚 coin
        assert!((paid_value + paid_value) < balance::value(&pool.coin_y), ErrNotEnoughYInPool);
        coin::take(&mut pool.coin_y, paid_value + paid_value, ctx)// 从流动池中获取 Coin Y 并返回
    }

    public entry fun swap_x_to_y<X, Y>(pool: &mut Pool<X, Y>,
                                        coin_x_vec: vector<Coin<X>>,
                                        amount: u64,
                                        ctx: &mut TxContext) {
        let mut coin_x = coin::zero<X>(ctx); // 构造一个 0 数额的 Coin X: coin_x
        pay::join_vec<X>(&mut coin_x, coin_x_vec); // 将一组 Coin X 合并至上面新的 coin_x
        // 从 coin_x 中分离出数额为 amount 的 Coin:coin_x_in
        let coin_x_in = coin::split(&mut coin_x, amount, ctx);
        // 调用 swap_x_outto_y 函数，获取 Coin Y: coin_y_out
        let coin_y_out = swap_x_out_to_y(pool, coin_x_in, ctx);
        let sender_addres = sender(ctx);
        // 将 coin_y_out 和剩下的 coin_x 传输给发送人
        transfer::public_transfer(coin_x, sender_addres);
        transfer::public_transfer(coin_y_out, sender_addres);
    }

    ///swap Coin Y to X, return Coin X
    /// eg 100 Y 返回 50 X
    public fun swap_y_out_to_x<X, Y>(pool: &mut Pool<X, Y>,
                                    paid_in: Coin<Y>,
                                    ctx: &mut TxContext): Coin<X> {
        let paid_value = coin::value(&paid_in);// 获取 Coin Y 的数额
        coin::put(&mut pool.coin_y, paid_in);// 将 Coin Y 的数额增加到流动池中，并销毁这枚 coin
        assert!((paid_value / 2) < balance::value(&pool.coin_x), ErrNotEnoughXInPool);
        coin::take(&mut pool.coin_x, paid_value / 2, ctx) // 从流动池中获取 Coin X 并返回
    }

    public entry fun swap_y_to_x<X, Y>(pool: &mut Pool<X, Y>,
                                        coin_y_vec: vector<Coin<Y>>,
                                        amount: u64,
                                        ctx: &mut TxContext) {
        let mut coin_y = coin::zero<Y>(ctx); // 构造一个 0 数额的 Coin Y: coin_y
        pay::join_vec<Y>(&mut coin_y, coin_y_vec); // 将一组 Coin Y 合并至上面新的 coin_y
        // 从 coin_y 中分离出数额为 amount 的 Coin:coin_y_in
        // 这里不用判断amout是不是超过了coin_y的数额，split里面有判断
        let coin_y_in = coin::split(&mut coin_y, amount, ctx);
        // 调用 swap_y_into_x 函数，获取 Coin X: coin_x_out
        let coin_x_out = swap_y_out_to_x(pool, coin_y_in, ctx);
        let sender_addres = sender(ctx);
        // 将 coin_x_out 和剩下的 coin_y 传输给发送人
        transfer::public_transfer(coin_x_out, sender_addres);
        transfer::public_transfer(coin_y, sender_addres);
    }
}

