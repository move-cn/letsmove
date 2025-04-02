#[allow(unused_let_mut,lint(public_random,abort_without_constant))]
module my_game::my_game {

    use std::ascii::{String, string};
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin::{Self, Coin, from_balance, into_balance, split};
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;
    use faucet_coin::faucet_coin::FAUCET_COIN;

    // 创建一个池子,并指定代币
    public struct Game has key {
        id: UID,
        val: Balance<FAUCET_COIN>,
        creator: String
    }

    // 设置管理员
    public struct Admin has key {
        id: UID
    }

    fun init(ctx: &mut TxContext) {
        // 创建一个游戏对象，设置池子初始余额为0
        let game = Game {
            id: object::new(ctx),   
            val: balance::zero(),
            creator: string(b"pwh-pwh")    
        };
        share_object(game);     // 共享游戏对象

        // 设置一个管理员对象
        let admin = Admin {
            id: object::new(ctx)
        };
        transfer(admin,sender(ctx));    // 将管理员权限转移给发送者
    }


    public entry fun play(
        game: &mut Game,
        user_value: bool,
        user_in: Coin<FAUCET_COIN>,
        rand: &Random,
        ctx: &mut TxContext
    ) {
        let user_in_coin = coin::value(&user_in);  // 获取玩家下注硬币的值
        let user_address = sender(ctx);             // 获取玩家的地址
        let game_val = balance::value(&game.val);   // 获取游戏池子中的余额

        // 如果池子的余额少于玩家下注的，则返回错误码 100
        if (game_val < user_in_coin) {
            abort 100u64
        };

        // 创建一个随机数生成器，并转换为 bool 值
        let mut generator = random::new_generator(rand,ctx);
        let mut flag = random::generate_bool(&mut generator);

        // 判断玩家是否猜对了
        if (user_value == flag) {
            let win_balance = balance::split(&mut game.val,user_in_coin);   // 从池子余额中分出与玩家下注的等值金额
            let win_coin = from_balance(win_balance,ctx);                   // 将赢得的金额转为硬币
            public_transfer(win_coin,user_address);                         // 将赢得的硬币转移给玩家
            public_transfer(user_in,user_address);                     // 将玩家下注的硬币退还给玩家
        } else {
            let in_balance = into_balance(user_in);                    // 将玩家的硬币转换为余额
            balance::join(&mut game.val,in_balance);                        // 将余额加入到游戏的池子中
        }
    }

    // 将代币添加到游戏中
    public entry fun add_coin(
        game: &mut Game,
        add_coin: Coin<FAUCET_COIN>,
        _ctx: &mut TxContext
    ) {
        let add_coin_in_balance = into_balance(add_coin);           // 将硬币转换为余额
        balance::join(&mut game.val, add_coin_in_balance);          // 将余额加入到游戏的总余额中
    }

    // 从游戏池子中取出
    public entry fun remove_coin(
        _: &Admin,
        game: &mut Game,
        amt: u64,
        ctx: &mut TxContext
    ) {
        let win_balance = balance::split(&mut game.val,amt);    // 从游戏中分出指定金额
        let win_coin = from_balance(win_balance,ctx);           // 将分出金额转化为硬币
        public_transfer(win_coin,sender(ctx));                  // 将硬币转移给发送者
    }

}
// packageid:0xb97f0a8843164802ce3333b4e2ba1c8410bebde6aa711aee148e65a0dd7ecc3a
// game objid:0x8c890be0d75271976a4b0a671b969ab4999f48787a547087ec62d52147f9730b
// withdraw:tx DuQEN1G1c7Z9SSoRL61ak8Ndaq5qBSHeB4qddYAvo11
//play: 8EEjTDEpMPjnN9ERjYfTStJGbe43guvvhssF3SzvL5tg
//rm:Cm7tdC9bv4fTYXNGgbNgLMCKZ3esf7Wdy3PSdLHc9irU
