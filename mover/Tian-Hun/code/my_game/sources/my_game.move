/// Module: my_game
module my_game::rock_paper_scissors {
    use sui::balance::{Self, Balance};
    use sui::clock;
    use sui::clock::Clock;
    use sui::coin::{Self, Coin};
    use sui::event;
    use faucet_coin::tianhun_faucet_coin::{TIANHUN_FAUCET_COIN};

    // 游戏选择
    const ROCK: u8 = 0;
    const PAPER: u8 = 1;
    const SCISSORS: u8 = 2;

    // 游戏结果
    const PLAYER_WIN: u8 = 1;
    const COMPUTER_WIN: u8 = 2;
    const TIE: u8 = 3;

    // 错误码
    // 无效选择
    const EInvalidChoice: u64 = 0;
    // 无效下注金额
    const EInvalidBetAmount: u64 = 1;
    // 余额不足
    const EInsufficientBalance: u64 = 2;

    // 游戏资金池
    public struct GamePool has key {
        id: UID,
        balance: Balance<TIANHUN_FAUCET_COIN>,
    }

    // 游戏结果事件
    public struct GameResult has copy, drop {
        player: address,
        player_choice: u8,
        computer_choice: u8,
        result: u8,
        amount: u64,
    }

    // 管理员 - 用于初始化游戏资金池和提取资金
    public struct AdminCap has key {
        id: UID,
    }

    // 初始化游戏资金池
    fun init(ctx: &mut TxContext) {
        let game_pool = GamePool {
            id: object::new(ctx),
            balance: balance::zero(),
        };
        let admin_cap = AdminCap {
            id: object::new(ctx),
        };
        transfer::share_object(game_pool);
        transfer::transfer(admin_cap, ctx.sender());
    }

    // 存入代币到游戏资金池
    public entry fun deposit(pool: &mut GamePool, coin: Coin<TIANHUN_FAUCET_COIN>, ctx: &mut TxContext) {
        let value = coin.value();
        pool.balance.join(coin::into_balance(coin));
        event::emit(DepositEvent {
            user: ctx.sender(),
            amount: value,
        });
    }

    // 从游戏资金池取出代币
    public entry fun withdraw(_: &AdminCap, pool: &mut GamePool, amount: u64, ctx: &mut TxContext) {
        let coin = coin::take(&mut pool.balance, amount, ctx);
        transfer::public_transfer(coin, ctx.sender());
        event::emit(WithdrawEvent {
            user: ctx.sender(),
            amount
        });
    }

    fun generate_random_number(ctx: &TxContext, clock: &Clock): u8 {
        let tx_hash = ctx.digest();
        let timestamp = clock::timestamp_ms(clock);
        let random_seed = timestamp ^ (tx_hash[0] as u64);
        ((random_seed % 3) as u8)
    }

    // 玩游戏
    public entry fun play(
        pool: &mut GamePool,
        bet_coin: Coin<TIANHUN_FAUCET_COIN>,
        bet_amount: u64,
        player_choice: u8,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        assert!(player_choice <= 2, EInvalidChoice); // 确保玩家选择有效
        assert!(bet_amount > 0, EInvalidBetAmount); // 确保下注金额大于0
        assert!((pool.balance.value() * 2) >= bet_amount, EInsufficientBalance); // 确保余额充足

        // 验证下注代币价值是否 >= 下注金额
        let bet_coin_value = bet_coin.value();
        assert!(bet_coin_value >= bet_amount, EInvalidBetAmount);

        // 生成电脑的选择
        let computer_choice = generate_random_number(ctx, clock);

        // 判断游戏结果
        let result = if (player_choice == computer_choice) {
            TIE
        } else if (
            player_choice == ROCK && computer_choice == SCISSORS ||
            player_choice == PAPER && computer_choice == ROCK ||
            player_choice == SCISSORS && computer_choice == PAPER
        ) {
            PLAYER_WIN
        } else {
            COMPUTER_WIN
        };

        let mut bet_balance = coin::into_balance(bet_coin);

        if (bet_coin_value > bet_amount) {
            // 如果下注代币价值大于下注金额，则将剩余代币价值退还给玩家
            pool.balance.join(bet_balance.split(bet_amount));

            let refund_coin = coin::from_balance(bet_balance, ctx);
            transfer::public_transfer(refund_coin, ctx.sender());
        } else {
            pool.balance.join(bet_balance);
        };

        // 处理奖励
        if (result == PLAYER_WIN) {
            let reward = coin::take(&mut pool.balance, bet_amount * 2, ctx);
            transfer::public_transfer(reward, ctx.sender());
        };

        // 发出游戏结果事件
        event::emit(GameResult {
            player: ctx.sender(),
            player_choice,
            computer_choice,
            result,
            amount: bet_amount,
        });
    }

    // 存款事件
    public struct DepositEvent has copy, drop {
        user: address,
        amount: u64,
    }

    // 取款事件
    public struct WithdrawEvent has copy, drop {
        user: address,
        amount: u64,
    }
}
