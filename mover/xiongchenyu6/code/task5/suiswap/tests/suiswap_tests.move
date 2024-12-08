#[test_only]
module suiswap::suiswap_tests {
    use sui::test_scenario;
    use sui::coin::{mint_for_testing, destroy_zero}; // Add destroy_zero to imports
    use suiswap::autolife_robotics_swap::{Self, Pool, Position}; // Add Position to imports
    use sui::test_utils::assert_eq;
    use std::debug;
    use std::string;
    
    // Simple test coin with required abilities
    #[allow(unused_field)]
    public struct ATestCoin has store, copy, drop { value: u64 }


    // Simple test coin with required abilities
    #[allow(unused_field)]
    public struct BTestCoin has store, copy, drop { value: u64 }

    const ENotImplemented: u64 = 0;

    fun print_string(str: vector<u8>) {
        debug::print(&string::utf8(str));
    }

    #[test]
    fun test_suiswap() {
        let mut scenario = test_scenario::begin(@0x1);
        let amount_a = 10000000000000000000;
        let amount_b = 78446455000000;
        
        // First transaction: Create pool
        {
            let ctx = test_scenario::ctx(&mut scenario);
            autolife_robotics_swap::create_pool<ATestCoin, BTestCoin>(ctx);
        };
        test_scenario::next_tx(&mut scenario, @0x1);

        // Second transaction: Add liquidity
        {
            let mut pool = test_scenario::take_shared<Pool<ATestCoin, BTestCoin>>(&scenario);
            let ctx = test_scenario::ctx(&mut scenario);

            
            let mut coin_a = mint_for_testing<ATestCoin>(amount_a , ctx);
            let mut coin_b = mint_for_testing<BTestCoin>(amount_b, ctx);

            let lower_tick: u128 = 900;
            let upper_tick: u128 = 1100;
            
            autolife_robotics_swap::add_liquidity(
                &mut pool,
                &mut coin_a,
                &mut coin_b,
                amount_a,
                amount_b,
                lower_tick,
                upper_tick,
                ctx
            );

            // Destroy the remaining coins after adding liquidity
            destroy_zero(coin_a);
            destroy_zero(coin_b);

            let (reserve_a, reserve_b, lsp) = autolife_robotics_swap::get_amounts(&pool);
            print_string(b"=== Initial pool state ===");
            print_string(b"Reserve A:");
            debug::print(&reserve_a);
            print_string(b"Reserve B:");
            debug::print(&reserve_b);
            print_string(b"Total Liquidity:");
            debug::print(&lsp);
            
            assert_eq(reserve_a, amount_a);
            assert_eq(reserve_b, amount_b);

            test_scenario::return_shared(pool);
        };
        test_scenario::next_tx(&mut scenario, @0x1);

        // Third transaction: Swap A to B
        let expected_b = {
            let mut pool = test_scenario::take_shared<Pool<ATestCoin, BTestCoin>>(&scenario);
            let ctx = test_scenario::ctx(&mut scenario);
            
            let mut swap_amount = 100;
            print_string(b"=== Swapping A to B ===");
            print_string(b"Amount in (A):");
            debug::print(&swap_amount);
            
            let mut swap_coin = mint_for_testing<ATestCoin>(swap_amount, ctx);
            let (_, initial_b, _) = autolife_robotics_swap::get_amounts(&pool);
            autolife_robotics_swap::swap_a_to_b(
                &mut pool,
                &mut swap_coin,
                swap_amount,
                ctx
            );
            let (_, final_b, _) = autolife_robotics_swap::get_amounts(&pool);
            let out_amount = initial_b - final_b;
            print_string(b"Amount out (B):");
            debug::print(&out_amount);

            let (reserve_a, reserve_b, lsp) = autolife_robotics_swap::get_amounts(&pool);
            print_string(b"=== After A->B swap ===");
            print_string(b"Reserve A:");
            debug::print(&reserve_a);
            print_string(b"Reserve B:");
            debug::print(&reserve_b);
            print_string(b"LSP:");
            debug::print(&lsp);
            
            assert_eq(reserve_a, amount_a + swap_amount); // 1000 + 100
            // Expected amount should be what's remaining after the swap
            let calculated_b = reserve_b;
            print_string(b"Expected B remaining:");
            debug::print(&calculated_b);
            destroy_zero(swap_coin);
            
            test_scenario::return_shared(pool);
            calculated_b
        };

        // Fourth transaction: Swap B to A
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            let mut pool = test_scenario::take_shared<Pool<ATestCoin, BTestCoin>>(&scenario);
            let ctx = test_scenario::ctx(&mut scenario);
            
            let swap_amount = 50;
            print_string(b"=== Swapping B to A ===");
            print_string(b"Amount in (B):");
            debug::print(&swap_amount);
            
            let mut swap_coin = mint_for_testing<BTestCoin>(swap_amount, ctx);
            let (initial_a, _, _) = autolife_robotics_swap::get_amounts(&pool);
            autolife_robotics_swap::swap_b_to_a(
                &mut pool,
                &mut swap_coin,
                swap_amount,
                ctx
            );
            let (final_a, _, _) = autolife_robotics_swap::get_amounts(&pool);
            let out_amount = initial_a - final_a;
            print_string(b"Amount out (A):");
            debug::print(&out_amount);

            let (final_a, final_b, lsp) = autolife_robotics_swap::get_amounts(&pool);
            print_string(b"=== Final pool state ===");
            print_string(b"Final A:");
            debug::print(&final_a);
            print_string(b"Final B:");
            debug::print(&final_b);
            print_string(b"LSP:");
            debug::print(&lsp);
            
            // Verify the changes
            assert!(final_a < (amount_a + 100)); // Should be less than before
            assert!(final_b > expected_b); // Should be more than before
            destroy_zero(swap_coin);
            
            test_scenario::return_shared(pool);
        };

        // Add new test for remove_liquidity
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            // Take the Position object first
            let position = test_scenario::take_from_sender<Position<ATestCoin, BTestCoin>>(&scenario);
            let mut pool = test_scenario::take_shared<Pool<ATestCoin, BTestCoin>>(&scenario);
            let ctx = test_scenario::ctx(&mut scenario);

            let (initial_a, initial_b, initial_lsp) = autolife_robotics_swap::get_amounts(&pool);
            print_string(b"=== Before remove liquidity ===");
            print_string(b"Initial A:");
            debug::print(&initial_a);
            print_string(b"Initial B:");
            debug::print(&initial_b);
            print_string(b"Initial LSP:");
            debug::print(&initial_lsp);

            autolife_robotics_swap::remove_liquidity(
                &mut pool,
                position,
                ctx
            );

            let (final_a, final_b, final_lsp) = autolife_robotics_swap::get_amounts(&pool);
            print_string(b"=== After remove liquidity ===");
            print_string(b"Final A:");
            debug::print(&final_a);
            print_string(b"Final B:");
            debug::print(&final_b);
            print_string(b"Final LSP:");
            debug::print(&final_lsp);

            // Verify that amounts were reduced
            assert!(final_lsp < initial_lsp);
            assert!(final_a < initial_a);
            assert!(final_b < initial_b);

            test_scenario::return_shared(pool);
        };

        test_scenario::end(scenario);
    }

    #[test, expected_failure(abort_code = ENotImplemented)]
    fun test_suiswap_fail() {
        abort ENotImplemented
    }
}

