module rock_paper_scissors::rock_paper_scissors{
    use sui::balance::{Self, Balance};
    use my_coin::huahuahua1223_faucet_coin::HUAHUAHUA1223_FAUCET_COIN;
    use sui::coin;
    use sui::coin::{Coin, from_balance, into_balance};
    use sui::object::new;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;
    use sui::random;
    use sui::random::{Random, new_generator, generate_u8};

    // const EUserInsufficientBalance: u64 = 1000;
    const EGameInsufficientBalance: u64 = 1001;

    // 定义 Game 对象，包含资金池和基本信息
    public struct Game has key {
        id: UID,
        balance: Balance<HUAHUAHUA1223_FAUCET_COIN>,
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
        coin: Coin<HUAHUAHUA1223_FAUCET_COIN>,
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
        user_choice: u8,
        user_coin: Coin<HUAHUAHUA1223_FAUCET_COIN>,
        rand: &Random,
        ctx: &mut TxContext
    ) {
        // 检查资金池是否支付的起用户金额，用户一次输入只能小于池子的十分之一，防止all in掏空资金池
        let coin_value = user_coin.value();
        let game_value = game.balance.value();
        assert!(game_value >= coin_value * 10, EGameInsufficientBalance);

        // 游戏生成随机选择 (0: 剪刀 scissors, 1: 石头 rock, 2: 布 paper)
        let mut gen = new_generator(rand, ctx);
        let game_choice = generate_u8(&mut gen) % 3;

        // 判断胜负逻辑
        if (is_winner(user_choice, game_choice)) {
            // 用户胜利，奖励翻倍的代币
            let reward_balance = game.balance.split(coin_value);
            let reward_coin = from_balance(reward_balance, ctx);
            public_transfer(reward_coin, ctx.sender());

            // 将原来输入的也退回去
            public_transfer(user_coin, ctx.sender());
        } else if (is_winner(game_choice, user_choice)) {
            // 用户失败，损失代币存入资金池
            deposit(game, user_coin, ctx);
        } else {
            // 平局，退还用户代币
            public_transfer(user_coin, ctx.sender());
        }
    }

    /// 判断是否获胜 (0: 剪刀, 1: 石头, 2: 布)
    public fun is_winner(player1: u8, player2: u8): bool {
        (player1 == 0 && player2 == 2) || // 剪刀胜布
        (player1 == 1 && player2 == 0) || // 石头胜剪刀
        (player1 == 2 && player2 == 1)    // 布胜石头
    }
}

