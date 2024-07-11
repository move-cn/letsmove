// Module: zhaoxilingcheng_game
module zhaoxilingcheng_game::zhaoxilingcheng_game  {
    // 导入标准库的字符串模块
    use std::string::{Self, String};
    use std::vector;
    // 导入Sui的时钟模块
    use sui::clock::{Self, Clock};
    // 导入Sui的事件模块
    use sui::event;
    // 导入Sui的余额模块
    use sui::balance::{Self, Balance};
    // 导入Sui的硬币模块
    use sui::coin::{Self, Coin, TreasuryCap};
    // 导入Sui的对象模块
    use sui::object;
    // 导入Sui的转移模块
    use sui::transfer;
    // 导入Sui的交易上下文模块
    use sui::tx_context::sender;

    // 错误码定义
    // EInvalidNumber 表示无效的数字选择
    const EInvalidNumber: u64 = 0;
    // EPoolNotEnough 表示池子余额不足
    const EPoolNotEnough: u64 = 1;
    // EInputNotEnough 表示输入金额不足
    const EInputNotEnough: u64 = 2;

    // 定义游戏结果结构体，具有复制和删除的特性
    public struct GameResult has copy, drop {
        your_choice: String,  // 玩家选择
        dice_points: u8,   // 筛子数
        result: String,       // 结果（Win, Lose）
        is_winner: bool,      // 是否获胜
    }

    // 定义游戏结构体，具有键值的特性
    // phantom T 表示一个占位符类型，用于通用余额
    public struct Game<phantom T> has key {
        id: UID,             // 游戏ID
        pool: Balance<T>,    // 游戏池子余额
        ticket: u64,         // 游戏门票价格
        reward: u64,         // 游戏奖励金额
    }

    // 获取游戏池子的余额
    public fun game_pool<T>(game: &Game<T>): u64 {
        balance::value(&game.pool)
    }

    // 获取游戏门票价格
    public fun game_ticket<T>(game: &Game<T>): u64 {
        game.ticket
    }

    // 获取游戏奖励金额
    public fun game_reward<T>(game: &Game<T>): u64 {
        game.reward
    }

    // 定义管理员权限结构体，具有键值的特性
    public struct AdminCap has key {
        id: UID,
    }

    // 初始化函数，当前未实现
    fun init(ctx: &mut TxContext) {
    }

    // 创建游戏函数，初始化游戏和管理员对象并转移给调用者
    entry fun creat_game<T>(ctx: &mut TxContext) {
        let game = Game<T> {
            id: object::new(ctx),             // 创建一个新的游戏ID
            pool: balance::zero<T>(),         // 初始化游戏池子余额为零
            ticket: 100_000_000,              // 设置游戏门票价格为 100_000_000
            reward: 200_000_000,              // 设置游戏奖励金额为 200_000_000
        };
        transfer::share_object(game);          // 共享游戏对象

        let admin_cap = AdminCap { id: object::new(ctx) };  // 创建一个新的管理员ID
        transfer::transfer(admin_cap, sender(ctx));         // 将管理员对象转移给调用者
    }

    // 根据当前时间生成一个骰子数[1-6]
    fun get_dice_points(clock: &Clock) : u8 {
        (((clock::timestamp_ms(clock) % 6) + 1 ) as u8)
    }

    // 将数字选择映射为对应的字符串（Small, Big）
    fun map_choice_to_string(choice: u8) : String {
        if (choice == 0) {
            string::utf8(b"Small")
        } else if (choice == 1) {
            string::utf8(b"Big")
        } else {
            string::utf8(b"Invalid")
        }
    }

    // 玩游戏函数，处理游戏逻辑、确定结果并发放奖励
    public entry fun play<T>(choice: u8, game: &mut Game<T>, input: Coin<T>, clock: &Clock, ctx: &mut TxContext) {
        // 检查游戏池的余额是否足够支付奖励金额减去门票价格
        assert!(balance::value(&game.pool) >= game.reward - game.ticket, EPoolNotEnough);

        // 检查玩家的选择是否在有效范围内（0:小, 1:大）
        assert!(choice < 2, EInvalidNumber);

        let input_value = coin::value(&input); // 获取输入硬币的值
        // 检查输入的硬币值是否大于等于门票价格
        assert!(input_value >= game.ticket, EInputNotEnough);

        let mut input_balance = coin::into_balance(input); // 将输入硬币转化为余额
        if (input_value > game.ticket) { // 如果输入值大于门票价格
            // 将超出部分加入游戏池
            balance::join(
                &mut game.pool,
                balance::split(&mut input_balance, game.ticket)
            );
            // 将剩余部分作为找零退还给玩家
            let change = coin::from_balance(input_balance, ctx);
            transfer::public_transfer(change, sender(ctx));
        } else { // 如果输入值等于门票价格
            // 将全部输入加入游戏池
            balance::join(&mut game.pool, input_balance);
        };

        // 生成NPC的随机选择
        let dice_points = get_dice_points(clock);
        // 根据玩家和NPC的选择确定结果和是否获胜
        let (result, is_winner) = if (
            (choice == 0 && dice_points < 4) || (choice == 1 && dice_points > 3)
        ) {
            (string::utf8(b"Win"), true)
        } else {
            (string::utf8(b"Lose"), false)
        };

        // 如果玩家获胜，发放奖励
        if (is_winner) {
            let reward_balance = balance::split(&mut game.pool, game.reward);
            let reward = coin::from_balance(reward_balance, ctx);
            transfer::public_transfer(reward, sender(ctx));
        };

        // 触发游戏结果事件
        event::emit(GameResult {
            your_choice: map_choice_to_string(choice),
            dice_points,
            result,
            is_winner,
        });
    }

    // 存款函数，向游戏池中存入资金
    public entry fun deposit<T>(game: &mut Game<T>, input: Coin<T>, amount: u64, ctx: &mut TxContext) {
        let input_value = coin::value(&input); // 获取输入硬币的值
        // 检查输入的硬币值是否大于等于存款金额
        assert!(input_value >= amount, EInputNotEnough);

        let mut input_balance = coin::into_balance(input); // 将输入硬币转化为余额
        if (input_value > amount) { // 如果输入值大于存款金额
            // 将存款金额加入游戏池
            balance::join(
                &mut game.pool,
                balance::split(&mut input_balance, amount)
            );
            // 将剩余部分作为找零退还给玩家
            let change = coin::from_balance(input_balance, ctx);
            transfer::public_transfer(change, sender(ctx));
        } else { // 如果输入值等于存款金额
            // 将全部输入加入游戏池
            balance::join(&mut game.pool, input_balance);
        }
    }

    // 取款函数，管理员从游戏池中提取资金
    public entry fun withdraw<T>(_: &AdminCap, game: &mut Game<T>, amount: u64, ctx: &mut TxContext) {
        // 从游戏池中分离出指定金额
        let output_balance = balance::split(&mut game.pool, amount);
        // 将分离出的金额转化为硬币
        let output = coin::from_balance(output_balance, ctx);
        // 将硬币转移给管理员
        transfer::public_transfer(output, sender(ctx));
    }

    // 设置游戏门票价格函数
    public entry fun set_ticket<T>(_: &AdminCap, game: &mut Game<T>, ticket: u64, _: &mut TxContext) {
        game.ticket = ticket; // 更新游戏的门票价格
    }

    // 设置游戏奖励金额函数
    public entry fun set_reward<T>(_: &AdminCap, game: &mut Game<T>, reward: u64, _: &mut TxContext) {
        game.reward = reward; // 更新游戏的奖励金额
    }
}
