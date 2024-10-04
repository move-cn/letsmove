/// Module: sch678_swap
module sch678_swap::sch678_swap {
    use sui::balance::{Self, zero, Balance};
    use sui::coin::{Self, Coin};

    public struct AdminCap has key {
        id: UID
    }

    public struct Pool<phantom A, phantom B> has key {
        id: UID,
        coin1: Balance<A>,
        coin2: Balance<B>
    }

    fun init(ctx: &mut TxContext) {
        let adminCap = AdminCap { id: object::new(ctx) };
        transfer::transfer(adminCap, tx_context::sender(ctx));
    }

    public entry fun createPoool<A, B>(ctx: &mut TxContext) {
        let pool = Pool {
            id: object::new(ctx),
            coin1: zero<A>(),
            coin2: zero<B>()
        };
        transfer::share_object(pool);
    }

    public entry fun depositA<A, B>(pool: &mut Pool<A, B>, coin1: Coin<A>) {
        let balance = coin::into_balance<A>(coin1);
        balance::join<A>(&mut pool.coin1, balance);
    }

    public entry fun withdrawA<A, B>(pool: &mut Pool<A, B>, amount: u64, ctx: &mut TxContext) {
        let a_balance = balance::split<A>(&mut pool.coin1, amount);
        let coinA = coin::from_balance<A>(a_balance, ctx);
        transfer::public_transfer(coinA, tx_context::sender(ctx));
    }

    public entry fun depositB<A, B>(pool: &mut Pool<A, B>, coin2: Coin<B>) {
        let balance = coin::into_balance<B>(coin2);
        balance::join<B>(&mut pool.coin2, balance);
    }

    public entry fun withdrawB<A, B>(pool: &mut Pool<A, B>, amount: u64, ctx: &mut TxContext) {
        let a_balance = balance::split<B>(&mut pool.coin2, amount);
        let coinA = coin::from_balance<B>(a_balance, ctx);
        transfer::public_transfer(coinA, tx_context::sender(ctx));
    }

    public entry fun swapA_to_B<A, B>(pool: &mut Pool<A, B>, coinA: Coin<A>, ctx: &mut TxContext) {
        let amount = coin::value<A>(&coinA);
        let remain_coin2 = balance::split<B>(&mut pool.coin2, amount);
        let coin_b = coin::from_balance<B>(remain_coin2, ctx);
        transfer::public_transfer(coin_b, tx_context::sender(ctx));

        let a_balance = coin::into_balance<A>(coinA);
        balance::join<A>(&mut pool.coin1, a_balance);
    }

    public entry fun swapB_to_A<A, B>(pool: &mut Pool<A, B>, coinB: Coin<B>, ctx: &mut TxContext) {
        let amount = coin::value<B>(&coinB);
        let remain_coin2 = balance::split<A>(&mut pool.coin1, amount);
        let coin_a = coin::from_balance<A>(remain_coin2, ctx);
        transfer::public_transfer(coin_a, tx_context::sender(ctx));
        
        let a_balance = coin::into_balance<B>(coinB);
        balance::join<B>(&mut pool.coin2, a_balance);
    }
}

/*
0x1fc78db78d245cc34acb24705519756e35c5467d7d8050e776cb8d2fe861a4c5::sch678_swap::Pool
<
0x4a60c022fd34869bc0a5e2fd2ed92035fde46b429b8691da5eaa65c48a138a76::sch678_faucet_coin::SCH678_FAUCET_COIN,
0x456be599b2176b2426608f653999b38d3c41c49ac065969c7bdfd24da0be86e4::sch678_coin::SCH678_COIN
>
*/

// Pool: 0x61822673fcc31ba1af07639cf6748df8b0673ebfa7c688e0b8b453aa9eaf05dd