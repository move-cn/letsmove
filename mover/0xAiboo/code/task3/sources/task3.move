module task3::flip_coin {
    use sui::balance::Balance;
    use sui::sui::SUI;
    public struct Game has key {
        id: UID,
        val: Balance<SUI>
    }

    public struct AdminCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            val: balance::zero()
        };
        share_object(game);
        let admin = AdminCap {id: object::new(ctx)};

        transfer(admin, sender(ctx));
    }

    public entry fun play(
        game: &mut Game,
        flip_value: bool,
        in: Coin<SUI>,
        rand: &Random,
        ctx: &mut TxContext
    ) {
        let coin_value: u64 = coin::value(&in);
        let play_address =
        let game_val: u64 = balance::value(&game.val);
        if (game_val < coin_value) {
            abort 100u64;
        };

        let mut gen: RandomGenerator = random::new_generator(rand, ctx);
        let mut flag: bool = random::generate_bool(gen);
        if (flip_value == flag) {
            let win_balance:Balance<SUI>=balance::split(&mut game.val, coin_value);
            let win_coin: Coin<SUI> =from_balance(win_balance,ctx);
            public_transfer(win_coin, play_address);
            public_transfer(in, play_address);
        } else {
            let in_balance: Balance<SUI> = into_balance(in);
            balance::join(&mut game.val, in_balance);
        }

    }

}
