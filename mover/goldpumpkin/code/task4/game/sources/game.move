/// Module: game
module game::game {

    use sui::balance;
    use sui::balance::Balance;
    use sui::coin::{Self, Coin};
    use sui::clock::{Self, Clock};
    use faucet_coin::faucetcoin::{FAUCETCOIN};
    use sui::transfer::{public_transfer};
    use sui::event;
    use sui::tx_context::sender;
    use game::game_counter::{GameCounter, get_next_id, init_gc};

    // ===== Event =====

    public struct GameResult has copy, drop {
        game_id: u64,
        player: address,
        player_guess: u64,
        house_number: u64,
        player_win: bool,
        prize_amount: u64,
    }

    // ===== Errors =====

    const EInsufficientBalance: u64 = 0;
    const EInvalidGuess: u64 = 0;
    const EInsufficientBet: u64 = 1;
    const EInsufficientHouseBalance: u64 = 2;
    const ECallerNotHouse: u64 = 2;
    const ENotEnoughInput: u64 = 3;

    // ===== Structs =====

    // 管理员权限
    public struct HouseAdminCap has key {
        id: UID
    }

    // Configuration and Treasury object for the house.
    public struct HouseData has key {
        id: UID,
        balance: Balance<FAUCETCOIN>,
        house: address,
    }

    // 游戏记录
    public struct Game has key {
        id: UID,
        player: address,
        player_guess: u64,
        house_number: u64,
        bet_amount: u64,
        player_win: bool,
        timestamp: u64,
    }

    // ===== Functions =====

    fun init(ctx: &mut TxContext) {
        let house_cap = HouseAdminCap {
            id: object::new(ctx)
        };

        init_gc(ctx);

        // 管理权限控制
        transfer::transfer(house_cap, ctx.sender())
    }

    /// Initializer function that should only be called once and by the creator of the contract.
    /// Initializes the house data object. This object is involed in all games created by the same instance of this package.
    /// @param house_cap: The HouseCap object
    /// @param coin: The coin object that will be used to initialize the house balance. Acts as a treasury
    public entry fun initialize_house_data(
        house_cap: HouseAdminCap,
        coin: Coin<FAUCETCOIN>,
        ctx: &mut TxContext
    ) {
        assert!(coin::value(&coin) > 0, EInsufficientBalance);

        let house_data = HouseData {
            id: object::new(ctx),
            balance: coin.into_balance(),
            house: ctx.sender(),
        };

        let HouseAdminCap { id } = house_cap;
        object::delete(id);

        transfer::share_object(house_data);
    }

    // ===== 方法: 资金池 =====

    // 转入资金
    public entry fun top_up(house_data: &mut HouseData, coin: Coin<FAUCETCOIN>, amount: u64, ctx: &mut TxContext) {
        // 校验你持有的币数量，必须
        let input_value = coin::value(&coin);
        assert!(input_value >= amount, ENotEnoughInput);

        // 将余额从coin中拆出来
        let mut into_balance = coin::into_balance(coin);
        balance::join(
            &mut house_data.balance,
            balance::split(&mut into_balance, amount)
        );

        let change = coin::from_balance(into_balance, ctx);
        public_transfer(change, sender(ctx));
    }

    // 取回资金
    public entry fun withdraw(house_data: &mut HouseData, ctx: &mut TxContext) {
        // only the house address can withdraw funds
        assert!(ctx.sender() == house_data.house, ECallerNotHouse);

        let total_balance = house_data.balance.value();
        let coin = coin::take(&mut house_data.balance, total_balance, ctx);
        transfer::public_transfer(coin, house_data.house);
    }

    // 玩家调用此方法进行游戏 就是搏
    public entry fun place_bet_and_create_game(
        counter: &mut GameCounter,
        house_data: &mut HouseData,
        player_guess: u64,
        user_bet: Coin<FAUCETCOIN>,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        // 验证玩家猜测和下注
        assert!(player_guess <= 999, EInvalidGuess);

        let bet_amount = coin::value(&user_bet);
        assert!(bet_amount >= 100, EInsufficientBet);  // 最小下注为 100
        assert!(balance::value(&house_data.balance) >= bet_amount, EInsufficientHouseBalance);

        // 生成庄家数字
        let house_number = generate_random(clock);

        // 判断胜负
        let player_win = is_player_win(player_guess, house_number);

        // 结算
        let prize_amount = bet_amount * 2;  // 赢家获得双倍下注
        if (player_win) {
            // 玩家胜，从庄家余额中支付奖金
            let mut prize = coin::take(&mut house_data.balance, bet_amount, ctx);
            coin::join(&mut prize, user_bet);
            transfer::public_transfer(prize, tx_context::sender(ctx));
        } else {
            // 庄家胜，将玩家的下注加入庄家余额
            balance::join(&mut house_data.balance, coin::into_balance(user_bet));
        };

        // 创建游戏记录
        let game = Game {
            id: object::new(ctx),
            player: tx_context::sender(ctx),
            player_guess,
            house_number,
            bet_amount,
            player_win,
            timestamp: clock::timestamp_ms(clock),
        };

        // 将游戏记录作为共享对象
        transfer::share_object(game);

        // 发出游戏结果事件
        // 获取并递增计数器
        let game_id = get_next_id(counter);
        event::emit(GameResult {
            game_id,
            player: tx_context::sender(ctx),
            player_guess,
            house_number,
            player_win,
            prize_amount: if (player_win) { prize_amount } else { 0 },
        });

    }

    public fun generate_random(clock: &Clock): u64 {
        let timestamp = clock::timestamp_ms(clock);
        timestamp % 100 // 生成 0-999 之间的数
    }

    // 判断玩家是否获胜
    fun is_player_win(player_guess: u64, house_number: u64): bool {
        let diff = if (player_guess > house_number) {
            player_guess - house_number
        } else {
            house_number - player_guess
        };

        diff < 100
    }

    // === Tests ===

    #[test_only]
    // // The `init` is not run in tests, and normally a test_only function is
    // // provided so that the module can be initialized in tests. Having it public
    // // is important for tests located in other modules.
    public fun init_for_testing(ctx: &mut TxContext) {
        init(ctx);
    }
}
