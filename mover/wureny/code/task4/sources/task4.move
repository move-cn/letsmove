module flip_coin::wureny_flip_coin {

    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin, from_balance, into_balance};
    use sui::object;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;
    use faucet::wureny_faucet::WURENY_FAUCET;

    public struct Game_wureny has key {
        id: UID,
        value: Balance<WURENY_FAUCET>
    }

    public struct AdminCap has key {
        id: UID
    }

    fun init(ctx: &mut TxContext) {
        let game = Game_wureny {
            id: object::new(ctx),
            value: balance::zero()
        };
        share_object(game);

        let admin = AdminCap {
            id: object::new(ctx)
        };

        transfer(admin, sender(ctx));
    }

    entry fun play(game: &mut Game_wureny, flip_value: bool, in: Coin<WURENY_FAUCET>, rand: &Random, ctx: &mut TxContext) {
        let play_value = coin::value(&in);
        let game_value = balance::value(&game.value);
        let player = sender(ctx);

        if (play_value>game_value/10) {
            abort 100u64;
        };

        let mut gen = random::new_generator(rand,ctx);
        let flag = random::generate_bool(&mut gen);

        if (flip_value==flag) {
            let win_bal = balance::split(&mut game.value,play_value);
            let win_token = from_balance(win_bal,ctx);
            public_transfer(win_token,player);
            public_transfer(in,player);
        }   else {
            let in_bal = into_balance(in);
            balance::join(&mut game.value,in_bal);
        }
    }

    public entry fun add_token(game: &mut Game_wureny, in: Coin<WURENY_FAUCET>, _ctx: &TxContext) {
        let in_bal = into_balance(in);
        balance::join(&mut game.value,in_bal);
    }

    public entry fun withdraw_token(_: &AdminCap, game: &mut Game_wureny,
                                    amt: u64, ctx: &mut TxContext) {
        let withdraw_bal = balance::split(&mut game.value,amt);
        let withdraw_coin = from_balance(withdraw_bal,ctx);
        public_transfer(withdraw_coin,sender(ctx));
    }

}
