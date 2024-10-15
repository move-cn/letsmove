
/// 猜硬币游戏
module task4::coin_toss_game_billa_github2016 {
    use sui::balance;
    use sui::balance::{ Balance };
    use sui::coin::{ Self, Coin };
    use sui::random::{Random, new_generator};
    use sui::event;
    use std::string::{ String, utf8 };

    public struct Game<phantom T> has key, store {
        id: UID,
        pool: Balance<T>,
        ticket: u64
    }

    public struct AdminCap has key {
        id: UID,
    }

    public struct GAME_RESULT_EVENT has copy, drop {
        game_id: ID,
        player_address: address,
        result: u8,
        coin_result: String,
        is_win: bool
    }

    const EPoolPlayNotEnough: u64 = 1;
    const ECoinBalanceNotEnough: u64 = 2;
    const EPoolWithdrawNotEnough: u64 = 3;

    fun init(_ctx: &TxContext) {

    }

    public fun create_game<T>(pool: Coin<T>, ctx: &mut TxContext) {
        let mut game = Game<T> {
            id: object::new(ctx),
            pool: balance::zero<T>(),
            ticket: 100_000_000 // 0.1
        };
        coin::put(&mut game.pool, pool);

        transfer::share_object(game);
        let admin_cap = AdminCap { id: object::new(ctx) };
        transfer::transfer(admin_cap, ctx.sender());
    }

    #[allow(lint(self_transfer))]
    public entry fun play<T>(game: &mut Game<T>, bet_coin: Coin<T>, toss_result: u8, r: &Random, ctx: &mut TxContext) {
        let coin_value = bet_coin.value();
        let pool_value: u64 = game.pool.value();
        assert!(coin_value >= game.ticket, ECoinBalanceNotEnough);
        assert!(pool_value >= game.ticket, EPoolPlayNotEnough);

        let mut generator = new_generator(r, ctx);
        let v = generator.generate_u8_in_range(1, 2);
        let mut coin_result = utf8(b"front");
        if (v == 2) {
            coin_result = utf8(b"reverse");
        };

        if (v == toss_result) {
            let reward = balance::split(&mut game.pool, game.ticket);
            let reward_coin = coin::from_balance(reward, ctx);
            transfer::public_transfer(reward_coin, ctx.sender());
            transfer::public_transfer(bet_coin, ctx.sender());
        } else {
            let mut coin_balance = coin::into_balance(bet_coin);
            if (coin_value > game.ticket) {
                game.pool.join(coin_balance.split(game.ticket));
                let change = coin::from_balance(coin_balance, ctx);
                transfer::public_transfer(change, ctx.sender());
            } else {
                game.pool.join(coin_balance);
            };
        };

        event::emit(GAME_RESULT_EVENT {
            game_id: object::uid_to_inner(&game.id),
            player_address: ctx.sender(),
            result: v,
            is_win: v == toss_result,
            coin_result
        });
    }

    public entry fun increase_game_pool<T>(_: &AdminCap, game: &mut Game<T>, increase_coin: Coin<T>, _ctx: &mut TxContext) {
        let increase_coin_balance = coin::into_balance(increase_coin);
        game.pool.join(increase_coin_balance);
    }

    #[allow(lint(self_transfer))]
    public entry fun withdraw<T>(_: &AdminCap, game: &mut Game<T>, withdraw_balance: u64, ctx: &mut TxContext) {
        let game_pool_balance = game.pool.value();
        assert!(withdraw_balance <= game_pool_balance, EPoolWithdrawNotEnough);
        let withdraw_coin_balance = game.pool.split(withdraw_balance);
        let withdraw_coin = coin::from_balance(withdraw_coin_balance, ctx);
        transfer::public_transfer(withdraw_coin, ctx.sender());
    }
}

