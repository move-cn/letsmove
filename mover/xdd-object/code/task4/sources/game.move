module task4::game {
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::Coin;
    use sui::object;
    use sui::object::UID;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{transfer, share_object, public_transfer};
    use sui::tx_context::TxContext;
    use xdd_object_faucet::xdd_object_faucet::XDD_OBJECT_FAUCET;

    const PramsGt5:u64 = 0x1001;
    const PramsGtPool:u64 = 0x1002;

    //游戏奖池
    public struct GamePool has key{
        id: UID,
        //奖池余额
        pool: Balance<XDD_OBJECT_FAUCET>
    }

    //权限
    public struct AdminCap has key{
        id:UID
    }

    //初始化游戏数据
    fun init(ctx: &mut TxContext) {
        //创建管理员权限
        let adminCap = AdminCap{id: object::new(ctx)};

        //创建游戏奖池
        let gamePool = GamePool{
            id: object::new(ctx),
            pool: balance::zero()
        };

        //将游戏管理员权限给自己
        transfer(adminCap, ctx.sender());

        //将奖池权限分享出去
        share_object(gamePool);
    }


    //玩游戏
    public entry fun play(gamePool: &mut GamePool, in: bool, amount: Coin<XDD_OBJECT_FAUCET>, rand: &Random, ctx: &mut TxContext) {
        //校验金额不能大于5
        let amt = amount.value();
        assert!(amt <= 5000000000, PramsGt5);

        //金额不能大于奖池
        let poolAmt = gamePool.pool.value();
        assert!(amt <= poolAmt, PramsGtPool);

        let mut gen = random::new_generator(rand, ctx);
        let ranFlag = random::generate_bool(&mut gen);

        if (in == ranFlag){
            //用户赢到的钱
            let win = gamePool.pool.split(amount.value());
            //将balance转成代币
            let winCoin = coin::from_balance(win, ctx);
            //将赢到的代币转给参与者
            public_transfer(winCoin, ctx.sender());
            //将用户参与的金额还回去
            public_transfer(amount, ctx.sender());
        }else { //输了
            //将用户参与的金额存入奖池
            gamePool.pool.join(coin::into_balance(amount));
        }





    }




    //给奖池增加金额
    public entry fun add_game_pool(gamePool: &mut GamePool, amount: Coin<XDD_OBJECT_FAUCET>, _ctx: &mut TxContext) {
        //将代币转换吃balance
        let userAmount = coin::into_balance(amount);

        //将balance存到游戏奖池
        gamePool.pool.join(userAmount);
    }


    //将奖池金额取出
    public entry fun get_game_pool(_: &AdminCap, gamePool: &mut GamePool, amount: u64, ctx: &mut TxContext) {
        //从奖池取出的余额
        let takeAmount = gamePool.pool.split(amount);

        //将余额转成代币
        let xddCoin = coin::from_balance(takeAmount, ctx);

        //将代币转给自己
        public_transfer(xddCoin, ctx.sender());
    }




}
