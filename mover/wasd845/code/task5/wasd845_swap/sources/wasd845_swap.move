
/// Module: wasd845_swap
module wasd845_swap::wasd845_swap {
    use sui::object::{Self, UID};
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};
    use sui::transfer;
    use sui::math;
    use sui::tx_context::{Self, TxContext};

    const E_ZERO_AMOUNT: u64 = 0;
    const E_RESERVES_EMPTY: u64 = 2;
    const E_POOL_FULL: u64 = 4;
    const FEE_SCALING: u128 = 10000;
    const FEE_PERCENT: u128 = 30;
    const MAX_POOL_VALUE: u64 = 18446744073709551615 / 10000;

    public struct LSP<phantom TA, phantom TB> has drop {}

    public struct Pool<phantom TA, phantom TB> has key {
        id: UID,
        token_a: Balance<TA>,
        token_b: Balance<TB>,
        lsp_supply: Supply<LSP<TA, TB>>,
        fee_percent: u64
    }

    fun init(_: &mut TxContext) {}

    entry fun create_pool<TA, TB>(
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ) {
        let fee_percent = FEE_PERCENT as u64;
        let token_a_amt = coin::value(&token_a);
        let token_b_amt = coin::value(&token_b);

        assert!(token_a_amt > 0 && token_b_amt > 0, E_ZERO_AMOUNT);
        assert!(token_a_amt < MAX_POOL_VALUE && token_b_amt < MAX_POOL_VALUE, E_POOL_FULL);

        let share = math::sqrt(token_a_amt) * math::sqrt(token_b_amt);
        let mut lsp_supply = balance::create_supply(LSP<TA, TB> {});
        let lsp = balance::increase_supply(&mut lsp_supply, share);

        let pool = Pool {
            id: object::new(ctx),
            token_a: coin::into_balance(token_a),
            token_b: coin::into_balance(token_b),
            lsp_supply,
            fee_percent,
        };

        transfer::share_object(pool);
        
        transfer::public_transfer(
            coin::from_balance(lsp, ctx),
            tx_context::sender(ctx)
        );
    }

    entry fun add_liquidity<TA, TB>(
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ) {
        assert!(coin::value(&token_a) > 0 && coin::value(&token_b) > 0, E_ZERO_AMOUNT);

        let (token_a_amt, token_b_amt, lsp_supply) = get_amounts(pool);
        assert!(token_a_amt > 0 && token_b_amt > 0, E_RESERVES_EMPTY);

        let token_a_balance = coin::into_balance(token_a);
        let token_b_balance = coin::into_balance(token_b);
        let token_a_added = balance::value(&token_a_balance);
        let token_b_added = balance::value(&token_b_balance);

        let share_minted = math::min(
            (token_a_added * lsp_supply) / token_a_amt,
            (token_b_added * lsp_supply) / token_b_amt
        );

        balance::join(&mut pool.token_a, token_a_balance);
        balance::join(&mut pool.token_b, token_b_balance);

        assert!(token_a_amt < MAX_POOL_VALUE && token_b_amt < MAX_POOL_VALUE, E_POOL_FULL);

        let lsp = balance::increase_supply(&mut pool.lsp_supply, share_minted);
       
        transfer::public_transfer(
            coin::from_balance(lsp, ctx),
            tx_context::sender(ctx)
        )
    }

    entry fun remove_liquidity<TA, TB>(
        pool: &mut Pool<TA, TB>,
        lsp: Coin<LSP<TA, TB>>,
        ctx: &mut TxContext
    ) {
        let lsp_amount = coin::value(&lsp);
        assert!(lsp_amount > 0, E_ZERO_AMOUNT);

        let (token_a_amt, token_b_amt, total_supply) = get_amounts(pool);
        let token_a_share = (token_a_amt * lsp_amount) / total_supply;
        let token_b_share = (token_b_amt * lsp_amount) / total_supply;

        balance::decrease_supply(&mut pool.lsp_supply, coin::into_balance(lsp));

        transfer::public_transfer(coin::take(&mut pool.token_a, token_a_share, ctx), tx_context::sender(ctx));
        transfer::public_transfer(coin::take(&mut pool.token_b, token_b_share, ctx), tx_context::sender(ctx));
    }

    entry fun swap_a_to_b<TA, TB>(
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        ctx: &mut TxContext
    ) {
        let token_a_amt = coin::value(&token_a);
        assert!(token_a_amt > 0, E_ZERO_AMOUNT);

        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        assert!(token_a_amt > 0 && token_b_amt > 0, E_RESERVES_EMPTY);

        let token_b_amt = sell_token_a(pool, token_a_amt);
        balance::join(&mut pool.token_a, coin::into_balance(token_a));

        transfer::public_transfer(coin::take(&mut pool.token_b, token_b_amt, ctx), tx_context::sender(ctx));
    }

    entry fun swap_b_to_a<TA, TB>(
        pool: &mut Pool<TA, TB>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ) {
        let token_b_amt = coin::value(&token_b);
        assert!(token_b_amt > 0, E_ZERO_AMOUNT);

        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        assert!(token_a_amt > 0 && token_b_amt > 0, E_RESERVES_EMPTY);

        let token_a_amt = sell_token_b(pool, token_b_amt);
        balance::join(&mut pool.token_b, coin::into_balance(token_b));

        transfer::public_transfer(coin::take(&mut pool.token_a, token_a_amt, ctx), tx_context::sender(ctx));
    }

    public fun sell_token_a<TA, TB>(pool: &Pool<TA, TB>, to_sell: u64): u64 {
        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        calc_output_amount(
            to_sell,
            token_a_amt,
            token_b_amt,
            pool.fee_percent
        )
    }

    public fun sell_token_b<TA, TB>(pool: &Pool<TA, TB>, to_sell: u64): u64 {
        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        calc_output_amount(
            to_sell,
            token_b_amt,
            token_a_amt,
            pool.fee_percent
        )
    }

    public fun get_amounts<TA, TB>(pool: &Pool<TA, TB>): (u64, u64, u64) {
        (
            balance::value(&pool.token_a),
            balance::value(&pool.token_b),
            balance::supply_value(&pool.lsp_supply),
        )
    }

    public fun calc_output_amount(
        input_amount: u64,
        input_reserve: u64,
        output_reserve: u64,
        fee_percent: u64
    ): u64 {
        let (
            input_amount,
            input_reserve,
            output_reserve,
            fee_percent
        ) = (
            (input_amount as u128),
            (input_reserve as u128),
            (output_reserve as u128),
            (fee_percent as u128),
        );
        
        let input_with_fee = input_amount * FEE_SCALING / (FEE_SCALING - fee_percent);

        let total = input_reserve * output_reserve;
        let output_amount = output_reserve - total / (input_reserve + input_with_fee);

        (output_amount as u64)
    }
}

