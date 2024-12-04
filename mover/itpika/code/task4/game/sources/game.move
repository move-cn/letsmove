/// Module: game
module game::itpika_game {

    use sui::balance::{Self, Balance};
    // use sui::table::{Self, Table};
    use faucet::itpika_faucet::ITPIKA_FAUCET;
    use sui::random::{Self, Random};
    use sui::tx_context::sender;
    use sui::coin::{Self, Coin};
    use sui::event;

    const EOverBalance: u64 = 0;
    // const EOnlyOneFAUCET: u64 = 1;
    const EVaultIsEmpty: u64 = 2;

    // public struct ITPIKA_FAUCET has drop {}

    public struct PlayEvent has copy, drop {
        // object_id: ID,
        creator: address,
        in_amount: u64,
        win: bool,
        win_amount: u64,
    }

    public struct CoinPool has key {
        id: UID,
        // bal: Table<address, u64>, // 用户的可提起奖励
        amount: Balance<ITPIKA_FAUCET>,
    }

    fun init(ctx: &mut TxContext) {
        // let pool = CoinPool{ id: object::new(ctx), bal: table::new<address, u64>(ctx), total_amount: 0, amount: balance::zero<ITPIKA_FAUCET>()};
        let pool = CoinPool{ id: object::new(ctx), amount: balance::zero<ITPIKA_FAUCET>()};
        transfer::share_object(pool);
    }

    // 猜大小抛骰子游戏, 1 小 2 大,
    entry fun play(r: &Random, cp: &mut CoinPool, user_coin: &mut Coin<ITPIKA_FAUCET>, amount: u64, guess: u8, ctx: &mut TxContext) {
        let coin_amount = amount * 1000000;
        // 判断底金
        let user_bal = coin::value(user_coin);
        assert!(user_bal >= coin_amount, EOverBalance);
        // 判断奖池
        assert!(balance::value(&cp.amount) >= coin_amount, EVaultIsEmpty);

        let mut generator = random::new_generator(r, ctx);
        let val = random::generate_u8_in_range(&mut generator, 1, 6);
        if ((val <= 3 && guess == 1) || (val >= 4 && guess == 2)) {
            // table::add(&mut cp.bal, sender(ctx), user_bal*2);
            let win_coin = coin::from_balance(balance::split(&mut cp.amount, coin_amount*2), ctx);
            user_coin.join(win_coin);
            event::emit(PlayEvent {
                creator: ctx.sender(),
                win: true,
                win_amount: coin_amount * 2,
                in_amount: coin_amount,
            });
        } else {
            // table::add(&mut cp.bal, sender(ctx), user_bal/2);
            let out_amount = user_coin.split(coin_amount, ctx);
            cp.amount.join(coin::into_balance(out_amount));
            event::emit(PlayEvent {
                creator: ctx.sender(),
                win: false,
                win_amount: 0,
                in_amount: coin_amount,
            });
        }
    }

    // 给池注入底金（任何人都可以）
    public entry fun deposit(user_coin: &mut Coin<ITPIKA_FAUCET>, cp: &mut CoinPool, amount: u64, ctx: &mut TxContext) {
        // let mut value = coin::into_balance(user_coin);
        // let in = balance::split(&mut value, amount);

        // let to_addr = object::uid_to_address(&cp.id);
        let in = coin::split(user_coin, amount*1000000, ctx);
        balance::join(&mut cp.amount, coin::into_balance(in));

        // transfer::public_transfer(in, to_addr);
    }

    // 获取池子资金
    public fun get_pool(cp: &mut CoinPool, _ctx: &mut TxContext): u64 {
        return balance::value(&cp.amount)
    }

}
