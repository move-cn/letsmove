module task5::swap {

    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};

    const ETreasuryNotEnough: u64 = 0;

    public struct Treasury<phantom T, phantom V> has key {
        id: UID,
        coin_a: Balance<T>,
        coin_b: Balance<V>,
    }

    public fun new<T, V>(ctx: &mut TxContext) {
        let treasury = Treasury {
            id: object::new(ctx),
            coin_a: balance::zero<T>(),
            coin_b: balance::zero<V>(),
        };
        transfer::share_object(treasury);
    }

    public fun add_liquidity<T, V>(treasury: &mut Treasury<T, V>, coin_a: Coin<T>, coin_b: Coin<V>) {
        let (treasury_coin_a, treasury_coin_b) = get_coin_mut<T, V>(treasury);
        balance::join(treasury_coin_a, coin::into_balance(coin_a));
        balance::join(treasury_coin_b, coin::into_balance(coin_b));
    }

    public fun swap_a_to_b<T, V>(treasury: &mut Treasury<T, V>, coin_a: Coin<T>, ctx: &mut TxContext): Coin<V> {
        let (treasury_coin_a, treasury_coin_b) = get_coin_mut<T, V>(treasury);

        let coin_value = coin::value(&coin_a);
        let treasury_coin_b_value = balance::value(treasury_coin_b);
        assert!(treasury_coin_b_value >= coin_value, ETreasuryNotEnough);

        balance::join(treasury_coin_a, coin::into_balance(coin_a));

        let balance_out = balance::split(treasury_coin_b, coin_value);
        let coin_out = coin::from_balance(balance_out, ctx);

        coin_out
    }

    public fun swap_b_to_a<T, V>(treasury: &mut Treasury<T, V>, coin_b: Coin<V>, ctx: &mut TxContext): Coin<T> {
        let (treasury_coin_a, treasury_coin_b) = get_coin_mut<T, V>(treasury);

        let coin_value = coin::value(&coin_b);
        let treasury_coin_a_value = balance::value(treasury_coin_a);
        assert!(treasury_coin_a_value >= coin_value, ETreasuryNotEnough);

        balance::join(treasury_coin_b, coin::into_balance(coin_b));

        let balance_out = balance::split(treasury_coin_a, coin_value);
        let coin_out = coin::from_balance(balance_out, ctx);

        coin_out
    }

    public(package) fun get_coin_mut<T, V>(treasury: &mut Treasury<T, V>): (&mut Balance<T>, &mut Balance<V>) {
        (&mut treasury.coin_a, &mut treasury.coin_b)
    }

    public(package) fun get_coin<T, V>(treasury: &Treasury<T, V>): (&Balance<T>, &Balance<V>) {
        (&treasury.coin_a, &treasury.coin_b)
    }
}