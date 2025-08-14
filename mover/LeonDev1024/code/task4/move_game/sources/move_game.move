/*
/// Module: move_game
module move_game::move_game;
*/
module move_game::flip_coin {

    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin, from_balance, into_balance};
    use sui::object;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;
    use faucet_coin::leon_dev_1024_faucet_coin::{LEON_DEV_1024_FAUCET_COIN};

    public struct Game has key {
        id: UID,
        val: Balance<LEON_DEV_1024_FAUCET_COIN>
    }


    public struct AdminCap has key {
        id: UID,
    }


    fun init(ctx: &mut  TxContext) {
        let game = Game {
            id: object::new(ctx),
            val: balance::zero()
        };
        share_object(game);

        let admin = AdminCap {
            id: object::new(ctx)
        };

        transfer(admin, sender(ctx));
    }


    entry fun play(game: &mut Game, flip_value: bool, in: Coin<LEON_DEV_1024_FAUCET_COIN>, rand: &Random,
                   ctx: &mut TxContext) {
        let coin_value = coin::value(&in);

        let play_address = sender(ctx);
        let game_val = balance::value(&game.val) ;

        if (game_val < coin_value) {
            abort 100u64;
        };

        //防止 all in 战神
        //每次最大值 就是合约里面钱的10分之一就行了
        if (coin_value > game_val / 10) {
            abort 101u64;
        };

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


    // 存钱
    public entry fun add_sui(game: &mut Game, in: Coin<LEON_DEV_1024_FAUCET_COIN>, _ctx: &TxContext) {
        let in_balance = into_balance(in);
        balance::join(&mut game.val, in_balance);
    }

    // 取钱
    public entry fun remove_sui(_: &AdminCap, game: &mut Game,
                                amt: u64, ctx: &mut TxContext) {
        let win_balance = balance::split(&mut game.val, amt);
        let win_coin = from_balance(win_balance, ctx);
        public_transfer(win_coin, sender(ctx));
    }
}
