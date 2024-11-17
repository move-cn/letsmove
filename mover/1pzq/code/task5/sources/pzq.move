module swap::pzq{
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};
    use sui::math;

    const EZeroAmount: u64 = 0;
    public struct LSP<phantom TA, phantom TB> has drop {}

    public struct Pool<phantom TA, phantom TB> has key {
        id: UID,
        token_a: Balance<TA>,
        token_b: Balance<TB>,
        lsp_supply: Supply<LSP<TA, TB>>,
    }

    fun init(_: &mut TxContext) {
    }

    entry fun create_pool<TA, TB> (
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            create_pool_inner(token_a, token_b, ctx),
            tx_context::sender(ctx)
        );
    }

    fun create_pool_inner<TA, TB> (
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ): Coin<LSP<TA, TB>> {

        let token_a_amt = coin::value(&token_a);
        let token_b_amt = coin::value(&token_b);

        let share = math::sqrt(token_a_amt) * math::sqrt(token_b_amt);
        let mut lsp_supply = balance::create_supply(LSP<TA, TB> {});
        let lsp = balance::increase_supply(&mut lsp_supply, share);

        transfer::share_object(Pool {
            id: object::new(ctx),
            token_a: coin::into_balance(token_a),
            token_b: coin::into_balance(token_b),
            lsp_supply,
        });

        coin::from_balance(lsp, ctx)
    }


    entry fun swap_a_to_b<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        ctx: &mut TxContext
    ) {
       
        transfer::public_transfer(
            swap_a_to_b_inner(pool, token_a, ctx),
            tx_context::sender(ctx)
        )
    }

    fun swap_a_to_b_inner<TA, TB>(
    pool: &mut Pool<TA, TB>,
    input_token_a: Coin<TA>,
    ctx: &mut TxContext
): Coin<TB> {
    assert!(coin::value(&input_token_a) > 0, EZeroAmount);

    let token_a_balance = coin::into_balance(input_token_a);
    balance::join(&mut pool.token_a, token_a_balance);
    coin::take(&mut pool.token_b, 1, ctx)
}



    entry fun swap_b_to_a<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            swap_b_to_a_inner(pool, token_b, ctx),
            tx_context::sender(ctx)
        )
    }

    fun swap_b_to_a_inner<TA, TB> (
    pool: &mut Pool<TA, TB>,
    token_b: Coin<TB>,
    ctx: &mut TxContext
): Coin<TA> {
    let token_b_balance = coin::into_balance(token_b);
    balance::join(&mut pool.token_b, token_b_balance);
    coin::take(&mut pool.token_a, 1, ctx)
}

    public fun get_amounts<TA, TB>(pool: &Pool<TA, TB>): (u64, u64, u64) {
        (
            balance::value(&pool.token_a),
            balance::value(&pool.token_b),
            balance::supply_value(&pool.lsp_supply),
        )
    }

   

}