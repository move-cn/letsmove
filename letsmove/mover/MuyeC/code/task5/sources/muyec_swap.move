module task5::muyec_swap {

    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::Coin;
    use sui::transfer::{share_object, public_transfer};
    use sui::tx_context::sender;
    use task5::coin_a::COIN_A;
    use task5::coin_b::COIN_B;

    public struct AdminCap has key, store {
        id: UID,
    }

    public struct Bank has key, store {
        id: UID,
        coin_a: Balance<COIN_A>,
        coin_b: Balance<COIN_B>
    }

    // 创建银行
    fun init(ctx: &mut TxContext) {
        let bank = Bank {
            id: object::new(ctx),
            coin_a: balance::zero<COIN_A>(),
            coin_b: balance::zero<COIN_B>(),
        };
        share_object(bank);
        let admin_cap = AdminCap { id: object::new(ctx) };
        public_transfer(admin_cap, sender(ctx));
    }

    // 存 A 币
    public entry fun deposit_a(bank: &mut Bank, coin_a: Coin<COIN_A>, _ctx: &mut TxContext) {
        let a_balance: Balance<COIN_A> = coin::into_balance(coin_a);
        balance::join(&mut bank.coin_a, a_balance);
    }

    // 存 B 币
    public entry fun deposit_b(bank: &mut Bank, coin_b: Coin<COIN_B>, _ctx: &mut TxContext) {
        let b_balance: Balance<COIN_B> = coin::into_balance(coin_b);
        balance::join(&mut bank.coin_b, b_balance);
    }

    // 取 A 币
    public entry fun withdraw_a(_admin_cap: &AdminCap, bank: &mut Bank, amt: u64, ctx: &mut TxContext) {
        let a_balance = balance::split(&mut bank.coin_a, amt);
        let coin_a = coin::from_balance(a_balance, ctx);
        public_transfer(coin_a, sender(ctx));
    }

    // 取 B 币
    public entry fun withdraw_b(_admin_cap: &AdminCap, bank: &mut Bank, amt: u64, ctx: &mut TxContext) {
        let b_balance = balance::split(&mut bank.coin_b, amt);
        let coin_b = coin::from_balance(b_balance, ctx);
        public_transfer(coin_b, sender(ctx));
    }

    // 用 COIN_A 换 COIN_B
    public entry fun swap_a_b(bank: &mut Bank, coin_a: Coin<COIN_A>, ctx: &mut TxContext) {
        let amt: u64 = coin::value(&coin_a);
        let a_balance: Balance<COIN_A> = coin::into_balance(coin_a);
        balance::join(&mut bank.coin_a, a_balance);

        let amt_b: u64 = amt / 2;
        let b_balance: Balance<COIN_B> = balance::split(&mut bank.coin_b, amt_b);
        let coin_b: Coin<COIN_B> = coin::from_balance(b_balance, ctx);
        public_transfer(coin_b, sender(ctx));
    }

    // 用 COIN_B 换 COIN_A
    public entry fun swap_b_a(bank: &mut Bank, coin_b: Coin<COIN_B>, ctx: &mut TxContext) {
        let amt: u64 = coin::value(&coin_b);
        let b_balance: Balance<COIN_B> = coin::into_balance(coin_b);
        balance::join(&mut bank.coin_b, b_balance);

        let amt_a: u64 = amt * 2;
        let a_balance: Balance<COIN_A> = balance::split(&mut bank.coin_a, amt_a);
        let coin_a: Coin<COIN_A> = coin::from_balance(a_balance, ctx);
        public_transfer(coin_a, sender(ctx));
    }

}
