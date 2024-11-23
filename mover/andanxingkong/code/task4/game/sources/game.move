module game::game {
    use sui::coin::{Self, Coin};
    use andanxingkong_faucet_coin::andanxingkong_faucet_coin::ANDANXINGKONG_FAUCET_COIN;
    use sui::balance::{Self, Balance};
    use sui::random::{Self, Random};

    const EUserInsufficientBalance: u64 = 1000;
    const EGameInsufficientBalance: u64 = 1001;

    public struct Game has key {
        id: UID,
        balance: Balance<ANDANXINGKONG_FAUCET_COIN>,
    }

    public struct Admin has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            balance: balance::zero(),
        };
        transfer::share_object(game);

        let admin = Admin {id: object::new(ctx)};
        transfer::transfer(admin, ctx.sender());
    }

    public entry fun Deposit(
        game: &mut Game,
        coin: &mut Coin<ANDANXINGKONG_FAUCET_COIN>,
        amount: u64,
    ) {
        assert!(
            coin::value(coin) >= amount,
            EUserInsufficientBalance
        );
        let split_balance = balance::split(coin::balance_mut(coin), amount);
        balance::join(&mut game.balance, split_balance);
    }

    // 只有管理员能够提现
    public entry fun Withdraw(
        game: &mut Game,
        _: &Admin,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(
            game.balance.value() >= amount,
            EGameInsufficientBalance
        );
        let cash = coin::take(&mut game.balance, amount, ctx);
        transfer::public_transfer(cash, ctx.sender());
    }

    // 如果用户猜对了，获得双倍奖励。如果用户猜错了，损失投入的代币

    public entry fun Play(
        game: &mut Game,
        rnd: &Random,
        guess: bool,
        coin: &mut Coin<ANDANXINGKONG_FAUCET_COIN>,
        amount: u64,
        ctx: &mut TxContext
    ) {
        // 检查合约余额是否充足，确保用户获胜时有足够金额奖励
        assert!(
            game.balance.value() >= amount,
            EGameInsufficientBalance
        );
        // 检查用户的余额是否充足
        assert!(
            coin::value(coin) >= amount,
            EUserInsufficientBalance
        );

        // 生成随机数
        let mut gen = random::new_generator(rnd, ctx);
        let flag = random::generate_bool(&mut gen);

        // 如果获胜
        if (flag == guess) {
            // 投入的代币不变，另外奖励等额的代币
            let reward = coin::take(&mut game.balance, amount, ctx);
            coin::join(coin, reward);
        }
        // 猜错了就损失投入的代币
        else {
            Self::Deposit(game, coin, amount)
        }
    }
}
