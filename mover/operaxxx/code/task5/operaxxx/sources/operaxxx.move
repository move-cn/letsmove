module operaxxx::operaxxx;

use sui::balance::Balance;
use sui::balance;
use sui::coin::Coin;
use sui::coin;

const E_NOT_ENOUGH_BALANCE: u64 = 1;

public struct Pool<phantom CoinTypeA, phantom CoinTypeB> has key, store {
    id: UID,
    coin_a_balance: Balance<CoinTypeA>,
    coin_b_balance: Balance<CoinTypeB>,
}

public struct AdminCap has key {
    id: UID,
}

fun init(ctx: &mut TxContext) {
    let adminCap = AdminCap { id: object::new(ctx) };

    transfer::transfer(adminCap, ctx.sender())
}

public entry fun create_pool<CoinTypeA, CoinTypeB>(_: &mut AdminCap, ctx: &mut TxContext) {
    let pool = Pool<CoinTypeA, CoinTypeB> {
        id: object::new(ctx),
        coin_a_balance: balance::zero(),
        coin_b_balance: balance::zero(),
    };
    transfer::public_transfer(pool, ctx.sender());
}

public entry fun add_coin_A<CoinTypeA, CoinTypeB>(pool: &mut Pool<CoinTypeA, CoinTypeB>, in: Coin<CoinTypeA>, _: &mut TxContext) {
    pool.coin_a_balance.join(coin::into_balance(in));
}

public entry fun add_coin_B<CoinTypeA, CoinTypeB>(pool: &mut Pool<CoinTypeA, CoinTypeB>, in: Coin<CoinTypeB>, _: &mut TxContext) {
    pool.coin_b_balance.join(coin::into_balance(in));
}

public entry fun swap_to_B<CoinTypeA, CoinTypeB>(pool: &mut Pool<CoinTypeA, CoinTypeB>, in: Coin<CoinTypeA>, ctx: &mut TxContext) {
    let in_value = in.value();
    assert!(pool.coin_b_balance.value() >= in_value, E_NOT_ENOUGH_BALANCE);

    pool.coin_a_balance.join(coin::into_balance(in));
    let out_balance = pool.coin_b_balance.split(in_value);
    transfer::public_transfer(coin::from_balance(out_balance, ctx ), ctx.sender());
}

public entry fun swap_to_A<CoinTypeA, CoinTypeB>(pool: &mut Pool<CoinTypeA, CoinTypeB>, in: Coin<CoinTypeB>, ctx: &mut TxContext) {
    let in_value = in.value();
    assert!(pool.coin_a_balance.value() >= in_value, E_NOT_ENOUGH_BALANCE);

    pool.coin_b_balance.join(coin::into_balance(in));
    let out_balance = pool.coin_a_balance.split(in_value);
    transfer::public_transfer(coin::from_balance(out_balance, ctx), ctx.sender());
}

public entry fun withdraw_coin_A<CoinTypeA, CoinTypeB>(_: &mut AdminCap, pool: &mut Pool<CoinTypeA, CoinTypeB>, amount: u64, ctx: &mut TxContext) {
    assert!(pool.coin_a_balance.value() >= amount, E_NOT_ENOUGH_BALANCE);
    let out_balance = pool.coin_a_balance.split(amount);
    transfer::public_transfer(coin::from_balance(out_balance, ctx), ctx.sender());
}

public entry fun withdraw_coin_B<CoinTypeA, CoinTypeB>(_: &mut AdminCap, pool: &mut Pool<CoinTypeA, CoinTypeB>, amount: u64, ctx: &mut TxContext) {
    assert!(pool.coin_b_balance.value() >= amount, E_NOT_ENOUGH_BALANCE);
    let out_balance = pool.coin_b_balance.split(amount);
    transfer::public_transfer(coin::from_balance(out_balance, ctx), ctx.sender());
}