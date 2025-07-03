module game_beta::game_beta {
    use std::string::String;
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::Coin;
    use sui::random;
    use sui::random::Random;
    // 代币类型（假设已在 Move.toml 中配置）
    use task2_coin::oiia_faucet::OIIA_FAUCET;

    // 游戏对象
    public struct FlipGame has key {
        id: object::UID,
        balance: Balance<OIIA_FAUCET>,
    }

    // 管理员
    public struct Admin has key {
        id: object::UID,
        name: String,
    }

    // 初始化函数
    fun init(ctx: &mut TxContext) {
        // 初始化一个游戏对象
        let flipgame = FlipGame {
            id: object::new(ctx),
            balance: balance::zero<OIIA_FAUCET>(),
        };
        // 初始化一个管理员对象，管理员名字是 SherVite
        let admin = Admin {
            id: object::new(ctx),
            name: b"SherVite".to_string(),
        };
        // 发布者拥有管理员对象
        transfer::transfer(admin, tx_context::sender(ctx));
        // 共享所有权，保证所有人都可以玩
        transfer::share_object(flipgame);
    }

    // 存款
    const EUserInsufficientBalance: u64 = 1000;
    public entry fun Deposit(
        flipgame: &mut FlipGame,
        in_coin: &mut Coin<OIIA_FAUCET>,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        assert!(
            coin::value(in_coin) >= amount,
            EUserInsufficientBalance
        );
        let split_coin = coin::split(in_coin, amount, ctx);
        let split_balance = coin::into_balance(split_coin);
        balance::join(&mut flipgame.balance, split_balance);
    }

    // 取款，只有管理员操作
    const EGameInsufficientBalance: u64 = 1001;
    public entry fun Withdraw(
        flipgame: &mut FlipGame,
        _: &Admin,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        assert!(
            balance::value(&flipgame.balance) >= amount,
            EGameInsufficientBalance
        );
        let out_balance = balance::split(&mut flipgame.balance, amount);
        let out_coin = coin::from_balance(out_balance, ctx);
        transfer::public_transfer(out_coin, tx_context::sender(ctx));
    }

    // 开始游戏
    entry fun Play(
        flipgame: &mut FlipGame,
        rnd: &Random,
        guess: bool,
        in_coin: &mut Coin<OIIA_FAUCET>,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        // 检查合约账户余额是否充足
        assert!(
            balance::value(&flipgame.balance) >= amount,
            EGameInsufficientBalance
        );
        // 检查用户的余额是否充足
        assert!(
            coin::value(in_coin) >= amount,
            EUserInsufficientBalance
        );
        // 用户的投入不能超过游戏账户的10%
        assert!(
            amount * 10 <= balance::value(&flipgame.balance),
            EGameInsufficientBalance
        );

        // 生成随机数并判断结果
        let mut gen = random::new_generator(rnd, ctx);
        let random_value = random::generate_u8(&mut gen);
        let flag = random_value % 2 == 0; // true/false 判断

        // 如果获胜
        if (flag == guess) {
            // 从游戏余额中取出奖励
            let reward_balance = balance::split(&mut flipgame.balance, amount);
            let reward_coin = coin::from_balance(reward_balance, ctx);
            // 转移奖励给玩家
            transfer::public_transfer(reward_coin, tx_context::sender(ctx));
        } else {
            // 玩家失败，代币存入游戏余额
            Deposit(flipgame, in_coin, amount, ctx);
        }
    }
}