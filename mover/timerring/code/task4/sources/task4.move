/*
/// Module: task4
module task4::task4;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module task4::tgame {
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin};
    use sui::object;
    use sui::object::UID;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, transfer, public_transfer};
    use task2::tcoin_facuet::{Self, TCOIN_FACUET};

    const ExceedPoolAmount: u64 = 1;
    const CoinNotEnough: u64 = 2;

    // admin capability
    public struct AdminCap has key {
        id: UID
    }

    // game pool data
    public struct GamePool has key {
        id: UID,
        amount: Balance<TCOIN_FACUET>
    }

    fun init(ctx: &mut TxContext) {
        // create admin capability
        let adminCap = AdminCap {
            id: object::new(ctx)
        };
        // transfer admin capability to sender
        transfer(adminCap, ctx.sender());
        // create game pool
        let gamePool = GamePool {
            id: object::new(ctx),
            amount: balance::zero()
        };
        // share game pool
        share_object(gamePool);
    }

    // define play function
    public entry fun play(
        in_coin: &mut Coin<TCOIN_FACUET>,
        // game pool
        pool: &mut GamePool,
        // bool judge
        in: bool,
        rand: &Random,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(in_coin.value() > amount, CoinNotEnough);
        // check amount not over game pool amount
        assert!(amount <= pool.amount.value(), ExceedPoolAmount);
        let mut gen = random::new_generator(rand, ctx);
        // generate random bool value
        let ranRes = random::generate_bool(&mut gen);
        if (ranRes == in) {
            // win
            let out_balance = pool.amount.split(amount); // split assign amount balance
            let out_coin = coin::from_balance(out_balance, ctx); // create out coin balance -> coin
            public_transfer(out_coin, ctx.sender()); // transfer out coin to sender
        } else {
            // lose
            let split_coin = coin::split(in_coin, amount, ctx); // coin split
            let split_balance = coin::into_balance(split_coin); // coin into balance
            pool.amount.join(split_balance); // join balance to game pool
        }
    }

    // admin deposit to game pool
    public entry fun deposit(
        // only for admin
        _: &AdminCap,
        in_coin: &mut Coin<TCOIN_FACUET>,
        pool: &mut GamePool,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(in_coin.value() > amount, CoinNotEnough);
        let split_coin = coin::split(in_coin, amount, ctx);
        let split_balance = coin::into_balance(split_coin);
        pool.amount.join(split_balance);
    }

    // get coin (only for admin)
    public entry fun get_coin(_: &AdminCap, pool: &mut GamePool, amount: u64, ctx: &mut TxContext) {
        // amount not over game pool amount
        assert!(amount <= pool.amount.value(), ExceedPoolAmount);
        let out_balance = pool.amount.split(amount); // split assign amount balance
        let out_coin = coin::from_balance(out_balance, ctx); // create out coin balance -> coin
        public_transfer(out_coin, ctx.sender()); // transfer out coin to sender
    }
}