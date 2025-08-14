module myswap::myswap {
    use sui::tx_context::{Self, TxContext};
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    use sui::sui::SUI;
    use sui::transfer;
    use sui::object::{Self, UID};
    use std::option::{Self};

    struct MYSWAP has drop {}

    struct AdminCap has key, store {
        id: UID,
    }

    struct Pool <phantom A, phantom B> has key {
        id: UID,
        coin_a: Balance<A>,
        coin_b: Balance<B>,
    }

    fun init(witness: MYSWAP, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"MYSWAP",
            b"MS",
            b"my swap for test",
            option::none(),
            ctx
        );
        let c = coin::mint(&mut treasury, 10000000, ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
        transfer::public_transfer(c, tx_context::sender(ctx));
        let admin_cap = AdminCap {
            id: object::new(ctx),
        };
        transfer::public_transfer(admin_cap, tx_context::sender(ctx));
        let pool = Pool {
            id: object::new(ctx),
            coin_a: balance::zero<SUI>(),
            coin_b: balance::zero<MYSWAP>(),
        };
        transfer::share_object(pool);
    }

    public entry fun Add<A, B>(pool: &mut Pool<A, B>, coin_a: Coin<A>, coin_b: Coin<B>, _: &mut TxContext) {
        let balance_a = coin::into_balance<A>(coin_a);
        let balance_b = coin::into_balance<B>(coin_b);
        balance::join(&mut pool.coin_a, balance_a);
        balance::join(&mut pool.coin_b, balance_b);
    }

    public entry fun swap_a_to_b<A, B>(pool: &mut Pool<A, B>, coin_a: &mut Coin<A>, amout: u64, ctx: &mut TxContext) {
        let balance_a = balance::split(coin::balance_mut<A>(coin_a), amout);
        let return_b = balance::split(&mut pool.coin_b, amout);
        let coin_b = coin::from_balance<B>(return_b, ctx);
        balance::join(&mut pool.coin_a, balance_a);
        transfer::public_transfer(coin_b, tx_context::sender(ctx));
    }

    public entry fun swap_b_to_a<A, B>(pool: &mut Pool<A, B>, coin_b: &mut Coin<B>, amout: u64, ctx: &mut TxContext) {
        let balance_b = balance::split(coin::balance_mut<B>(coin_b), amout);
        let return_a = balance::split(&mut pool.coin_a, amout);
        let coin_a = coin::from_balance<A>(return_a, ctx);
        balance::join(&mut pool.coin_b, balance_b);
        transfer::public_transfer(coin_a, tx_context::sender(ctx));
    }
}