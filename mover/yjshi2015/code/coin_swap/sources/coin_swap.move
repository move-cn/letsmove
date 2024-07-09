module coin_swap::coin_swap {

    use sui::balance::{ Self, Balance };
    use sui::vec_map::{ Self, VecMap };
    use sui::coin::{ Self, Coin };

    /*
     * 创建池子
     * 添加流动性
     * 移除流动性
     * swap
     */
    public struct Pool<phantom X, phantom Y> has key, store{
        id: UID,
        balance0: Balance<X>,
        balance0_map: VecMap<address, u64>,
        balance1: Balance<Y>,
        balance1_map: VecMap<address, u64>,
        owner: address,
    }

    public struct AdmCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let admCap = AdmCap {
            id: object::new(ctx),
        };
        transfer::transfer(admCap, ctx.sender());
    }

    // 创建一个空的流动性池子
    public entry fun create_pool<X, Y>(_: &AdmCap, ctx: &mut TxContext) {
        let pool = Pool<X,Y> {
            id: object::new(ctx),
            balance0: balance::zero(),
            balance0_map: vec_map::empty(),
            balance1: balance::zero(),
            balance1_map: vec_map::empty(),
            owner: ctx.sender(),
        };

        transfer::share_object(pool);
    }

    // 添加流动性，并通过 vec_map 记录添加到数量
    public entry fun add_liq<X,Y>(coin0: Coin<X>, coin1: Coin<Y>, pool: &mut Pool<X,Y>, ctx: &mut TxContext) {
        assert!(coin0.value() > 0 && coin1.value() > 0, 1);
        pool.balance0_map.insert(ctx.sender(), coin0.value());
        pool.balance0.join(coin0.into_balance());
        pool.balance1_map.insert(ctx.sender(), coin1.value());
        pool.balance1.join(coin1.into_balance());
    }

    // 移除流动性，首先判断之前存入的金额是否大于本次提取的金额
    public entry fun remove_liq<X,Y>(coin0_amount: u64, coin1_amount: u64, pool: &mut Pool<X,Y>, ctx: &mut TxContext) {
        // 判断是否超额领取
        let coin0_balance = pool.balance0.value();
        let coin1_balance = pool.balance1.value();
        assert!(coin0_balance >= coin0_amount && coin1_balance >= coin1_amount, 2);

        // 生成移除的 coin0 & coin1
        let coin0 = coin::take(&mut pool.balance0, coin0_amount, ctx);
        let coin1 = coin::take(&mut pool.balance1, coin1_amount, ctx);

        // 更新移除账户的 coin0 余额
        let coin0_old = pool.balance0_map.get_mut(&ctx.sender());
        *coin0_old = *coin0_old - coin0_amount;
        let coin1_old = pool.balance1_map.get_mut(&ctx.sender());
        *coin1_old = *coin1_old - coin1_amount;

        // 将移除的 coin 转给 sender
        transfer::public_transfer(coin0, ctx.sender());
        transfer::public_transfer(coin1, ctx.sender());
    }

    // 将 coin0 按照 1:1 兑换成 coin1
    public entry fun swap_x2y<X,Y>(coin0: Coin<X>, pool: &mut Pool<X,Y>, ctx: &mut TxContext) {
        // coin1 必须要足够
        let coin0_amount = coin0.value();
        let coin1_balance = pool.balance1.value();
        assert!(coin1_balance >= coin0_amount, 3);

        // 池子中 coin0 增加
        pool.balance0.join(coin0.into_balance());

        // 按照 1:1 比例减少池子中 coin1 代币，并将其转移给 sender
        let coin1 = coin::take(&mut pool.balance1, coin0_amount, ctx);
        transfer::public_transfer(coin1, ctx.sender());
    }

    public entry fun swap_y2x<X,Y>(coin1: Coin<Y>, pool: &mut Pool<X,Y>, ctx: &mut TxContext) {
        // coin0 必须足够
        let coin1_amount = coin1.value();
        let coin0_balance = pool.balance0.value();
        assert!(coin0_balance >= coin1_amount, 4);

        // 池子中 coin1 增加
        pool.balance1.join(coin1.into_balance());

        // 按照1:1 比例减少池子中的 coin0 代币，并将其转移给 sender
        let coin0 = coin::take(&mut pool.balance0, coin1_amount, ctx);
        transfer::public_transfer(coin0, ctx.sender());
    }
    
}
