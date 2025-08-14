#[test_only]
module move_swap::uniswapV2_tests {
    use sui::test_scenario::{Self, Scenario, next_tx, ctx, take_shared, return_shared, take_from_sender, return_to_sender};
    use sui::tx_context::sender;
    use sui::balance;
    use sui::coin::{Self, Coin};
    use move_swap::uniswapV2::{Self, Pool, Factory, LP};

    const ADDR1: address = @0xA;
    const ADDR2: address = @0xB;

    // otws for coins used in tests
    public struct A has drop {}
    public struct B has drop {}
    public struct C has drop {}

    fun test_scenario_init(sender: address): Scenario {
        let mut scenario = test_scenario::begin(sender);
        {
            let ctx = ctx(&mut scenario);
            uniswapV2::test_init(ctx);
        };
        next_tx(&mut scenario, sender);

        scenario
    }

    fun test_scenario_create_pool(scenario: &mut Scenario, init_a: u64, init_b: u64) {
        let mut factory = take_shared<Factory>(scenario);
        let ctx = ctx(scenario);

        let init_a = balance::create_for_testing<A>(init_a);
        let init_b = balance::create_for_testing<B>(init_b);

        let lp = uniswapV2::create_pool(&mut factory, init_a, init_b, ctx);
        transfer::public_transfer(coin::from_balance(lp, ctx), sender(ctx));

        return_shared(factory);
    }

    /* === create pool tests === */

    #[test]
    #[expected_failure(abort_code = uniswapV2::EZeroInput)]
    fun test_create_pool_aborts_on_init_a_zero() {
        let mut scenario = test_scenario_init(ADDR1);
        {
            let mut factory = take_shared<Factory>(&scenario);
            let ctx = ctx(&mut scenario);

            let init_a = balance::zero<A>();
            let init_b = balance::create_for_testing<B>(100);

            let lp = uniswapV2::create_pool(&mut factory, init_a, init_b, ctx);
            transfer::public_transfer(coin::from_balance(lp, ctx), sender(ctx));

            return_shared(factory);
        };

        test_scenario::end(scenario);
    }

    #[test]
    #[expected_failure(abort_code = uniswapV2::EZeroInput)]
    fun test_create_pool_aborts_on_init_b_zero() {
        let mut scenario = test_scenario_init(ADDR1);
        {
            let mut factory = take_shared<Factory>(&scenario);
            let ctx = ctx(&mut scenario);

            let init_a = balance::create_for_testing<A>(100);
            let init_b = balance::zero<B>();

            let lp = uniswapV2::create_pool(&mut factory, init_a, init_b, ctx);
            transfer::public_transfer(coin::from_balance(lp, ctx), sender(ctx));

            return_shared(factory);
        };

        test_scenario::end(scenario);
    }

    #[test]
    #[expected_failure(abort_code = uniswapV2::EPoolAlreadyExists)]
    fun test_create_pool_aborts_on_duplicate_pair() {
        let mut scenario = test_scenario_init(ADDR1);
        {
            let mut factory = take_shared<Factory>(&scenario);
            let ctx = ctx(&mut scenario);

            let init_a = balance::create_for_testing<A>(200);
            let init_b = balance::create_for_testing<B>(100);

            let lp = uniswapV2::create_pool(&mut factory, init_a, init_b, ctx);
            transfer::public_transfer(coin::from_balance(lp, ctx), sender(ctx));

            return_shared(factory);
        };

        next_tx(&mut scenario, ADDR1);
        {
            let mut factory = take_shared<Factory>(&scenario);
            let ctx = ctx(&mut scenario);

            let init_a = balance::create_for_testing<A>(200);
            let init_b = balance::create_for_testing<B>(100);

            let lp = uniswapV2::create_pool(&mut factory, init_a, init_b, ctx); // aborts here
            transfer::public_transfer(coin::from_balance(lp, ctx), sender(ctx));

            return_shared(factory);
        };

        test_scenario::end(scenario);
    }

