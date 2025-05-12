/// Module: betheldev_swap
module betheldev_swap::betheldev_swap;
use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::Coin;

const EInsufficientBalance: u64 = 12;

public struct AdminCap has key {
    id: UID
}

public struct BankData<phantom A, phantom B> has key {
    id: UID,
    coin_a: Balance<A>,
    coin_b: Balance<B>,
    rate: u64   // value_b = value_a * rate
}

fun init(ctx: &mut TxContext) {
    let admin = AdminCap{
        id: object::new(ctx)
    };

    transfer::transfer(admin, tx_context::sender(ctx));
}

public fun initialize<A,B>(_:&AdminCap, coinA: Coin<A>, coinB: Coin<B>, ratez: u64, ctx: &mut TxContext) {
    let bank = BankData<A,B> {
        id: object::new(ctx),
        coin_a: coin::into_balance(coinA), // balance::zero<A>(),
        coin_b: coin::into_balance(coinB), // balance::zero<B>(),
        rate: ratez
    };

    transfer::share_object(bank);
}

public fun set_rate<A,B>(_: &AdminCap, bank: &mut BankData<A,B>, rate: u64, _ctx: &mut TxContext) {
    bank.rate = rate
}

public entry fun deposite<A,B>(coinA: Coin<A>, coinB: Coin<B>, bank: &mut BankData<A,B>) {
    let balance1 = coin::into_balance(coinA);
    bank.coin_a.join(balance1);
    let balance2 = coin::into_balance(coinB);
    bank.coin_b.join(balance2);
}

public entry fun swap4B<A,B>(coinA: Coin<A>, bank: &mut BankData<A,B>, ctx: &mut TxContext){
    let va = coinA.value();
    assert!(va>0, EInsufficientBalance);
    let vb = va*bank.rate;
    assert!(bank.coin_b.value()>vb , EInsufficientBalance);

    let coinB = coin::take(&mut bank.coin_b, vb, ctx);
    transfer::public_transfer(coinB, tx_context::sender(ctx));

    let balance1 = coin::into_balance(coinA);
    bank.coin_a.join(balance1);
}

public entry fun swap4A<A,B>(coinB: Coin<B>, bank: &mut BankData<A,B>, ctx: &mut TxContext){
    let vb = coinB.value();
    assert!(vb>0, EInsufficientBalance);
    let va = vb/bank.rate;
    assert!(bank.coin_a.value()>va , EInsufficientBalance);

    let coinA = coin::take(&mut bank.coin_a, va, ctx);
    transfer::public_transfer(coinA, tx_context::sender(ctx));

    let balance1 = coin::into_balance(coinB);
    bank.coin_b.join(balance1);
}

public fun withdraw<A,B>(_: &AdminCap, bank: &mut BankData<A,B>, ctx: &mut TxContext){
    let va= bank.coin_a.value();
    let ca = coin::take(&mut bank.coin_a, va, ctx);
    transfer::public_transfer(ca, tx_context::sender(ctx));

    let vb= bank.coin_b.value();
    let cb = coin::take(&mut bank.coin_b, vb, ctx);
    transfer::public_transfer(cb, tx_context::sender(ctx));
}
