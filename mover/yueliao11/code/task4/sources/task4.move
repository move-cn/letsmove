module task4::bright_flip {
    use sui::object::{UID};
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    use sui::random::{Self, Random};
    use sui::transfer::{share_object, public_transfer};
    use sui::tx_context::{TxContext, sender};
    use faucetcoin::bright_faucet_coin::BRIGHT_FAUCET_COIN;

    // 错误码
    const E_INSUFFICIENT_POOL: u64 = 0;
    const E_BET_TOO_LARGE: u64 = 1;
    
    // 添加 GitHub ID 常量
    const GITHUB_ID: vector<u8> = b"yueliao11";

    /// 游戏主体结构
    public struct Game has key {
        id: UID,
        pool: Balance<BRIGHT_FAUCET_COIN>,
        creator: vector<u8>  // 添加创建者 ID
    }

    /// 管理员权限凭证
    public struct AdminCap has key, store {
        id: UID,
        creator: vector<u8>  // 添加创建者 ID
    }

    fun init(ctx: &mut TxContext) {
        share_object(Game {
            id: object::new(ctx),
            pool: balance::zero(),
            creator: GITHUB_ID
        });

        public_transfer(
            AdminCap { 
                id: object::new(ctx),
                creator: GITHUB_ID
            },
            sender(ctx)
        );
    }

    #[allow(lint(public_random))]
    public entry fun play(
        game: &mut Game,
        guess: bool,
        bet: Coin<BRIGHT_FAUCET_COIN>,
        rand: &Random,
        ctx: &mut TxContext
    ) {
        let bet_amount = coin::value(&bet);
        let pool_balance = balance::value(&game.pool);

        assert!(pool_balance >= bet_amount, E_INSUFFICIENT_POOL);
        assert!(pool_balance >= bet_amount * 10, E_BET_TOO_LARGE);

        let mut gen = random::new_generator(rand, ctx);
        let result = random::generate_bool(&mut gen);
        
        let player = sender(ctx);
        if (guess == result) {
            // 玩家赢了,获得双倍奖励
            let prize = balance::split(&mut game.pool, bet_amount);
            let prize_coin = coin::from_balance(prize, ctx);
            public_transfer(bet, player);
            public_transfer(prize_coin, player);
        } else {
            // 玩家输了,投注进入资金池
            let bet_balance = coin::into_balance(bet);
            balance::join(&mut game.pool, bet_balance);
        }
    }

    // 管理员功能
    public entry fun deposit(
        game: &mut Game, 
        coin: Coin<BRIGHT_FAUCET_COIN>,
        _ctx: &mut TxContext
    ) {
        balance::join(&mut game.pool, coin::into_balance(coin));
    }

    public entry fun withdraw(
        _: &AdminCap,
        game: &mut Game,
        amount: u64,
        ctx: &mut TxContext
    ) {
        let withdrawn = balance::split(&mut game.pool, amount);
        public_transfer(
            coin::from_balance(withdrawn, ctx),
            sender(ctx)
        );
    }
}