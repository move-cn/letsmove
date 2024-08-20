/// Module: fantasy_move_basketball
module fantasy_move_basketball::fantasy_move_basketball {
    /// 发行一个篮球投篮的游戏, 游戏有个初始的fantasy_facuet_coin 的资金池，
    /// 玩家每次玩需要投入1个 fantasy_facuet_coin
    /// 每次投篮会随机对应1分， 2分，和3分
    /// 如果是1分，返回给玩家 0.5个 fantasy_facuet_coin
    ///      2分，返回给玩家   1个 fantasy_facuet_coin
    ///      3分，返回给玩家   3个 fantasy_facuet_coin
    ///
    use facuet_coin::fantasy_facuet_coin::FANTASY_FACUET_COIN;
    use sui::balance;
    use sui::balance::{Balance, zero};
    use sui::object;
    use sui::coin;
    use sui::coin::{into_balance, from_balance};
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;

    // ticket price
    const TICKET_PRICE: u64 = 1_000_000_000;

    public struct BasketThrowGame has key {
        id: UID,
        pool: Balance<FANTASY_FACUET_COIN>,
    }


    public struct AdminCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let game = BasketThrowGame {
            id: object::new(ctx),
            pool: zero(),
        };

        share_object(game);

        let admin = AdminCap {
            id: object::new(ctx),
        };

        transfer(admin, sender(ctx));
    }

    public entry fun play(
        game: &mut BasketThrowGame,
        in: coin::Coin<FANTASY_FACUET_COIN>,
        rand: &Random,
        ctx: &mut TxContext
    ) {
        let in_val = coin::value(&in);

        assert!(in_val == TICKET_PRICE, 0);
        // get the ticket coin
        deposit(game, in, ctx);
        // generate random
        let mut gen = random::new_generator(rand, ctx);

        let number = random::generate_u8_in_range(&mut gen, 0, 99);
        let mut win_val: u64 = 0;
        if (number <= 50) {
            // one point
            win_val = 500_000_000;
        }else if (number <= 85) {
            // two point
            win_val = 1000_000_000;
        }else {
            // three point
            win_val = 3000_000_000;
        };
        withdraw(game, win_val, sender(ctx), ctx)
    }

    fun deposit(game: &mut BasketThrowGame, in: coin::Coin<FANTASY_FACUET_COIN>, ctx: &mut TxContext) {
        let in_balance = into_balance(in);

        balance::join(&mut game.pool, in_balance);
    }

    public entry fun public_deposit(
        game: &mut BasketThrowGame,
        in: coin::Coin<FANTASY_FACUET_COIN>,
        ctx: &mut TxContext
    ) {
        deposit(game, in, ctx);
    }

    fun withdraw(game: &mut BasketThrowGame, amount: u64, to: address, ctx: &mut TxContext) {
        let out_balance = balance::split(&mut game.pool, amount);
        let out_coin = from_balance(out_balance, ctx);
        public_transfer(out_coin, to);
    }

    public entry fun public_withdraw(_: &AdminCap, game: &mut BasketThrowGame, amount: u64, ctx: &mut TxContext) {
        withdraw(game, amount, sender(ctx), ctx);
    }
}