    #[test]
    #[expected_failure(abort_code = uniswapV2::EInvalidPair)]
    fun test_create_pool_aborts_on_same_type() {
        let mut scenario = test_scenario_init(ADDR1);
        {
            let mut factory = take_shared<Factory>(&scenario);
            let ctx = ctx(&mut scenario);

            let init_a = balance::create_for_testing<A>(200);
            let init_b = balance::create_for_testing<A>(100);

            let lp = uniswapV2::create_pool(&mut factory, init_a, init_b, ctx); // aborts here
            transfer::public_transfer(coin::from_balance(lp, ctx), sender(ctx));

            return_shared(factory);

        };

        test_scenario::end(scenario);
    }

    #[test]
    #[expected_failure(abort_code = uniswapV2::EInvalidPair)]
    fun test_create_pool_aborts_on_wrong_order() {
        let mut scenario = test_scenario_init(ADDR1);
        {
            let mut factory = take_shared<Factory>(&scenario);
            let ctx = ctx(&mut scenario);

            let init_a = balance::create_for_testing<B>(200);
            let init_b = balance::create_for_testing<A>(100);

            let lp = uniswapV2::create_pool(&mut factory, init_a, init_b, ctx); // aborts here
            transfer::public_transfer(coin::from_balance(lp, ctx), sender(ctx));

            return_shared(factory);

        };

        test_scenario::end(scenario);
    }

    #[test]
    fun test_create_pool() {
        let mut scenario = test_scenario_init(ADDR1);
        {
            let ctx = ctx(&mut scenario);
            uniswapV2::test_init(ctx);
        };

        next_tx(&mut scenario, ADDR1);
        {
            let mut factory = take_shared<Factory>(&scenario);
            let ctx = ctx(&mut scenario);

            let init_a = balance::create_for_testing<A>(200);
            let init_b = balance::create_for_testing<B>(100);

            let lp = uniswapV2::create_pool(&mut factory, init_a, init_b, ctx);
            transfer::public_transfer(coin::from_balance(lp, ctx), sender(ctx));

            return_shared(factory);
        };

        next_tx(&mut scenario, ADDR1);
        {
            // test pool
            let pool = take_shared<Pool<A, B>>(&scenario);

            let (amount_a, amount_b, lp_supply) = uniswapV2::pool_balances(&pool);
            assert!(amount_a == 200, 0);
            assert!(amount_b == 100, 0);
            assert!(lp_supply == 141, 0);

            let fee_points = uniswapV2::pool_fees(&pool);
            assert!(fee_points == 30, 0);

            return_shared(pool);
        };

        // create another one
        next_tx(&mut scenario, ADDR1);
        {
            let mut factory = take_shared<Factory>(&scenario);
            let ctx = ctx(&mut scenario);

            let init_a = balance::create_for_testing<A>(200);
            let init_b = balance::create_for_testing<C>(100);

            let lp = uniswapV2::create_pool(&mut factory, init_a, init_b, ctx);
            transfer::public_transfer(coin::from_balance(lp, ctx), sender(ctx));

            return_shared(factory);
        };

        test_scenario::end(scenario);
    }

    /* === add liquidity tests === */

