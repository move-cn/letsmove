module my_game::my_game {

    // use std::debug;
    use std::string::{Self, String};

    use my_coin::faucet_coin::FAUCET_COIN;
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin::{Self, Coin};
    use sui::random::{generate_u8_in_range, new_generator, Random};
    use sui::tx_context::{epoch, sender};

    /**
        游戏名称：老虎机
        游戏规则：
           1.老虎机合约在初始化的时候，部署合约的人往老虎机里面存入一定的SUI余额
           2.玩家下注任意量的SUI，会存入到老虎机余额里面
           3.玩家下注后，老虎机合约生成一个1~99的随机数，用户有49%的概率赢，51%的概率输
           4.玩家赢了将会收到老虎机合约返还的2倍的投注SUI金额，输了就什么都没有了。
     */

    /// Error codes
    const EInvalidAmount: u64 = 0;
    const EInvalidEpoch: u64 = 2;
    const ENotEnoughBalance: u64 = 3;

    //游戏对象
    public struct Game has key {
        id: UID,
        name: String,
        creator: address,
        epoch: u64,
        balance: Balance<FAUCET_COIN>,
    }

    //one-time wintness
    public struct MY_GAME has drop {}

    //游戏管理员权限对象
    public struct GameAdminCap has key {
        id: UID
    }

    //发布合约的时候，初始化游戏对象并且创建一个GameAdminCap对象
    fun init(_witness: MY_GAME, ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            name: string::utf8(b"poshitou"),
            creator: sender(ctx),
            epoch: epoch(ctx),
            balance: balance::zero<FAUCET_COIN>(),
        };
        transfer::share_object(game);

        transfer::transfer(GameAdminCap {
            id: object::new(ctx)
        }, sender(ctx));
    }

    //往游戏里面存钱（一般是游戏管理员才有权限往老虎机余额里面充入余额）
    public entry fun deposit_balance_to_game(
        _: &GameAdminCap,
        game: &mut Game,
        coin: Coin<FAUCET_COIN>,
        _: &mut TxContext
    ) {
        coin::put(&mut game.balance, coin);
    }


    //用户玩游戏
    #[allow(lint(public_random))]
    public entry fun play(
        coin: &mut Coin<FAUCET_COIN>,
        game: &mut Game,
        random: &Random,
        ctx: &mut TxContext
    ) {
        assert!(epoch(ctx) == game.epoch, EInvalidEpoch);
        assert!(coin::value(coin) > 0, EInvalidAmount);

        //生成一个1~99的随机数
        let mut generator = new_generator(random, ctx);
        let bet = generate_u8_in_range(&mut generator, 1, 100);
        // debug::print(&bet);
        let lost = bet / 50; // 0 with probability 49%, and 1 or 2 with probability 51%
        let won = (2 - lost) / 2; // 1 with probability 49%, and 0 with probability 51%

        let bet_amount = coin::value(coin);
        //判断游戏余额是否大于投注金额的两倍
        assert!(game.balance.value() >= 2 * bet_amount, ENotEnoughBalance);
        //把用户的赌注金额从用户的余额里面转到老虎机余额里面
        coin::put(&mut game.balance, coin::split(coin, bet_amount, ctx));

        //用户赢了的话，把用户赢得的钱的2倍数从老虎机余额里面转给用户，输的话转0
        let reward = 2 * (won as u64) * bet_amount;
        //从老虎机余额中取出reward数量的代币,给到投注者(reward 是0 或者 2 * bet_amount)
        coin::join(coin, coin::take(&mut game.balance, reward, ctx));

    }

    //提取游戏余额：游戏管理员才可以提取游戏的余额
    public entry fun withdraw_balance(
        _: &GameAdminCap,
        game: &mut Game,
        amt:u64,
        ctx: &mut TxContext
    ) {
        let balance = coin::take(&mut game.balance, amt, ctx);
        transfer::public_transfer(balance, sender(ctx));
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        let my_game = MY_GAME {};
        init(my_game, ctx);
    }

    #[test_only]
    public fun get_balance(game: &Game): u64 {
        game.balance.value()

    }

    #[test_only]
    public fun get_epoch(game: &Game): u64 {
        game.epoch
    }

}