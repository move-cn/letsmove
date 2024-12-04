module windyund::CoinSwap {

    use sui::balance::{Self, zero, Balance};
    use sui::coin::{Self, Coin};
    use sui::object::{Self, UID};
    use sui::table::drop;
    use sui::transfer::{public_transfer, transfer, share_object};
    use sui::tx_context::{Self, TxContext};


    public struct AdminCap has key {
        id: UID
    }
    //  简单版
    public struct Bank<phantom A, phantom B> has key {
        id: UID,
        coin1: Balance<A>,
        coin2: Balance<B>
    }

    fun init(ctx: &mut TxContext) {
        let adminCap = AdminCap { id: object::new(ctx) };
        transfer(adminCap, tx_context::sender(ctx));
    }

    public entry fun createPoool<A, B>(ctx: &mut TxContext) {
        let bank = Bank {
            id: object::new(ctx),
            coin1: zero<A>(),
            coin2: zero<B>()
        };
        share_object(bank);
    }

    // 存A
    public entry fun depositA<A, B>(bank: &mut Bank<A, B>, coin1: Coin<A>, ctx: &mut TxContext) {
        let balance = coin::into_balance<A>(coin1);
        balance::join<A>(&mut bank.coin1, balance);
    }

    // 取A
    public entry fun withdrawA<A, B>(bank: &mut Bank<A, B>, amount: u64, ctx: &mut TxContext) {
        let a_balance = balance::split<A>(&mut bank.coin1, amount);
        let coinA = coin::from_balance<A>(a_balance, ctx);
        public_transfer(coinA, tx_context::sender(ctx));
    }


    // 存B
    public entry fun depositB<A, B>(bank: &mut Bank<A, B>, coin2: Coin<B>, ctx: &mut TxContext) {
        let balance = coin::into_balance<B>(coin2);
        balance::join<B>(&mut bank.coin2, balance);
    }

    // 取B
    public entry fun withdrawB<A, B>(bank: &mut Bank<A, B>, amount: u64, ctx: &mut TxContext) {
        let a_balance = balance::split<B>(&mut bank.coin2, amount);
        let coinA = coin::from_balance<B>(a_balance, ctx);
        public_transfer(coinA, tx_context::sender(ctx));
    }

    // 1:1 兑换
    public entry fun swapA_to_B<A, B>(bank: &mut Bank<A, B>, coinA: Coin<A>, ctx: &mut TxContext) {
        let amount = coin::value<A>(&coinA);
        // 减少 b, 发送给兑换人
        let remain_coin2 = balance::split<B>(&mut bank.coin2, amount);
        let coin_b = coin::from_balance<B>(remain_coin2, ctx);
        public_transfer(coin_b, tx_context::sender(ctx));
        // 增加 a
        let a_balance = coin::into_balance<A>(coinA);
        balance::join<A>(&mut bank.coin1, a_balance);
    }


    // 1:1 兑换
    public entry fun swapB_to_A<A, B>(bank: &mut Bank<A, B>, coinB: Coin<B>, ctx: &mut TxContext) {
        let amount = coin::value<B>(&coinB);
        // 减少 a, 发送给兑换人
        let remain_coin2 = balance::split<A>(&mut bank.coin1, amount);
        let coin_a = coin::from_balance<A>(remain_coin2, ctx);
        public_transfer(coin_a, tx_context::sender(ctx));
        // 增加 b
        let a_balance = coin::into_balance<B>(coinB);
        balance::join<B>(&mut bank.coin2, a_balance);
    }
}
