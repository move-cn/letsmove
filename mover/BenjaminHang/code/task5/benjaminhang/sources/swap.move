module benjaminhang::swap {

    use sui::balance::{Balance, zero, join, split};
    use sui::coin;
    use sui::coin::{Coin, into_balance, from_balance};
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;

    public struct Bank<phantom COIN_1, phantom COIN_2> has key {
        id: UID,
        coin1: Balance<COIN_1>,
        coin2: Balance<COIN_2>
    }

    public struct AdminCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let admin = AdminCap {
            id: object::new(ctx),
        };

        transfer(admin, sender(ctx));
    }

    public entry fun create_bank<COIN_1, COIN_2>(ctx: &mut TxContext) {
        let bank = Bank<COIN_1, COIN_2> {
            id: object::new(ctx),
            coin1: zero<COIN_1>(),
            coin2: zero<COIN_2>(),
        };
        share_object(bank);
    }

    // 内部存钱函数
    fun deposit<T>(bank_coin: &mut Balance<T>, in: Coin<T>) {
        let in_balance = into_balance(in);
        join(bank_coin, in_balance);
    }

    // 内部取钱函数
    fun withdraw<T>(bank_coin: &mut Balance<T>, amt: u64, ctx: &mut TxContext) {
        let out_balance = split(bank_coin, amt);
        let out_coin = from_balance(out_balance, ctx);
        public_transfer(out_coin, sender(ctx));
    }

    // 存coin1
    public entry fun deposit_coin1<COIN_1, COIN_2>(
        bank: &mut Bank<COIN_1, COIN_2>,
        in: Coin<COIN_1>,
        _: &mut TxContext
    ) {
        deposit(&mut bank.coin1, in);
    }

    // 取coin1
    public entry fun withdraw_coin1<COIN_1, COIN_2>(
        _: &AdminCap,
        bank: &mut Bank<COIN_1, COIN_2>,
        amt: u64,
        ctx: &mut TxContext
    ) {
        withdraw(&mut bank.coin1, amt, ctx);
    }

    // 存coin2
    public entry fun deposit_coin2<COIN_1, COIN_2>(
        bank: &mut Bank<COIN_1, COIN_2>,
        in: Coin<COIN_2>,
        _: &mut TxContext
    ) {
        deposit(&mut bank.coin2, in);
    }

    // 取coin2
    public entry fun withdraw_coin2<COIN_1, COIN_2>(
        _: &AdminCap,
        bank: &mut Bank<COIN_1, COIN_2>,
        amt: u64,
        ctx: &mut TxContext
    ) {
        withdraw(&mut bank.coin2, amt, ctx);
    }

    // swap coin1 to coin2
    public entry fun swap_1_2<COIN_1, COIN_2>(
        bank: &mut Bank<COIN_1, COIN_2>,
        in: Coin<COIN_1>,
        ctx: &mut TxContext
    ) {
        let in_value = coin::value(&in);
        let out_amt = in_value * 73 / 10;

        deposit(&mut bank.coin1, in);
        withdraw(&mut bank.coin2, out_amt, ctx);
    }

    // swap coin2 to coin1
    public entry fun swap_2_1<COIN_1, COIN_2>(
        bank: &mut Bank<COIN_1, COIN_2>,
        in: Coin<COIN_2>,
        ctx: &mut TxContext
    ) {
        let in_value = coin::value(&in);
        let out_amt = in_value * 10 / 73;

        deposit(&mut bank.coin2, in);
        withdraw(&mut bank.coin1, out_amt, ctx);
    }
}
