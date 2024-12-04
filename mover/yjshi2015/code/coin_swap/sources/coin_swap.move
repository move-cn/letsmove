module coin_swap::coin_swap {

    use sui::balance::{ Self, Balance };
    use sui::vec_map::{ Self, VecMap };
    use sui::coin::{ Self, Coin };
    #[test_only]
    use sui::test_scenario;
    #[test_only]
    use std::debug;

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

    #[test_only]
    public struct TokenA has drop{}
    #[test_only]
    public struct TokenB has drop{}

    #[test]
    fun test_swap() {

        let owner = @1000;
        let alice = @1001;

        // 初始化 token，并分配给 Alice 和 owner 
        let mut scenario = test_scenario::begin(alice);
        {
            let mut tokenA = coin::mint_for_testing<TokenA>(10000, scenario.ctx());
            let mut tokenB = coin::mint_for_testing<TokenB>(10000, scenario.ctx());

            tokenA.split_and_transfer(1000, alice, scenario.ctx());
            tokenB.split_and_transfer(1000, alice, scenario.ctx());

            transfer::public_transfer(tokenA, owner);
            transfer::public_transfer(tokenB, owner);
        };

        // 初始化模块
        scenario.next_tx(owner);
        {
            init(scenario.ctx());
            debug::print(&scenario.sender());
        };        
        
        // 创建池子
        scenario.next_tx(owner);
        {
            let admCap = scenario.take_from_sender<AdmCap>();
            create_pool<TokenA, TokenB>(&admCap, scenario.ctx());
            scenario.return_to_sender(admCap);
        };

        // 添加流动性
        scenario.next_tx(owner);
        {
            // 获取池子
            let mut pool = scenario.take_shared<Pool<TokenA, TokenB>>();
            assert!(&pool.balance0.value() == 0, 1);
            assert!(&pool.balance1.value() == 0, 1);

            // 获取 owner 的代币，各拿 2000 个用来添加流动性
            let mut tokenA = scenario.take_from_sender<Coin<TokenA>>();
            let mut tokenB = scenario.take_from_sender<Coin<TokenB>>();
            add_liq<TokenA, TokenB>(tokenA.split(2000, scenario.ctx()), tokenB.split(2000, scenario.ctx()), &mut pool, scenario.ctx());

            assert!(pool.balance0.value() == 2000, 2);
            assert!(pool.balance1.value() == 2000, 2);
            debug::print(&2);
            test_scenario::return_shared(pool);
            scenario.return_to_sender(tokenA);
            scenario.return_to_sender(tokenB);
        };

        // swap tokenA -> tokenB
        scenario.next_tx(alice);
        {
            let mut tokenA = scenario.take_from_sender<Coin<TokenA>>();
            let mut pool = scenario.take_shared<Pool<TokenA, TokenB>>();
            // alice 用 100 个 TokenA 置换出 100 个 TokenB
            swap_x2y(tokenA.split(100, scenario.ctx()), &mut pool, scenario.ctx());

            scenario.return_to_sender(tokenA);
            test_scenario::return_shared(pool);
        };

        // verify swap result
        scenario.next_tx(alice);
        {
            let pool = scenario.take_shared<Pool<TokenA, TokenB>>();
          
            // alice 此时最新的 tokenB 代币为 100 个，实际总共 1100 个
            let tokenB = scenario.take_from_sender<Coin<TokenB>>();
            debug::print(&3);
            debug::print(&tokenB.value());
            assert!(&tokenB.value() == 100, 3);

            // 池子中 tokenA 增加 100 个， tokenB 减少 100 个
            assert!(&pool.balance0.value() == 2100, 4);
            assert!(&pool.balance1.value() == 1900, 4);

            scenario.return_to_sender(tokenB);
            test_scenario::return_shared(pool);
        };
        
        scenario.end();
    }
    
}
