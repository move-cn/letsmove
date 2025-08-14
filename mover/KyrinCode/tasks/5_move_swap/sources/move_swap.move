module move_swap::uniswapV2 {
    use std::type_name::{Self, TypeName};
    use sui::balance::{Self, Balance, Supply};
    use sui::coin::{Self, Coin};
    use sui::event;
    use sui::math;
    use std::ascii;
    use sui::table::{Self, Table};
    use sui::tx_context::sender;

    /* === errors === */

    /// The input amount is zero.
    const EZeroInput: u64 = 0;
    /// Pool pair coin types must be ordered alphabetically (`A` < `B`) and mustn't be equal.
    const EInvalidPair: u64 = 1;
    /// Pool for this pair already exists.
    const EPoolAlreadyExists: u64 = 2;
    /// The pool balance differs from the acceptable.
    const EExcessiveSlippage: u64 = 3;
    /// There's no liquidity in the pool.
    const ENoLiquidity: u64 = 4;

    /* === constants === */

    const LP_FEE_BASE: u64 = 10000;

    /* === math === */

    /// Calculates (a * b) / c. Errors if result doesn't fit into u64.
    fun muldiv(a: u64, b: u64, c: u64): u64 {
        ((((a as u128) * (b as u128)) / (c as u128)) as u64)
    }

    /// Calculates ceil_div((a * b), c). Errors if result doesn't fit into u64.
    fun ceil_muldiv(a: u64, b: u64, c: u64): u64 {
        (ceil_div_u128((a as u128) * (b as u128), (c as u128)) as u64)
    }

    /// Calculates sqrt(a * b).
    fun mulsqrt(a: u64, b: u64): u64 {
        (math::sqrt_u128((a as u128) * (b as u128)) as u64)
    }

    /// Calculates ceil(a / b).
    fun ceil_div_u128(a: u128, b: u128): u128 {
        if (a == 0) 0 else (a - 1) / b + 1
    }

    /* === events === */

    public struct PoolCreated has copy, drop {
        pool_id: ID,
        a: TypeName,
        b: TypeName,
        init_a: u64,
        init_b: u64,
        lp_minted: u64,
    }

    public struct LiquidityAdded has copy, drop {
        pool_id: ID,
        a: TypeName,
        b: TypeName,
        amountin_a: u64,
        amountin_b: u64,
        lp_minted: u64,
    }

    public struct LiquidityRemoved has copy, drop {
        pool_id: ID,
        a: TypeName,
        b: TypeName,
        amountout_a: u64,
        amountout_b: u64,
        lp_burnt: u64,
    }

    public struct Swapped has copy, drop {
        pool_id: ID,
        tokenin: TypeName,
        amountin: u64,
        tokenout: TypeName,
        amountout: u64,
    }

    /* === LP witness === */

    public struct LP<phantom A, phantom B> has drop {}

    /* === Pool === */

    public struct Pool<phantom A, phantom B> has key {
        id: UID,
        balance_a: Balance<A>,
        balance_b: Balance<B>,
        lp_supply: Supply<LP<A, B>>,
        /// Fees for liquidity provider expressed in points (1 point is 0.01%)
        fee_points: u64,
    }

    public fun pool_balances<A, B>(pool: &Pool<A, B>): (u64, u64, u64) {
        (
            balance::value(&pool.balance_a),
            balance::value(&pool.balance_b),
            balance::supply_value(&pool.lp_supply)
        )
    }

    public fun pool_fees<A, B>(pool: &Pool<A, B>): u64 {
        pool.fee_points
    }

    /* === Factory === */

    public struct Factory has key {
        id: UID,
        table: Table<PoolItem, bool>,
    }

    public struct PoolItem has copy, drop, store  {
        a: TypeName,
        b: TypeName
    }

    fun add_pool<A, B>(factory: &mut Factory) {
        let a = type_name::get<A>();
        let b = type_name::get<B>();
        assert!(cmp_type_names(&a, &b) == 0, EInvalidPair);

        let item = PoolItem{ a, b };
        assert!(table::contains(&factory.table, item) == false, EPoolAlreadyExists);

        table::add(&mut factory.table, item, true)
    }

    // returns: 0 if a < b; 1 if a == b; 2 if a > b
    public fun cmp_type_names(a: &TypeName, b: &TypeName): u8 {
        let bytes_a = ascii::as_bytes(type_name::borrow_string(a));
        let bytes_b = ascii::as_bytes(type_name::borrow_string(b));

        let len_a = vector::length(bytes_a);
        let len_b = vector::length(bytes_b);

        let mut i = 0;
        let n = math::min(len_a, len_b);
        while (i < n) {
            let a = *vector::borrow(bytes_a, i);
            let b = *vector::borrow(bytes_b, i);

            if (a < b) {
                return 0
            };
            if (a > b) {
                return 2
            };
            i = i + 1;
        };

        if (len_a == len_b) {
            return 1
        };

        return if (len_a < len_b) {
            0
        } else {
            2
        }
    }

    /* === main logic === */

    fun init(ctx: &mut TxContext) {
        let factory = Factory { 
            id: object::new(ctx),
            table: table::new(ctx),
        };
        transfer::share_object(factory);
    }

    public fun create_pool<A, B>(factory: &mut Factory, init_a: Balance<A>, init_b: Balance<B>, ctx: &mut TxContext): Balance<LP<A, B>> {
        assert!(balance::value(&init_a) > 0 && balance::value(&init_b) > 0, EZeroInput);

        add_pool<A, B>(factory);

        // create pool
        let mut pool = Pool<A, B> {
            id: object::new(ctx),
            balance_a: init_a,
            balance_b: init_b,
            lp_supply: balance::create_supply(LP<A, B> {}),
            fee_points: 30, // 0.3%
        };

        // mint initial lp tokens
        let lp_amount = mulsqrt(balance::value(&pool.balance_a), balance::value(&pool.balance_b));
        let lp_balance = balance::increase_supply(&mut pool.lp_supply, lp_amount);

        event::emit(PoolCreated {
            pool_id: object::id(&pool),
            a: type_name::get<A>(),
            b: type_name::get<B>(),
            init_a: balance::value(&pool.balance_a), // test error?
            init_b: balance::value(&pool.balance_b),
            lp_minted: lp_amount,
        });

        transfer::share_object(pool);

        lp_balance
    }

    public fun add_liquidity<A, B>(pool: &mut Pool<A, B>, mut input_a: Balance<A>, mut input_b: Balance<B>, min_lp_out: u64): (Balance<A>, Balance<B>, Balance<LP<A, B>>) {
        assert!(balance::value(&input_a) > 0 && balance::value(&input_b) > 0, EZeroInput);

        // calculate the deposit amounts
        let input_a_mul_pool_b: u128 = (balance::value(&input_a) as u128) * (balance::value(&pool.balance_b) as u128);
        let input_b_mul_pool_a: u128 = (balance::value(&input_b) as u128) * (balance::value(&pool.balance_a) as u128);

        let deposit_a: u64;
        let deposit_b: u64;
        let lp_to_issue: u64;
        if (input_a_mul_pool_b > input_b_mul_pool_a) { // input_a / pool_a > input_b / pool_b
            deposit_b = balance::value(&input_b);
            // pool_a * deposit_b / pool_b
            deposit_a = (ceil_div_u128(
                input_b_mul_pool_a,
                (balance::value(&pool.balance_b) as u128),
            ) as u64);
            // deposit_b / pool_b * lp_supply
            lp_to_issue = muldiv(
                deposit_b,
                balance::supply_value(&pool.lp_supply),
                balance::value(&pool.balance_b)
            );
        } else if (input_a_mul_pool_b < input_b_mul_pool_a) { // input_a / pool_a < input_b / pool_b
            deposit_a = balance::value(&input_a);
            // pool_b * deposit_a / pool_a
            deposit_b = (ceil_div_u128(
                input_a_mul_pool_b,
                (balance::value(&pool.balance_a) as u128),
            ) as u64);
            // deposit_a / pool_a * lp_supply
            lp_to_issue = muldiv(
                deposit_a,
                balance::supply_value(&pool.lp_supply),
                balance::value(&pool.balance_a)
            );
        } else {
            deposit_a = balance::value(&input_a);
            deposit_b = balance::value(&input_b);
            if (balance::supply_value(&pool.lp_supply) == 0) {
                // in this case both pool balances are 0 and lp supply is 0
                lp_to_issue = mulsqrt(deposit_a, deposit_b);
            } else {
                // the ratio of input a and b matches the ratio of pool balances
                lp_to_issue = muldiv(
                    deposit_a,
                    balance::supply_value(&pool.lp_supply),
                    balance::value(&pool.balance_a)
                );
            }
        };

        // deposit amounts into pool 
        balance::join(
            &mut pool.balance_a,
            balance::split(&mut input_a, deposit_a)
        );
        balance::join(
            &mut pool.balance_b,
            balance::split(&mut input_b, deposit_b)
        );

        // mint lp coin
        assert!(lp_to_issue >= min_lp_out, EExcessiveSlippage);
        let lp = balance::increase_supply(&mut pool.lp_supply, lp_to_issue);

        event::emit(LiquidityAdded {
            pool_id: object::id(pool),
            a: type_name::get<A>(),
            b: type_name::get<B>(),
            amountin_a: deposit_a,
            amountin_b: deposit_b,
            lp_minted: lp_to_issue,
        });

        // return
        (input_a, input_b, lp)
    }

    public fun remove_liquidity<A, B>(pool: &mut Pool<A, B>, lp_in: Balance<LP<A, B>>, min_a_out: u64, min_b_out: u64): (Balance<A>, Balance<B>) {
        assert!(balance::value(&lp_in) > 0, EZeroInput);

        // calculate output amounts
        let lp_in_amount = balance::value(&lp_in);
        let pool_a_amount = balance::value(&pool.balance_a);
        let pool_b_amount = balance::value(&pool.balance_b);
        let lp_supply = balance::supply_value(&pool.lp_supply);

        let a_out = muldiv(lp_in_amount, pool_a_amount, lp_supply);
        let b_out = muldiv(lp_in_amount, pool_b_amount, lp_supply);
        assert!(a_out >= min_a_out, EExcessiveSlippage);
        assert!(b_out >= min_b_out, EExcessiveSlippage);

        // burn lp tokens
        balance::decrease_supply(&mut pool.lp_supply, lp_in);

        event::emit(LiquidityRemoved {
            pool_id: object::id(pool),
            a: type_name::get<A>(),
            b: type_name::get<B>(),
            amountout_a: a_out,
            amountout_b: b_out,
            lp_burnt: lp_in_amount,
        });

        // return amounts
        (
            balance::split(&mut pool.balance_a, a_out),
            balance::split(&mut pool.balance_b, b_out)
        )
    }

    public fun swap_a_for_b<A, B>(pool: &mut Pool<A, B>, input: Balance<A>, min_out: u64): Balance<B> {
        assert!(balance::value(&input) > 0, EZeroInput);
        assert!(balance::value(&pool.balance_a) > 0 && balance::value(&pool.balance_b) > 0, ENoLiquidity);

        // calculate swap result
        let input_amount = balance::value(&input);
        let pool_a_amount = balance::value(&pool.balance_a);
        let pool_b_amount = balance::value(&pool.balance_b);

        let out_amount = calc_swap_out(input_amount, pool_a_amount, pool_b_amount, pool.fee_points);

        assert!(out_amount >= min_out, EExcessiveSlippage);

        // deposit input
        balance::join(&mut pool.balance_a, input);

        event::emit(Swapped {
            pool_id: object::id(pool),
            tokenin: type_name::get<A>(),
            amountin: input_amount,
            tokenout: type_name::get<B>(),
            amountout: out_amount,
        });

        // return output
        balance::split(&mut pool.balance_b, out_amount)
    }

    public fun swap_b_for_a<A, B>(pool: &mut Pool<A, B>, input: Balance<B>, min_out: u64): Balance<A> {
        assert!(balance::value(&input) > 0, EZeroInput);
        assert!(balance::value(&pool.balance_a) > 0 && balance::value(&pool.balance_b) > 0, ENoLiquidity);

        // calculate swap result
        let input_amount = balance::value(&input);
        let pool_b_amount = balance::value(&pool.balance_b);
        let pool_a_amount = balance::value(&pool.balance_a);

        let out_amount = calc_swap_out(input_amount, pool_b_amount, pool_a_amount, pool.fee_points);

        assert!(out_amount >= min_out, EExcessiveSlippage);

        // deposit input
        balance::join(&mut pool.balance_b, input);

        event::emit(Swapped {
            pool_id: object::id(pool),
            tokenin: type_name::get<B>(),
            amountin: input_amount,
            tokenout: type_name::get<A>(),
            amountout: out_amount,
        });

        // return output
        balance::split(&mut pool.balance_a, out_amount)
    }

    /// Calclates swap result and fees based on the input amount and current pool state.
    fun calc_swap_out(input_amount: u64, input_pool_amount: u64, out_pool_amount: u64, fee_points: u64): u64 {
        // calc out value
        let fee_amount = ceil_muldiv(input_amount, fee_points, LP_FEE_BASE);
        let input_amount_after_fee = input_amount - fee_amount;
        // (out_pool_amount - out_amount) * (input_pool_amount + input_amount_after_fee) = out_pool_amount * input_pool_amount
        // (out_pool_amount - out_amount) / out_pool_amount = input_pool_amount / (input_pool_amount + input_amount_after_fee)
        // out_amount / out_pool_amount = input_amount_after_fee / (input_pool_amount + input_amount_after_fee)
        let out_amount = muldiv(input_amount_after_fee, out_pool_amount, input_pool_amount + input_amount_after_fee);

        out_amount
    }

    /* === with coin === */

    fun destroy_zero_or_transfer_balance<T>(balance: Balance<T>, recipient: address, ctx: &mut TxContext) {
        if (balance::value(&balance) == 0) {
            balance::destroy_zero(balance);
        } else {
            transfer::public_transfer(coin::from_balance(balance, ctx), recipient);
        };
    }

    public fun create_pool_with_coins<A, B>(factory: &mut Factory, init_a: Coin<A>, init_b: Coin<B>, ctx: &mut TxContext): Coin<LP<A, B>> {
        let lp_balance = create_pool(factory, coin::into_balance(init_a), coin::into_balance(init_b), ctx);
        
        coin::from_balance(lp_balance, ctx)
    }

    public entry fun create_pool_with_coins_and_transfer_lp_to_sender<A, B>(factory: &mut Factory, init_a: Coin<A>, init_b: Coin<B>, ctx: &mut TxContext) {
        let lp_balance = create_pool(factory, coin::into_balance(init_a), coin::into_balance(init_b), ctx);
        transfer::public_transfer(coin::from_balance(lp_balance, ctx), sender(ctx));
    }

    public fun add_liquidity_with_coins<A, B>(pool: &mut Pool<A, B>, input_a: Coin<A>, input_b: Coin<B>, min_lp_out: u64, ctx: &mut TxContext): (Coin<A>, Coin<B>, Coin<LP<A, B>>) {
        let (remaining_a, remaining_b, lp) = add_liquidity(pool, coin::into_balance(input_a), coin::into_balance(input_b), min_lp_out);

        (
            coin::from_balance(remaining_a, ctx),
            coin::from_balance(remaining_b, ctx),
            coin::from_balance(lp, ctx),
        )
    }

    public entry fun add_liquidity_with_coins_and_transfer_to_sender<A, B>(pool: &mut Pool<A, B>, input_a: Coin<A>, input_b: Coin<B>, min_lp_out: u64, ctx: &mut TxContext) {
        let (remaining_a, remaining_b, lp) = add_liquidity(pool, coin::into_balance(input_a), coin::into_balance(input_b), min_lp_out);
        let sender = sender(ctx);
        destroy_zero_or_transfer_balance(remaining_a, sender, ctx);
        destroy_zero_or_transfer_balance(remaining_b, sender, ctx);
        destroy_zero_or_transfer_balance(lp, sender, ctx);
    }

    public fun remove_liquidity_with_coins<A, B>(pool: &mut Pool<A, B>, lp_in: Coin<LP<A, B>>, min_a_out: u64, min_b_out: u64, ctx: &mut TxContext): (Coin<A>, Coin<B>) {
        let (a_out, b_out) = remove_liquidity(pool, coin::into_balance(lp_in), min_a_out, min_b_out);

        (
            coin::from_balance(a_out, ctx),
            coin::from_balance(b_out, ctx),
        )
    }

    public entry fun remove_liquidity_with_coins_and_transfer_to_sender<A, B>(pool: &mut Pool<A, B>, lp_in: Coin<LP<A, B>>, min_a_out: u64, min_b_out: u64, ctx: &mut TxContext) {
        let (a_out, b_out) = remove_liquidity(pool, coin::into_balance(lp_in), min_a_out, min_b_out);
        let sender = sender(ctx);
        destroy_zero_or_transfer_balance(a_out, sender, ctx);
        destroy_zero_or_transfer_balance(b_out, sender, ctx);
    }

    public fun swap_a_for_b_with_coin<A, B>(pool: &mut Pool<A, B>, input: Coin<A>, min_out: u64, ctx: &mut TxContext): Coin<B> {
        let b_out = swap_a_for_b(pool, coin::into_balance(input), min_out);

        coin::from_balance(b_out, ctx)
    }

    public entry fun swap_a_for_b_with_coin_and_transfer_to_sender<A, B>(pool: &mut Pool<A, B>, input: Coin<A>, min_out: u64, ctx: &mut TxContext) {
        let b_out = swap_a_for_b(pool, coin::into_balance(input), min_out);
        transfer::public_transfer(coin::from_balance(b_out, ctx), sender(ctx));
    }

    public fun swap_b_for_a_with_coin<A, B>(pool: &mut Pool<A, B>, input: Coin<B>, min_out: u64, ctx: &mut TxContext): Coin<A> {
        let a_out = swap_b_for_a(pool, coin::into_balance(input), min_out);

        coin::from_balance(a_out, ctx)
    }

    public entry fun swap_b_for_a_with_coin_and_transfer_to_sender<A, B>(pool: &mut Pool<A, B>, input: Coin<B>, min_out: u64, ctx: &mut TxContext) {
        let a_out = swap_b_for_a(pool, coin::into_balance(input), min_out);
        transfer::public_transfer(coin::from_balance(a_out, ctx), sender(ctx));
    }

    /* === test === */

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(ctx)
    }

    #[test_only]
    public struct BAR has drop {}
    #[test_only]
    public struct FOO has drop {}
    #[test_only]
    public struct FOOD has drop {}
    #[test_only]
    public struct FOOd has drop {}

    #[test]
    fun test_cmp_type_names() {
        assert!(cmp_type_names(&type_name::get<BAR>(), &type_name::get<FOO>()) == 0, 0);
        assert!(cmp_type_names(&type_name::get<FOO>(), &type_name::get<FOO>()) == 1, 0);
        assert!(cmp_type_names(&type_name::get<FOO>(), &type_name::get<BAR>()) == 2, 0);

        assert!(cmp_type_names(&type_name::get<FOO>(), &type_name::get<FOOd>()) == 0, 0);
        assert!(cmp_type_names(&type_name::get<FOOd>(), &type_name::get<FOO>()) == 2, 0);

        assert!(cmp_type_names(&type_name::get<FOOD>(), &type_name::get<FOOd>()) == 0, 0);
        assert!(cmp_type_names(&type_name::get<FOOd>(), &type_name::get<FOOD>()) == 2, 0);
    }

    #[test_only]
    fun test_destroy_empty_factory(factory: Factory) {
        let Factory { id, table } = factory;
        object::delete(id);
        table::destroy_empty(table);
    }

    #[test_only]
    fun test_remove_pool_item<A, B>(factory: &mut Factory) {
        let a = type_name::get<A>();
        let b = type_name::get<B>();
        table::remove(&mut factory.table, PoolItem{ a, b });
    }

    #[test]
    fun test_factory() {
        let ctx = &mut tx_context::dummy();
        let mut factory = Factory { 
            id: object::new(ctx),
            table: table::new(ctx),
        };

        add_pool<BAR, FOO>(&mut factory);
        add_pool<FOO, FOOd>(&mut factory);

        test_remove_pool_item<BAR, FOO>(&mut factory);
        test_remove_pool_item<FOO, FOOd>(&mut factory);
        test_destroy_empty_factory(factory);
    }

    #[test]
    #[expected_failure(abort_code = EInvalidPair)]
    fun test_add_pool_aborts_on_wrong_order() {
        let ctx = &mut tx_context::dummy();
        let mut factory = Factory { 
            id: object::new(ctx),
            table: table::new(ctx),
        };

        add_pool<FOO, BAR>(&mut factory);

        test_remove_pool_item<FOO, BAR>(&mut factory);
        test_destroy_empty_factory(factory);
    }

    #[test]
    #[expected_failure(abort_code = EInvalidPair)]
    fun test_add_pool_aborts_on_same_type() {
        let ctx = &mut tx_context::dummy();
        let mut factory = Factory { 
            id: object::new(ctx),
            table: table::new(ctx),
        };

        add_pool<FOO, FOO>(&mut factory);

        test_remove_pool_item<FOO, FOO>(&mut factory);
        test_destroy_empty_factory(factory);
    }

    #[test]
    #[expected_failure(abort_code = EPoolAlreadyExists)]
    fun test_add_pool_aborts_on_already_exists() {
        let ctx = &mut tx_context::dummy();
        let mut factory = Factory { 
            id: object::new(ctx),
            table: table::new(ctx),
        };

        add_pool<BAR, FOO>(&mut factory);
        add_pool<BAR, FOO>(&mut factory); // aborts here

        test_remove_pool_item<BAR, FOO>(&mut factory);
        test_destroy_empty_factory(factory);
    }
}