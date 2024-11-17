module flip_coin::flip_coin {
    use sui::balance;
    use sui::balance::{Balance, zero};
    use sui::coin;
    use sui::coin::{from_balance, into_balance};
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;
    use faucet_coin::faucet_coin::FAUCET_COIN;


    public struct Game  has key {
        id: UID,
        val: Balance<FAUCET_COIN>
    }

    public struct AdaminCap has key {
        id: UID
    }

    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            val: zero()
        };
        share_object(game);
        let admin = AdaminCap {
            id: object::new(ctx)
        };
        transfer(admin, sender(ctx));
    }



    #[allow(lint(public_random))]
    public entry fun play(
        game: &mut Game,
        flip_value: bool,
        in: coin::Coin<FAUCET_COIN>,
        rand: &Random,
        ctx: &mut TxContext
    ) {
        let coin_value = coin::value(&in);

        let game_val = balance::value(&game.val);
        
        // 池子总量大于投注数量，防止给用户返还资金不够
        if (game_val < coin_value) {
            abort 0
        };
        // 池子总量大于投注数量10倍，防止all in漏洞
        if (game_val < coin_value * 10) {
            abort 1
        };

        let mut gen = random::new_generator(rand, ctx);
        
        let flag = random::generate_bool(&mut gen);

        let player_address = sender(ctx);

        if (flip_value == flag) {

            let win_balance = balance::split(&mut game.val, coin_value);
            let win_coin = from_balance(win_balance, ctx);
            public_transfer(win_coin, player_address);
            public_transfer(in, player_address);
        } else {
            let in_balance = into_balance(in);
            balance::join(&mut game.val, in_balance);
        }
    }
    



    public entry fun deposit(
        game: &mut Game,
        in: coin::Coin<FAUCET_COIN>,
        _ctx: &mut TxContext
    ) {
        let in_balance = into_balance(in);
        balance::join(&mut game.val, in_balance);
    }



    public entry fun withdraw(_: &AdaminCap, game: &mut Game, amt: u64, ctx: &mut TxContext) {
        let win_balance = balance::split(&mut game.val, amt);
        let win_coin = from_balance(win_balance, ctx);
        public_transfer(win_coin, sender(ctx));
    }
}