    #[test]
    #[expected_failure(abort_code = uniswapV2::EZeroInput)]
    fun test_add_liquidity_aborts_on_zero_input_a() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 100, 100);

        next_tx(&mut scenario, ADDR2);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let input_a = balance::zero<A>();
            let input_b = balance::create_for_testing<B>(10);
            let (remaining_a, remaining_b, lp) = uniswapV2::add_liquidity(&mut pool, input_a, input_b, 0);

            balance::destroy_for_testing(remaining_a);
            balance::destroy_for_testing(remaining_b);
            balance::destroy_for_testing(lp);

            return_shared(pool);
        };

        test_scenario::end(scenario);
    }

    #[test]
    #[expected_failure(abort_code = uniswapV2::EZeroInput)]
    fun test_add_liquidity_aborts_on_zero_input_b() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 100, 100);

        next_tx(&mut scenario, ADDR2);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let input_a = balance::create_for_testing<A>(10);
            let input_b = balance::zero<B>();
            let (remaining_a, remaining_b, lp) = uniswapV2::add_liquidity(&mut pool, input_a, input_b, 0);

            balance::destroy_for_testing(remaining_a);
            balance::destroy_for_testing(remaining_b);
            balance::destroy_for_testing(lp);

            test_scenario::return_shared(pool);
        };

        test_scenario::end(scenario);
    }

    #[test]
    fun test_add_liquidity_on_empty_pool() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 100, 100);

        // remove liquidity to make pool balances 0
        next_tx(&mut scenario, ADDR1);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let lp_coin = take_from_sender<Coin<LP<A,B>>>(&scenario);
            let (a_out, b_out) = uniswapV2::remove_liquidity(&mut pool, coin::into_balance(lp_coin), 0, 0);

            balance::destroy_for_testing(a_out);
            balance::destroy_for_testing(b_out);

            let (amount_a, amount_b, lp_supply) = uniswapV2::pool_balances(&pool);
            assert!(amount_a == 0 && amount_b == 0 && lp_supply == 0, 0);

            return_shared(pool);
        };

        // add liquidity
        next_tx(&mut scenario, ADDR2);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let input_a = balance::create_for_testing<A>(200);
            let input_b = balance::create_for_testing<B>(100);
            let (remaining_a, remaining_b, lp) = uniswapV2::add_liquidity(&mut pool, input_a, input_b, 141);

            // check returned values
            assert!(balance::value(&remaining_a) == 0, 0);
            assert!(balance::value(&remaining_b) == 0, 0);
            assert!(balance::value(&lp) == 141, 0);

            balance::destroy_for_testing(remaining_a);
            balance::destroy_for_testing(remaining_b);
            balance::destroy_for_testing(lp);
            
            // check pool balances
            let (amount_a, amount_b, lp_supply) = uniswapV2::pool_balances(&pool);
            assert!(amount_a == 200 && amount_b == 100 && lp_supply == 141, 0);

            return_shared(pool);
        };

        test_scenario::end(scenario);
    }

    #[test]
    fun test_add_liquidity() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 100, 50);

        // add liquidity exact (100, 50, 70); -> (300, 150, 210)
        next_tx(&mut scenario, ADDR2);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let input_a = balance::create_for_testing<A>(200);
            let input_b = balance::create_for_testing<B>(100);
            let (remaining_a, remaining_b, lp) = uniswapV2::add_liquidity(&mut pool, input_a, input_b, 140);

            // check returned values
            assert!(balance::value(&remaining_a) == 0, 0);
            assert!(balance::value(&remaining_b) == 0, 0);
            assert!(balance::value(&lp) == 140, 0);

            balance::destroy_for_testing(remaining_a);
            balance::destroy_for_testing(remaining_b);
            balance::destroy_for_testing(lp);

            // check pool balances
            let (amount_a, amount_b, lp_supply) = uniswapV2::pool_balances(&pool);
            assert!(amount_a == 300 && amount_b == 150 && lp_supply == 210, 0);

            return_shared(pool);
        };

        // add liquidity max B (slippage); (300, 150, 210) -> (400, 200, 280)
        next_tx(&mut scenario, ADDR2);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let input_a = balance::create_for_testing<A>(110);
            let input_b = balance::create_for_testing<B>(50);
            let (remaining_a, remaining_b, lp) = uniswapV2::add_liquidity(&mut pool, input_a, input_b, 70);

            // there's extra balance A
            assert!(balance::value(&remaining_a) == 10, 0);
            assert!(balance::value(&remaining_b) == 0, 0);
            assert!(balance::value(&lp) == 70, 0);

            balance::destroy_for_testing(remaining_a);
            balance::destroy_for_testing(remaining_b);
            balance::destroy_for_testing(lp);

            // check pool balances
            let (amount_a, amount_b, lp_supply) = uniswapV2::pool_balances(&pool);
            assert!(amount_a == 400 && amount_b == 200 && lp_supply == 280, 0);

            return_shared(pool);
        };

        // add liquidity max A (slippage); (400, 200, 280) -> (500, 250, 350)
        next_tx(&mut scenario, ADDR2);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let input_a = balance::create_for_testing<A>(100);
            let input_b = balance::create_for_testing<B>(60);
            let (remaining_a, remaining_b, lp) = uniswapV2::add_liquidity(&mut pool, input_a, input_b, 70);

            // there's extra balance B
            assert!(balance::value(&remaining_a) == 0, 0);
            assert!(balance::value(&remaining_b) == 10, 0);
            assert!(balance::value(&lp) == 70, 0);

            balance::destroy_for_testing(remaining_a);
            balance::destroy_for_testing(remaining_b);
            balance::destroy_for_testing(lp);

            // pool balances
            let (amount_a, amount_b, lp_supply) = uniswapV2::pool_balances(&pool);
            assert!(amount_a == 500 && amount_b == 250 && lp_supply == 350, 0);

            return_shared(pool);
        };

        // no lp issued when input too small; (500, 250, 350) -> (501, 251, 350)
        next_tx(&mut scenario, ADDR2);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let input_a = balance::create_for_testing<A>(1);
            let input_b = balance::create_for_testing<B>(1);
            let (remaining_a, remaining_b, lp) = uniswapV2::add_liquidity(&mut pool, input_a, input_b, 0);

            // no lp issued and input balances are fully used up
            assert!(balance::value(&remaining_a) == 0, 0);
            assert!(balance::value(&remaining_b) == 0, 0);
            assert!(balance::value(&lp) == 0, 0);

            balance::destroy_for_testing(remaining_a);
            balance::destroy_for_testing(remaining_b);
            balance::destroy_for_testing(lp);

            // check pool balances
            let (amount_a, amount_b, lp_supply) = uniswapV2::pool_balances(&pool);
            assert!(amount_a == 501 && amount_b == 251 && lp_supply == 350, 0);

            return_shared(pool);
        };

        test_scenario::end(scenario);
    } 

    #[test]
    #[expected_failure(abort_code = uniswapV2::EExcessiveSlippage)]
    fun test_add_liquidity_aborts_on_min_lp_out() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 100, 100);

        next_tx(&mut scenario, ADDR2);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let input_a = balance::create_for_testing<A>(200);
            let input_b = balance::create_for_testing<B>(200);
            let (remaining_a, remaining_b, lp) = uniswapV2::add_liquidity(&mut pool, input_a, input_b, 201); // aborts here

            balance::destroy_for_testing(remaining_a);
            balance::destroy_for_testing(remaining_b);
            balance::destroy_for_testing(lp);

            return_shared(pool);
        };

        test_scenario::end(scenario);
    }

    /* === remove liquidity tests === */

    #[test]
    #[expected_failure(abort_code = uniswapV2::EZeroInput)]
    fun test_remove_liquidity_aborts_on_zero_input_lp() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 100, 100);

        next_tx(&mut scenario, ADDR1);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let lp = balance::zero();
            let (a_out, b_out) = uniswapV2::remove_liquidity(&mut pool, lp, 0, 0); // aborts here

            balance::destroy_for_testing(a_out);
            balance::destroy_for_testing(b_out);

            return_shared(pool);
        };

        test_scenario::end(scenario);
    }

    #[test]
    fun test_remove_liquidity() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 100, 13);

        // remove liquidity (100, 13, 36) -> (64, 9, 23)
        next_tx(&mut scenario, ADDR1);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);
            let mut lp_coin = take_from_sender<Coin<LP<A, B>>>(&scenario);
            assert!(coin::value(&lp_coin) == 36, 0);

            let ctx = ctx(&mut scenario);
            let lp_in = coin::into_balance(coin::split(&mut lp_coin, 13, ctx));
            let (a_out, b_out) = uniswapV2::remove_liquidity(&mut pool, lp_in, 36, 4);

            // check output balances
            assert!(balance::value(&a_out) == 36, 0);
            assert!(balance::value(&b_out) == 4, 0);

            balance::destroy_for_testing(a_out);
            balance::destroy_for_testing(b_out);

            // check pool values
            let (amount_a, amount_b, lp_supply) = uniswapV2::pool_balances(&pool);
            assert!(amount_a == 64 && amount_b == 9 && lp_supply == 23, 0);

            return_shared(pool);
            return_to_sender(&scenario, lp_coin);
        };

        // remove liquidity (64, 9, 23) -> (62, 9, 22)
        next_tx(&mut scenario, ADDR1);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);
            let mut lp_coin = take_from_sender<Coin<LP<A, B>>>(&scenario);
            assert!(coin::value(&lp_coin) == 23, 0);

            let ctx = ctx(&mut scenario);
            let lp_in = coin::into_balance(coin::split(&mut lp_coin, 1, ctx));
            let (a_out, b_out) = uniswapV2::remove_liquidity(&mut pool, lp_in, 2, 0);

            // check output balances
            assert!(balance::value(&a_out) == 2, 0);
            assert!(balance::value(&b_out) == 0, 0);

            balance::destroy_for_testing(a_out);
            balance::destroy_for_testing(b_out);

            // check pool values
            let (amount_a, amount_b, lp_supply) = uniswapV2::pool_balances(&pool);
            assert!(amount_a == 62 && amount_b == 9 && lp_supply == 22, 0);

            return_shared(pool);
            return_to_sender(&scenario, lp_coin);
        };

        // remove all liquidity (62, 9, 22) -> (0, 0, 0)
        next_tx(&mut scenario, ADDR1);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);
            let lp_coin = take_from_sender<Coin<LP<A, B>>>(&scenario);
            assert!(coin::value(&lp_coin) == 22, 0);

            let lp_in = coin::into_balance(lp_coin);
            let (a_out, b_out) = uniswapV2::remove_liquidity(&mut pool, lp_in, 62, 9);

            // check output balances
            assert!(balance::value(&a_out) == 62, 0);
            assert!(balance::value(&b_out) == 9, 0);

            balance::destroy_for_testing(a_out);
            balance::destroy_for_testing(b_out);

            // check pool values
            let (amount_a, amount_b, lp_supply) = uniswapV2::pool_balances(&pool);
            assert!(amount_a == 0 && amount_b == 0 && lp_supply == 0, 0);

            return_shared(pool);
        };

        test_scenario::end(scenario);
    }

    #[test]
    #[expected_failure(abort_code = uniswapV2::EExcessiveSlippage)]
    fun test_remove_liquidity_aborts_on_min_a_out() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 100, 100);

        next_tx(&mut scenario, ADDR1);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);
            let mut lp_coin = take_from_sender<Coin<LP<A, B>>>(&scenario);
            let ctx = ctx(&mut scenario);

            let lp_in = coin::into_balance(coin::split(&mut lp_coin, 50, ctx));
            let (a_out, b_out) = uniswapV2::remove_liquidity(&mut pool, lp_in, 51, 50); // aborts here

            balance::destroy_for_testing(a_out);
            balance::destroy_for_testing(b_out);

            return_shared(pool);
            return_to_sender(&scenario, lp_coin);
        };

        test_scenario::end(scenario);
    }

    #[test]
    #[expected_failure(abort_code = uniswapV2::EExcessiveSlippage)]
    fun test_remove_liquidity_aborts_on_min_b_out() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 100, 100);

        next_tx(&mut scenario, ADDR1);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);
            let mut lp_coin = take_from_sender<Coin<LP<A, B>>>(&scenario);
            let ctx = ctx(&mut scenario);

            let lp_in = coin::into_balance(coin::split(&mut lp_coin, 50, ctx));
            let (a_out, b_out) = uniswapV2::remove_liquidity(&mut pool, lp_in, 50, 51); // aborts here

            balance::destroy_for_testing(a_out);
            balance::destroy_for_testing(b_out);

            return_shared(pool);
            return_to_sender(&scenario, lp_coin);
        };

        test_scenario::end(scenario);
    }

    /* === swap tests === */

    #[test]
    #[expected_failure(abort_code = uniswapV2::EZeroInput)]
    fun test_swap_a_for_b_aborts_on_zero_input_a() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 100, 100);

        next_tx(&mut scenario, ADDR1);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let input_a = balance::zero<A>();
            let b_out = uniswapV2::swap_a_for_b(&mut pool, input_a, 0);

            balance::destroy_for_testing(b_out);

            return_shared(pool);
        };

        test_scenario::end(scenario);
    }

    #[test]
    #[expected_failure(abort_code = uniswapV2::EZeroInput)]
    fun test_swap_b_for_a_aborts_on_zero_input_b() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 100, 100);

        next_tx(&mut scenario, ADDR1);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let input_b = balance::zero<B>();
            let a_out = uniswapV2::swap_b_for_a(&mut pool, input_b, 0);

            balance::destroy_for_testing(a_out);

            return_shared(pool);
        }; 

        test_scenario::end(scenario);
    }

    #[test]
    #[expected_failure(abort_code = uniswapV2::ENoLiquidity)]
    fun test_swap_a_for_b_aborts_on_zero_pool_balances() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 100, 100);

        next_tx(&mut scenario, ADDR1);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);
            let lp_coin = take_from_sender<Coin<LP<A, B>>>(&scenario);

            let (a_out, b_out) = uniswapV2::remove_liquidity(&mut pool, coin::into_balance(lp_coin), 0, 0);
            balance::destroy_for_testing(a_out);
            balance::destroy_for_testing(b_out);

            let input_a = balance::create_for_testing<A>(10);
            let b_out = uniswapV2::swap_a_for_b(&mut pool, input_a, 0); // aborts here

            balance::destroy_for_testing(b_out);

            return_shared(pool);
        };

        test_scenario::end(scenario);
    }

    #[test]
    #[expected_failure(abort_code = uniswapV2::ENoLiquidity)]
    fun test_swap_b_for_a_aborts_on_zero_pool_balances() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 100, 100);

        next_tx(&mut scenario, ADDR1);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);
            let lp_coin = take_from_sender<Coin<LP<A, B>>>(&scenario);

            let (a_out, b_out) = uniswapV2::remove_liquidity(&mut pool, coin::into_balance(lp_coin), 0, 0);
            balance::destroy_for_testing(a_out);
            balance::destroy_for_testing(b_out);

            let input_b = balance::create_for_testing<B>(10); // aborts here
            let a_out = uniswapV2::swap_b_for_a(&mut pool, input_b, 0);

            balance::destroy_for_testing(a_out);

            return_shared(pool);
        };

        test_scenario::end(scenario);
    }

    #[test]
    fun test_swap_a_for_b() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 20000, 10000);

        // swap; (20000, 10000, 14142) -> (21300, 9302, 14142)
        next_tx(&mut scenario, ADDR2);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let input_a = balance::create_for_testing<A>(1300);
            let b_out = uniswapV2::swap_a_for_b(&mut pool, input_a, 608);

            let (amount_a, amount_b, lp_supply) = uniswapV2::pool_balances(&pool);
            assert!(amount_a == 21300 && amount_b == 9392 && lp_supply == 14142, 0);
            assert!(balance::value(&b_out) == 608, 0);

            balance::destroy_for_testing(b_out);

            return_shared(pool);
        };

        // swap too small amount; (21300, 9302, 14142) -> (21301, 9302, 14142)
        next_tx(&mut scenario, ADDR2);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let input_a = balance::create_for_testing<A>(1);
            let b_out = uniswapV2::swap_a_for_b(&mut pool, input_a, 0);

            let (amount_a, amount_b, lp_supply) = uniswapV2::pool_balances(&pool);
            assert!(amount_a == 21301 && amount_b == 9392 && lp_supply == 14142, 0);
            assert!(balance::value(&b_out) == 0, 0);

            balance::destroy_for_testing(b_out);

            return_shared(pool);
        };

        test_scenario::end(scenario);
    }

    #[test]
    fun test_swap_b_for_a() {
        let mut scenario = test_scenario_init(ADDR1);
        test_scenario_create_pool(&mut scenario, 20000, 10000);

        // swap; (20000, 10000, 14142) -> (17706, 11300, 14142)
        next_tx(&mut scenario, ADDR2);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let input_b = balance::create_for_testing<B>(1300);
            let a_out = uniswapV2::swap_b_for_a(&mut pool, input_b, 2294);

            let (amount_a, amount_b, lp_supply) = uniswapV2::pool_balances(&pool);
            assert!(amount_a == 17706 && amount_b == 11300 && lp_supply == 14142, 0);
            assert!(balance::value(&a_out) == 2294, 0);

            balance::destroy_for_testing(a_out);

            return_shared(pool);
        };

        // swap too small amount; (17706, 11300, 14142) -> (17706, 11301, 14142)
        next_tx(&mut scenario, ADDR2);
        {
            let mut pool = take_shared<Pool<A, B>>(&scenario);

            let input_b = balance::create_for_testing<B>(1);
            let a_out = uniswapV2::swap_b_for_a(&mut pool, input_b, 0);

            let (amount_a, amount_b, lp_supply) = uniswapV2::pool_balances(&pool);
            assert!(amount_a == 17706 && amount_b == 11301 && lp_supply == 14142, 0);
            assert!(balance::value(&a_out) == 0, 0);

            balance::destroy_for_testing(a_out);

            return_shared(pool);
        };

        test_scenario::end(scenario);
    }
}

