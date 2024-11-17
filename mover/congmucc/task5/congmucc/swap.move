/// Module: task5
module congmucc::swap {
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin};
    use sui::object;
    use sui::transfer::{public_transfer, public_share_object};
    use sui::tx_context::sender;
    use task2::my_coin_test::MY_COIN_TEST;
    use task2::share_coin_test::SHARE_COIN_TEST;

    public struct AdminCap has key {
        id: UID,
    }

    public struct Bank has key {
        id: UID,
        nshared_coin: Balance<MY_COIN_TEST>,
        shared_coin: Balance<SHARE_COIN_TEST>,
    }

    fun init(ctx: &mut TxContext) {
        let bank = Bank {
            id: object::new(ctx),
            nshared_coin: balance::zero<MY_COIN_TEST>(),
            shared_coin: balance::zero<SHARE_COIN_TEST>(),
        };

        public_share_object(bank);

        let admin_cap = AdminCap {id: object::new(ctx)};

        public_transfer(admin_cap, sender(ctx));
    }


    public entry fun depostiy_nshared_coin(
        bank: &mut Bank,
        nshared_coin: Coin<MY_COIN_TEST>,
        _: &mut TxContext) {
        let nshared_balance = coin::into_balance(nshared_coin);
        balance::join(&mut bank.nshared_coin, nshared_balance);
    }

    public entry fun deposity_shared_coin(
        bank: &mut Bank,
        shared_coin: Coin<SHARE_COIN_TEST>,
        _: &mut TxContext) {
        let shared_balance = coin::into_balance(shared_coin);
        balance::join(&mut bank.shared_coin, shared_balance);
    }

    public entry fun withdraw_nshared_coin(
        _: &AdminCap,
        bank: &mut Bank,
        amt: u64,
        ctx: &mut TxContext) {
        let nshared_balance = balance::split<MY_COIN_TEST>(&mut bank.nshared_coin, amt);
        let nshared_coin = coin::from_balance(nshared_balance, ctx);
        public_transfer(nshared_coin, sender(ctx));
    }

    public entry fun withdraw_shared_coin(
        _: &AdminCap,
        bank: &mut Bank,
        amt: u64,
        ctx: &mut TxContext) {
        let shared_balance = balance::split<SHARE_COIN_TEST>(&mut bank.shared_coin, amt);
        let shared_coin = coin::from_balance(shared_balance, ctx);
        public_transfer(shared_coin, sender(ctx));
    }


    public entry fun swap_nshared_to_shared(
        bank: &mut Bank,
        nshared_coin: Coin<MY_COIN_TEST>,
        ctx: &mut TxContext) {
            let amt = coin::value(& nshared_coin);
            // 将钱存入银行
            balance::join(&mut bank.nshared_coin, coin::into_balance(nshared_coin));

            // 执行转换逻辑
            let amt_nshared = amt * (20/10);

            let amt_shared = balance::split(&mut bank.shared_coin, amt_nshared);
            // 转换成新的coin
            let shared_coin = coin::from_balance(amt_shared, ctx);
            public_transfer(shared_coin, sender(ctx));
    }

    public entry fun swap_shared_to_nshared(
        bank: &mut Bank,
        shared_coin: Coin<SHARE_COIN_TEST>,
        ctx: &mut TxContext) {
        let amt = coin::value(& shared_coin);
        // 将钱存入银行
        balance::join(&mut bank.shared_coin, coin::into_balance(shared_coin));

        // 执行转换逻辑
        let amt_nshared = amt * 2;

        let amt_nshared = balance::split(&mut bank.nshared_coin, amt_nshared);
        // 转换成新的coin
        let nshared_coin = coin::from_balance(amt_nshared, ctx);
        public_transfer(nshared_coin, sender(ctx));
    }
}
