/// Module: game
module game::game {
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin};
    use sui::object;
    use sui::object::UID;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, transfer, public_transfer};
    use my_coin::faucet_procarihana::{FAUCET_PROCARIHANA};

    const ErrorCode01: u64 = 1;
    const ErrorCode02: u64 = 2;

    // 权限
    public struct AdminCap has key {
        id: UID
    }

    // 奖池游戏数据
    public struct GamePool has key {
        id: UID,
        amount: Balance<FAUCET_PROCARIHANA>
    }

    fun init(ctx: &mut TxContext) {
        // 创建管理员权限
        let adminCap = AdminCap {
            id: object::new(ctx)
        };
        // 将管理员权限给自己
        transfer(adminCap, ctx.sender());
        // 创建奖池
        let gamePool = GamePool {
            id: object::new(ctx),
            amount: balance::zero()
        };
        // 共享奖池
        share_object(gamePool);
    }

    //用户玩游戏，赢了双倍奖励
    public entry fun play(
        // 使用 task2 FAUCET Coin
        in_coin: &mut Coin<FAUCET_PROCARIHANA>,
        // 奖池
        pool: &mut GamePool,
        // 目标
        in: bool,
        // 0x8 rand 地址
        rand: &Random,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(in_coin.value() > amount, ErrorCode02);
        // 校验金额不能超过奖池的金额
        assert!(amount <= pool.amount.value(), ErrorCode01);
        let mut gen = random::new_generator(rand, ctx);
        // 生成随机值bool
        let ranRes = random::generate_bool(&mut gen);
        if (ranRes == in) {
            // 赢
            let out_balance = pool.amount.split(amount);
            let out_coin = coin::from_balance(out_balance, ctx);
            // 把钱转回去给用户
            public_transfer(out_coin, ctx.sender());
        } else {
            // 输
            let split_coin = coin::split(in_coin, amount, ctx);
            let split_balance = coin::into_balance(split_coin);
            pool.amount.join(split_balance);
        }
    }

    // 管理员往奖池补充
    public entry fun save_coin(
        // 管理员权限才可以补充
        _: &AdminCap,
        in_coin: &mut Coin<FAUCET_PROCARIHANA>,
        pool: &mut GamePool,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(in_coin.value() > amount, ErrorCode02);
        let split_coin = coin::split(in_coin, amount, ctx);
        let split_balance = coin::into_balance(split_coin);
        pool.amount.join(split_balance);
    }

    // 取出所有代币
    public entry fun get_coin(_: &AdminCap, pool: &mut GamePool, amount: u64, ctx: &mut TxContext) {
        // 金额不能大于奖池的金额
        assert!(amount <= pool.amount.value(), ErrorCode01);
        let out_balance = pool.amount.split(amount);
        let out_coin = coin::from_balance(out_balance, ctx);
        public_transfer(out_coin, ctx.sender());
    }
}