/// Module: flip_coin
module oliverxl_game::flip_coin {

    use sui::balance;
    use sui::balance::{Balance, zero};
    use sui::coin::{Coin, into_balance, from_balance};
    use sui::object;
    use sui::coin;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::{TxContext, sender};
    use move_coin::oliverxl_faucet::OLIVERXL_FAUCET;

    //必须u64
    const ENotEnough :u64 = 0;
    const EExceedLimit : u64 = 1;

    public struct Game has key {
        id: UID,
        val: Balance<OLIVERXL_FAUCET>,
    }

    public struct AdminCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            val: zero(),
        };

        share_object(game);

        let admin = AdminCap {
            id: object::new(ctx),
        };

        transfer(admin, sender(ctx));
    }

    //存钱
    public entry fun deposit(game: &mut Game, in: Coin<OLIVERXL_FAUCET>, _ctx: &mut TxContext) {
        let in_balance = into_balance(in);
        balance::join(&mut game.val, in_balance);
    }

    //取钱
    public entry fun withdraw(_: &AdminCap,game: &mut Game, out_amt: u64, ctx: &mut TxContext) {
        let out_balance = balance::split(&mut game.val, out_amt);
        let out_coin = from_balance(out_balance, ctx);
        public_transfer(out_coin, sender(ctx));
    }

    //玩
    public entry fun play(game: &mut Game, flip_value: bool, in: Coin<OLIVERXL_FAUCET>, rand: &Random,
                          ctx: &mut TxContext) {
        let coin_value = coin::value(&in);

        let play_address = sender(ctx);
        let game_val = balance::value(&game.val) ;

        //游戏池小于投入
        if (game_val < coin_value) {
            abort ENotEnough;
        };

        //TODO 防止 all in 战神每次最大值 就是合约里面钱的10分之一就行了
        if(game_val < coin_value*10) {
            abort EExceedLimit;
        };

        //随机数生成器
        let mut gen = random::new_generator(rand, ctx);

        let mut flag = random::generate_bool(&mut gen);

        if (flip_value == flag) {
            let win_balance = balance::split(&mut game.val, coin_value);
            let win_coin = from_balance(win_balance, ctx);
            public_transfer(win_coin, play_address);
            public_transfer(in, play_address);
        }else {
            let in_balance = into_balance(in);
            balance::join(&mut game.val, in_balance);
        }
    }
}
