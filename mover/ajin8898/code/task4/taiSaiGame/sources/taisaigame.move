/// Module: taisaigame
module taisaigame::taisaigame {

    use sui::sui::SUI;
    use sui::balance::{Self, Balance};
    use sui::transfer;
    use sui::tx_context::sender;
    use ajin_faucet_coin::ajin_faucet_coin::{Self, AJIN_FAUCET_COIN};
    use sui::coin;
    use sui::coin::{Coin, from_balance, into_balance};
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, transfer, public_transfer};


    public struct Game has key {
        id : UID,
        val: Balance<AJIN_FAUCET_COIN>
    }

    public struct AdminCap has key {
        id : UID,
    }

    fun init(ctx : &mut TxContext) {
        let game = Game {
            id : object::new(ctx),
            val : balance::zero()
        };
        transfer::share_object(game);

        let admin = AdminCap{
            id:object::new(ctx)
        };
        transfer::transfer(admin, sender(ctx));
    }

    entry fun play(game: &mut Game, flip_value: bool, in: Coin<AJIN_FAUCET_COIN>, rand: &Random, ctx: &mut TxContext) {
        let coin_value = coin::value(&in);

        let play_address = sender(ctx);
        let game_val = balance::value(&game.val) ;

        if (game_val < coin_value) {
            abort 1;
        };

        //防止 all in 战神，限制每次最大是合约里面钱的10分之一
         if (game_val < coin_value*10) {
            abort 2;
        };

        let mut gen = random::new_generator(rand, ctx);

        let mut flag = random::generate_bool(&mut gen);
        if (flip_value == flag) {
            let win_balance = balance::split(&mut game.val, coin_value);
            let win_coin = from_balance(win_balance, ctx);
            public_transfer(win_coin, play_address);
            public_transfer(in, play_address);
        }else {//输了，放到余额
            let in_balance = into_balance(in);
            balance::join(&mut game.val, in_balance);
        }
    }


    public entry fun deposit(game: &mut Game, in: Coin<AJIN_FAUCET_COIN>, ctx: &TxContext) {
        let in_balance = into_balance(in);
        balance::join(&mut game.val, in_balance);
    }

    public entry fun withdraw(_: &AdminCap, game: &mut Game, amt: u64, ctx: &mut TxContext) {
        let win_balance = balance::split(&mut game.val, amt);
        let win_coin = from_balance(win_balance, ctx);
        public_transfer(win_coin, sender(ctx));
    }
}



