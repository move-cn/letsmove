module flip_coin::flip_coin {

    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin, from_balance, into_balance};
    use sui::object;
    use sui::random;
    use sui::random::Random;
    use sui::sui::SUI;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;

    public struct Game has key {
        id: UID,
        val: Balance<SUI>
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


     entry fun play(game: &mut Game, flip_value: bool, in: Coin<SUI>, rand: &Random,
                          ctx: &mut TxContext) {
        let coin_value = coin::value(&in);

        let play_address = sender(ctx);
        let game_val = balance::value(&game.val) ;

        if (game_val < coin_value) {
            abort 100u64;
        };

        //TODO 防止 all in 战神
        //TODO 每次最大值 就是合约里面钱的10分之一就行了

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


    public entry fun add_sui(game: &mut Game, in: Coin<SUI>, _ctx: &TxContext) {
        let in_balance = into_balance(in);
        balance::join(&mut game.val, in_balance);
    }

    public entry fun remove_sui(_: &AdminCap, game: &mut Game,
                                amt: u64, ctx: &mut TxContext) {
        let win_balance = balance::split(&mut game.val, amt);
        let win_coin = from_balance(win_balance, ctx);
        public_transfer(win_coin, sender(ctx));
    }
}
