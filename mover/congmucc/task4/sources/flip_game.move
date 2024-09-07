module task4::flip_game {

    use sui::object;
    use sui::balance::{Self, Balance};
    use sui::coin;
    use sui::coin::{Coin, into_balance, from_balance};
    use sui::random;
    use sui::random::Random;
    use task2::share_coin_test::SHARE_COIN_TEST;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::{TxContext,sender};

    public struct GamePool has key {
        id: UID,
        val: Balance<SHARE_COIN_TEST>
    }

    public struct AdminCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {

        let game = GamePool {
            id: object::new(ctx),
            val: balance::zero<SHARE_COIN_TEST>()
        };

        share_object(game);

        let admin = AdminCap {
            id: object::new(ctx)
        };

        transfer(admin, sender(ctx));
    }

    public entry fun play(
        in: Coin<SHARE_COIN_TEST>,
        flip_value: bool,
        rand:&Random,
        game: &mut GamePool,
        ctx: &mut TxContext
    ) {
        let coin_value = coin::value(&in);

        let game_val = balance::value(&game.val);

        // 用户最多只能玩池子中的1/10的钱币大小
        if (coin_value * 10 > game_val) {
            abort 100u64;
        };

        let mut gen = random::new_generator(rand, ctx);
        let mut flag = random::generate_bool(&mut gen);

        if (flip_value == flag) {
            let win_balance = balance::split(&mut game.val, coin_value);
            let win_coin = from_balance(win_balance, ctx);
            public_transfer(win_coin, sender(ctx));
            public_transfer(in, sender(ctx));
        } else {
            let in_balance = into_balance(in);
            balance::join(&mut game.val, in_balance);
        }
    }

    public entry fun add_sui(game: &mut GamePool,in: Coin<SHARE_COIN_TEST>, ctx: &TxContext) {
        let in_balance = into_balance(in);
        balance::join(&mut game.val, in_balance);
    }

    public entry fun remove_sui(_:&AdminCap ,game: &mut GamePool,amt: u64, ctx: &mut TxContext) {
        let win_balance = balance::split(&mut game.val, amt);
        let win_coin = from_balance(win_balance, ctx);
        public_transfer(win_coin, sender(ctx))
    }

}