module flip_coin::flip_coin {
    use sui::balance::{Self, Balance};
    use my_coin::faucet_mason::FAUCET_MASON;
    use sui::coin;
    use sui::coin::{Coin, from_balance, into_balance};
    use sui::object::new;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;
    use sui::random;
    use sui::random::{Random, new_generator, generate_u8};
    use sui::random::generate_bool;

    // const EUserInsufficientBalance: u64 = 1000;
    const EGameInsufficientBalance: u64 = 1001;

    // 定义 Game 对象，包含资金池和基本信息
    public struct Game has key {
        id: UID,
        balance: Balance<FAUCET_MASON>,
    }

    // 定义 Admin 对象，用于管理权限
    public struct Admin has key {
        id: UID,
    }

    // 初始化函数
    fun init(ctx: &mut TxContext) {
        let game_id = new(ctx);
        let admin_id = new(ctx);

        let game = Game {
            id: game_id,
            balance: balance::zero(),
        };
        let admin = Admin {
            id: admin_id,
        };

        // 让所有人玩这个游戏
        share_object(game);
        // 将取款权限给部署者
        transfer(admin, sender(ctx));

    }

    // 用户存款，将Coin代币加入到Game的资金池中
    public entry fun deposit(
        game: &mut Game,
        coin: Coin<FAUCET_MASON>,
        _ctx: &mut TxContext
    ) {
        // 用 into_balance 将coin转换为balance类型
        let in_balance = into_balance(coin);
        balance::join(&mut game.balance, in_balance);
    }

    // 用户取款，从Game资金池中提取指定数量的Coin
    public entry fun withdraw(
        game: &mut Game,
        _: &Admin,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(game.balance.value() >= amount, EGameInsufficientBalance );
        // 用 from_balance 将balance转换为coin类型
        let withdrawn_balance = balance::split(&mut game.balance, amount);
        let withdrawn_coin = from_balance(withdrawn_balance, ctx);
        public_transfer(withdrawn_coin, sender(ctx));
    }

    /// 用户参与游戏逻辑
    entry fun play(
        game: &mut Game,
        user_choice: bool,
        user_coin: Coin<FAUCET_MASON>,
        rand: &Random,
        ctx: &mut TxContext
    ) {
        // 检查资金池是否支付的起用户金额，用户一次输入只能小于池子的十分之一，防止all in掏空资金池
        let coin_value = user_coin.value();
        let game_value = game.balance.value();
        assert!(game_value >= coin_value * 10, EGameInsufficientBalance);

        // 生成一个随机bool值
        let mut gen = new_generator(rand, ctx);
        let game_choice = generate_bool(&mut gen);

        // 判断胜负逻辑
        if (user_choice == game_choice) {
            // 用户胜利，奖励翻倍的代币
            let reward_balance = game.balance.split(coin_value);
            let reward_coin = from_balance(reward_balance, ctx);
            public_transfer(reward_coin, ctx.sender());

            // 将原来输入的也退回去
            public_transfer(user_coin, ctx.sender());
        } else {
            // 用户失败，损失代币存入资金池
            deposit(game, user_coin, ctx);
        }
    }
}
