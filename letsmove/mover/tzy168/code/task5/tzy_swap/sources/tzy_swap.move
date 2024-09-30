module tzy_swap::simple_swap {
    use sui::object::{Self, UID};
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use swap_coin::ca::CA;
    use swap_coin::cb::CB;
    // Pool Struct
    public struct Pool has key {
        id: UID,
        coin_a: Balance<CA>,
        coin_b: Balance<CB>,
    }

    // Initialize function
    fun init(ctx: &mut TxContext) {}

    // Function to create a new pool
    public entry fun create_pool(
        token_a: Coin<CA>,
        token_b: Coin<CB>,
        ctx: &mut TxContext
    ) {
        transfer::share_object(Pool {
            id: object::new(ctx),
            coin_a: coin::into_balance(token_a),
            coin_b: coin::into_balance(token_b),
        });
    }

    // Add liquidity function
    public entry fun add(
        pool: &mut Pool,
        coin_a: Coin<CA>,
        coin_b: Coin<CB>,
        _: &mut TxContext
    ) {
        let a_balance = coin::into_balance(coin_a);
        let b_balance = coin::into_balance(coin_b);
        balance::join(&mut pool.coin_a, a_balance);
        balance::join(&mut pool.coin_b, b_balance);
    }


    public entry fun swap_a_to_b(
        pool: &mut Pool,
        amount_a: Coin<CA>,
        ctx: &mut TxContext
    ) {
        let coin_a_balance = balance::value(&pool.coin_a);
        let coin_b_balance = balance::value(&pool.coin_b);
        let amount_a_value = coin::value(&amount_a);

        // Manually calculate: ΔY = (Y * ΔX) / (X + ΔX)
        let numerator = coin_b_balance * amount_a_value;
        let denominator = coin_a_balance + amount_a_value;
        let delta_y = numerator / denominator;

        // Update pool balances
        balance::join(&mut pool.coin_a, coin::into_balance(amount_a));
        let new_b_balance = balance::split(&mut pool.coin_b, delta_y);

        // Create the new Coin<CB> and transfer it to the caller
        let coin_b = coin::from_balance(new_b_balance, ctx);
        transfer::public_transfer(coin_b, tx_context::sender(ctx));
    }

    public entry fun swap_b_to_a(
        pool: &mut Pool,
        amount_b: Coin<CB>,
        ctx: &mut TxContext){

        let coin_a_balance = balance::value(&pool.coin_a);
        let coin_b_balance = balance::value(&pool.coin_b);
        let amount_b_value = coin::value(&amount_b);

        let numerator = coin_a_balance * amount_b_value;
        let denominator = coin_b_balance + amount_b_value;
        let delta_x = numerator / denominator;

        // Update pool balances
        balance::join(&mut pool.coin_b, coin::into_balance(amount_b));
        let new_a_balance = balance::split(&mut pool.coin_a, delta_x);

        let coin_a = coin::from_balance(new_a_balance, ctx);
        transfer::public_transfer(coin_a, tx_context::sender(ctx));
        }

}
