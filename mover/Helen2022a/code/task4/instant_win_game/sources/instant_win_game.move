//即时抽奖游戏
//奖池设立一、二、三等奖，一等奖奖励3倍抽奖金额，二等奖奖励2倍，三等奖奖励1倍
//未中奖者，抽奖金额充入奖池
module instant_win_game::instant_win_game{
    use sui::balance::{Self, Balance};
    use faucet_coin::faucet_coin::FAUCET_COIN;
    use sui::coin::{Coin, from_balance, into_balance};
    use sui::object::new;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;
    use sui::random::{Random, new_generator, generate_u8};

    //奖池金额不足
    const EGameInsufficientBalance: u64 = 1001;
    //奖池已抽完所有中奖数
    const EGameOver: u64 = 1002;

    // 定义 Instant_Win_Game 对象（即时抽奖），包含资金池和基本信息
    public struct Instant_Win_Game has key {
        id: UID,
        balance: Balance<FAUCET_COIN>,
        //一二三等奖的中奖数字
        win1_numbers: vector<u8>,
        win2_numbers: vector<u8>,
        win3_numbers: vector<u8>,
        //一二三等奖的奖励倍数
        win1_winning_times: u8,
        win2_winning_times: u8,
        win3_winning_times: u8,
        //已抽奖数字
        used_numbers: vector<u8>,
    }

    // 定义 Admin 对象，用于管理权限
    public struct Admin has key {
        id: UID,
    }

    // 初始化函数
    fun init(ctx: &mut TxContext) {
        let game_id = new(ctx);
        let admin_id = new(ctx);
        let mut win1_numbers_array: vector<u8> = vector::empty<u8>();
        let mut win2_numbers_array: vector<u8> = vector::empty<u8>();
        let mut win3_numbers_array: vector<u8> = vector::empty<u8>();
        let used_numbers_array: vector<u8> = vector::empty<u8>();
        //一等奖数字
        win1_numbers_array.push_back(5);
        //二等奖数字
        win2_numbers_array.push_back(3);
        win2_numbers_array.push_back(7);
        //三等奖数字
        win3_numbers_array.push_back(1);
        win3_numbers_array.push_back(4);
        win3_numbers_array.push_back(8);

        let game = Instant_Win_Game {
            id: game_id,
            balance: balance::zero(),
            win1_numbers: win1_numbers_array,
            win2_numbers: win2_numbers_array,
            win3_numbers: win3_numbers_array,
            win1_winning_times: 3,
            win2_winning_times: 2,
            win3_winning_times: 1,
            used_numbers: used_numbers_array
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
        game: &mut Instant_Win_Game,
        coin: Coin<FAUCET_COIN>,
        _ctx: &mut TxContext
    ) {
        // 用 into_balance 将coin转换为balance类型
        let in_balance = into_balance(coin);
        balance::join(&mut game.balance, in_balance);
    }

    // 用户取款，从Game资金池中提取指定数量的Coin
    public entry fun withdraw(
        game: &mut Instant_Win_Game,
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
        game: &mut Instant_Win_Game,
        // user_input_number: u8,
        user_coin: Coin<FAUCET_COIN>,
        rand: &Random,
        ctx: &mut TxContext
    ) {
        //首先判断奖池是否已经抽完
        let used_numbers_count = vector::length(&game.used_numbers);
        assert!(used_numbers_count < 10, EGameOver );

        // 检查资金池是否支付得起用户奖金，用户一次输入只能小于池子的十分之一，防止all in掏空资金池
        let coin_value = user_coin.value();
        let game_value = game.balance.value();
        assert!(game_value >= coin_value * 10, EGameInsufficientBalance);        

        // 如果该数字已经抽取过，则重新抽取   
        let mut user_choice = 100;     
        loop {
            let mut gen = new_generator(rand, ctx);        
            user_choice = generate_u8(&mut gen) % 10 + 1;

            if( ! isInThisArray(user_choice, game.used_numbers)) {
                break               
            };            
        };   

        assert!(user_choice < 100, EGameOver); 

        // 判断中奖逻辑        
        if(isInThisArray(user_choice, game.win1_numbers)) {
            let times = game.win1_winning_times;
            deliverBonus(game, user_coin, times, user_choice, ctx);
        } else if(isInThisArray(user_choice, game.win2_numbers)) {
            let times = game.win2_winning_times;
            deliverBonus(game, user_coin, times, user_choice, ctx);
        } else if(isInThisArray(user_choice, game.win3_numbers)) {
            let times = game.win3_winning_times;
            deliverBonus(game, user_coin, times, user_choice, ctx);
        } else {
            // 用户抽奖失败，损失代币存入资金池
            deposit(game, user_coin, ctx);
        };
    }

    /// 发放奖金
    #[allow(lint(self_transfer))]
    fun deliverBonus(game: &mut Instant_Win_Game,
                        user_coin: Coin<FAUCET_COIN>,
                        times: u8,
                        user_choice: u8,
                        ctx: &mut TxContext) {

        let coin_value = user_coin.value();
        let reward_balance = game.balance.split(coin_value * (times as u64));
        let reward_coin = from_balance(reward_balance, ctx);
        //数字放入已抽奖数字池子
        game.used_numbers.push_back(user_choice);

        public_transfer(reward_coin, ctx.sender());

        // 将赌注也退回去
        public_transfer(user_coin, ctx.sender());
    }

    //判断数字是否在该数组中
    fun isInThisArray(
        num: u8,
        array: vector<u8>
    ) : bool {
        let mut i = 0;
        let mut found = false;
        let array_length = vector::length(&array);
        while (i < array_length) {
            if (vector::borrow(&array, i) == num) {
                found = true;
                break
            };
            i = i + 1;
        };
        found
    }
}

