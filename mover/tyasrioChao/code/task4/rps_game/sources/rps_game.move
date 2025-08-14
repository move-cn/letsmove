/*
/// Module: rps_game
module rps_game::rps_game;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module rps_game::rps_game {
    use std::string::{String, utf8};
    use mycoin::tyasriochaofaucet::TYASRIOCHAOFAUCET as TYASRIOCHAOFAUCET;
    use sui::{
        coin::{Coin,into_balance,value,from_balance},
        balance::{Balance, zero, join, split},
        transfer::{share_object,public_transfer,transfer},
        random::{generate_u8,new_generator,Random},
    };

    // 错误码
    const EInvalidPay: u64 = 900; // 投入金额不合法
    const EInvalidGuess: u64 = 901; // 猜测数字不合法

    public struct Game has key, store {
        id: UID,
        pool: Balance<TYASRIOCHAOFAUCET>,
    }

    public struct AdminCap has key {
        id: UID
    }

    /// 初始化游戏
    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            pool: zero(),
        };
        share_object(game);
        let adminCap = AdminCap {
            id: object::new(ctx)
        };
        transfer(adminCap, ctx.sender());
    }

    /// 初始化奖金池
    public entry fun deposit(game: &mut Game, coin: Coin<TYASRIOCHAOFAUCET>, _: &mut TxContext) {
        let coin_into_balance = into_balance(coin);
        game.pool.join(coin_into_balance);
    }

    /// 清空奖金
    public entry fun withdraw (_: &AdminCap, game: &mut Game, remove_num: u64, ctx: &mut TxContext) {
        let remove_balance = game.pool.split(remove_num);
        let remove_coin = from_balance(remove_balance, ctx);
        public_transfer(remove_coin, ctx.sender());
    }

    /// 玩家开始游戏
    entry fun play(rand: &Random, game: &mut Game, _choice: String, bet: Coin<TYASRIOCHAOFAUCET>,ctx: &mut TxContext) {
        assert!(_choice == utf8(b"Rock") || _choice == utf8(b"Paper") || _choice == utf8(b"Scissors"), EInvalidGuess);
        assert!(game.pool.value() >= bet.value() * 10, EInvalidPay);

        let system = random_choice(rand, ctx);
        let result = judge(_choice, system);

        if (result == 1 ){
            // 玩家胜利，返还双倍赌注
            let reward = game.pool.split(value(&bet) * 2);
            game.pool.join( into_balance(bet));

            public_transfer(from_balance(reward, ctx), ctx.sender());
        } else if (result == 0) {
            // 平局，退回赌注
            public_transfer(bet,ctx.sender());
        } else {
            // 玩家输，赌注进入奖池
            game.pool.join( into_balance(bet));
        }
    }

    /// 生成系统的随机选择
    fun random_choice(rand: &Random, ctx: &mut tx_context::TxContext): String {
        let mut generator = new_generator(rand, ctx);
        let seed = generate_u8(&mut generator);
        let value = seed % 3; // 取 0, 1, 2
        if (value == 0) { b"Rock".to_string() }
        else if (value == 1) { b"Paper".to_string() }
        else { b"Scissors".to_string() }
    }

    /// 判断游戏胜负
    public fun judge(player: String, system: String): u8 {
        if (player == system) { // 平局
            0 
        } else if (
            (player == b"Rock".to_string() && system == b"Scissors".to_string()) ||
                  (player == b"Scissors".to_string() && system == b"Paper".to_string()) ||
                  (player == b"Paper".to_string() && system == b"Rock".to_string())) { // 玩家胜
            1 
        } else { // 玩家输
            2 
        }
    }
}
