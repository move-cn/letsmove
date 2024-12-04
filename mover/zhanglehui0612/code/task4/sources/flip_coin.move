module games::flip_coin {
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin, from_balance, into_balance};
    use sui::object;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;
    use currency::faucet_coin::FAUCET_COIN;
    const EGameBalanceInsufficient:u64 = 0x100;

    /// 定义游戏
    public struct Game has key {
        id: UID,
        val: Balance<FAUCET_COIN>
    }

    public struct AdminCap has key {
        id: UID
    }


    fun init(ctx: &mut TxContext) {
        // 创建游戏
        let game = Game {
            id: object::new(ctx),
            val: balance::zero()
        };

        // 发布游戏为共享所有权对象
        share_object(game);

        // 创建管理员权限
        let admin = AdminCap {
            id: object::new(ctx)
        };
        // 将管理员权限转移给当前交易发起者
        transfer(admin, sender(ctx));
    }

    public entry fun play(game: &mut Game, flip_value: bool, in: Coin<FAUCET_COIN>, rand: &Random, ctx: &mut TxContext) {
        // 获取玩游戏传进来的SUI的值
        let coin_value = coin::value(&in);


        // 玩这个游戏需要的钱
        let game_value = balance::value(&game.val);
        assert!(game_value > coin_value, EGameBalanceInsufficient);


        let mut gen_rand = random::new_generator(rand, ctx);
        let mut flag = random::generate_bool(&mut gen_rand);
        // 是否和传进来的参数一样，如果相同表示赢了，可以游戏余额中拿走钱；否则你的钱就在游戏里
        if (flip_value == flag) {
            // 游戏余额中扣除用户投入的钱
            let win_balance = balance::split(&mut game.val, coin_value);
            // 将用户赢得钱转化为coin
            let win_coin = from_balance(win_balance, ctx);
            public_transfer(win_coin, sender(ctx));
            public_transfer(in, sender(ctx));
        }else {
            // 用户如果输了迁就放在游戏池子内
            let in_balance = into_balance(in); 
            balance::join(&mut game.val, in_balance);
        }
    }

    public entry fun add_sui(game: &mut Game, in: Coin<FAUCET_COIN>, _ctx: &TxContext) {
        let in_balance = into_balance(in);
        balance::join(&mut game.val, in_balance);
    }

    public entry fun remove_sui(_: &AdminCap, game: &mut Game, amount: u64, ctx: &mut TxContext) {
        let win_balance = balance::split(&mut game.val, amount);
        let win_coin = from_balance(win_balance, ctx);
        public_transfer(win_coin, sender(ctx));
    }
}