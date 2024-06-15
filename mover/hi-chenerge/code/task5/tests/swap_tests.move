#[test_only]
module hichenerge::swap_tests {

    use std::debug;
    use std::string::utf8;
    use sui::coin;
    use sui::coin::{TreasuryCap, Coin};
    use sui::test_scenario;
    use task2::chenerge;
    use task2::chenerge::CHENERGE;
    use task2::chenerge_faucet::CHENERGE_FAUCET;
    use hichenerge::swap::{test_init, Pool, deposit_a, deposit_b, withdraw_a, AdminCap, withdraw_b, swap_a_2_b, swap_b_2_a};


    #[test]
    fun test(){
        let deployer = @0x1;
        let player1 = @0x2;
        let player2 = @0x3;

        let mut scenario = test_scenario::begin(deployer);
        {
            task2::chenerge::test_init(test_scenario::ctx(&mut scenario));
            task2::chenerge_faucet::test_init(test_scenario::ctx(&mut scenario));

            test_init(test_scenario::ctx(&mut scenario));
        };

        // mint coin1 to player1,2
        scenario.next_tx(deployer);
        {
            let mut treasury_cap = test_scenario::take_from_sender<TreasuryCap<CHENERGE>>(&scenario);

            task2::chenerge::mint(&mut treasury_cap, 1000, player1, test_scenario::ctx(&mut scenario));
            task2::chenerge::mint(&mut treasury_cap, 1000, player2, test_scenario::ctx(&mut scenario));

            test_scenario::return_to_sender(&scenario, treasury_cap);
        };

        // player1 mint coin2
        scenario.next_tx(player1);
        {
            let mut treasury_cap = test_scenario::take_shared<TreasuryCap<CHENERGE_FAUCET>>(&scenario);

            task2::chenerge_faucet::mint(&mut treasury_cap, 10000, test_scenario::ctx(&mut scenario));

            test_scenario::return_shared(treasury_cap);
        };

        // player2 mint coin2
        // scenario.next_tx(player2);
        // {
        //     let mut treasury_cap = test_scenario::take_shared<TreasuryCap<CHENERGE_FAUCET>>(&scenario);
        //
        //     task2::chenerge_faucet::mint(&mut treasury_cap, 10000, test_scenario::ctx(&mut scenario));
        //
        //     test_scenario::return_shared(treasury_cap);
        // };

        // player1 deposit coin1,coin2
        scenario.next_tx(player1);
        {
            let coinA = test_scenario::take_from_sender<Coin<CHENERGE>>(&scenario);
            let coinB = test_scenario::take_from_sender<Coin<CHENERGE_FAUCET>>(&scenario);

            let v = coin::value(&coinA);
            debug::print(&v);

            let mut pool = test_scenario::take_shared<Pool>(&scenario);
            debug::print(&pool);
            deposit_a(&mut pool, coinA, test_scenario::ctx(&mut scenario));
            deposit_b(&mut pool, coinB, test_scenario::ctx(&mut scenario));

            test_scenario::return_shared(pool);
        };

        // scenario.next_tx(player2);
        // {
        //     let coinA = test_scenario::take_from_sender<Coin<CHENERGE>>(&scenario);
        //     let coinB = test_scenario::take_from_sender<Coin<CHENERGE_FAUCET>>(&scenario);
        //
        //     let v = coin::value(&coinA);
        //     debug::print(&v);
        //
        //     let mut pool = test_scenario::take_shared<Pool>(&scenario);
        //     deposit_a(&mut pool, coinA, test_scenario::ctx(&mut scenario));
        //     deposit_b(&mut pool, coinB, test_scenario::ctx(&mut scenario));
        //
        //     test_scenario::return_shared(pool);
        // };

        // scenario.next_tx(deployer);
        // {
        //     let mut pool = test_scenario::take_shared<Pool>(&scenario);
        //     debug::print(&pool);
        //
        //     let adminCap = test_scenario::take_from_sender<AdminCap>(&scenario);
        //     withdraw_a(&adminCap, &mut pool, 88, test_scenario::ctx(&mut scenario));
        //     withdraw_b(&adminCap, &mut pool, 388, test_scenario::ctx(&mut scenario));
        //
        //     debug::print(&pool);
        //
        //     test_scenario::return_shared(pool);
        //     test_scenario::return_to_sender(&scenario, adminCap);
        // };

        // scenario.next_tx(deployer);
        // {
        //     let mut treasury_cap = test_scenario::take_from_sender<TreasuryCap<CHENERGE>>(&scenario);
        //
        //     task2::chenerge::mint(&mut treasury_cap, 22, player1, test_scenario::ctx(&mut scenario));
        //
        //     test_scenario::return_to_sender(&scenario, treasury_cap);
        // };


        // scenario.next_tx(player1);
        // {
        //     let coinA = test_scenario::take_from_sender<Coin<CHENERGE>>(&scenario);
        //     let v = coin::value(&coinA);
        //     debug::print(&v);
        //
        //     let mut pool = test_scenario::take_shared<Pool>(&scenario);
        //
        //     swap_a_2_b(&mut pool, coinA, test_scenario::ctx(&mut scenario));
        //
        //     debug::print(&pool);
        //
        //     test_scenario::return_shared(pool);
        // };

        // player1 mint coin2
        scenario.next_tx(player1);
        {
            let mut treasury_cap = test_scenario::take_shared<TreasuryCap<CHENERGE_FAUCET>>(&scenario);

            task2::chenerge_faucet::mint(&mut treasury_cap, 3000, test_scenario::ctx(&mut scenario));

            test_scenario::return_shared(treasury_cap);
        };

        // player1 swap coin2 to coin1
        scenario.next_tx(player1);
        {
            let mut coin = test_scenario::take_from_sender<Coin<CHENERGE_FAUCET>>(&scenario);

            let v = coin::value(&coin);
            debug::print(&v);

            let mut pool = test_scenario::take_shared<Pool>(&scenario);

            swap_b_2_a(&mut pool, coin, test_scenario::ctx(&mut scenario));

            debug::print(&pool);

            test_scenario::return_shared(pool);
            test_scenario::return_to_sender(&scenario, coin);
        };

        scenario.end();
    }

}
