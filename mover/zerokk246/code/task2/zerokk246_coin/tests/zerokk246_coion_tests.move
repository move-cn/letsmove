#[test_only]
module zerokk246_coion::zerokk246_coion_tests;
use zerokk246_coion::zerokkcoin::{Self,test_init_coin, ZEROKKCOIN};
use sui::coin::{Coin, TreasuryCap};
use sui::test_scenario::{Self};

#[test]
fun test_zerokk246_coin_success() {
    let mut scenario_val = test_scenario::begin(@0x01);
    let scenario = &mut scenario_val;
    test_init_coin(scenario.ctx());

    scenario.next_tx(@0x01);
    {
        let mut treasury_cap = scenario.take_from_sender<TreasuryCap<ZEROKKCOIN>>();
        let ctx = test_scenario::ctx(scenario);
        zerokkcoin::mint( &mut treasury_cap, 100, @0x01, ctx);
        scenario.return_to_sender(treasury_cap);
    };

    scenario.next_tx(@0x01);
    {
        let c = scenario.take_from_sender<Coin<ZEROKKCOIN>>();
        let balance = c.balance();
        assert!(balance.value() == 100, 1);
        scenario.return_to_sender(c);
    };

    scenario.next_tx(@0x01);
    {
        let mut treasury_cap = scenario.take_from_sender<TreasuryCap<ZEROKKCOIN>>();
        let c = scenario.take_from_sender<Coin<ZEROKKCOIN>>();
        zerokkcoin::burn(&mut treasury_cap, c);

        scenario.return_to_sender(treasury_cap);
    };

    scenario_val.end();    
}


#[test, expected_failure]
fun test_zerokk246_coin_fail() {
    let mut scenario_val = test_scenario::begin(@0x01);
    let scenario = &mut scenario_val;
    test_init_coin(scenario.ctx());

    scenario.next_tx(@0x01);
    {
        let mut treasury_cap = scenario.take_from_sender<TreasuryCap<ZEROKKCOIN>>();
        let ctx = test_scenario::ctx(scenario);
        zerokkcoin::mint( &mut treasury_cap, 100, @0x1, ctx);
        scenario.return_to_sender(treasury_cap);
    };

    scenario.next_tx(@0x01);
    {
        let c = scenario.take_from_sender<Coin<ZEROKKCOIN>>();
        let balance = c.balance();
        assert!(balance.value() == 100, 1);
        scenario.return_to_sender(c);
    };

    scenario.next_tx(@0x01);
    {
        let mut treasury_cap = scenario.take_from_sender<TreasuryCap<ZEROKKCOIN>>();
        let c = scenario.take_from_sender<Coin<ZEROKKCOIN>>();
        zerokkcoin::burn(&mut treasury_cap, c);

        scenario.return_to_sender(treasury_cap);
    };

    scenario.next_tx(@0x01);
    {
        // should fail
        let c = scenario.take_from_sender<Coin<ZEROKKCOIN>>();
        scenario.return_to_sender(c);
    };

    scenario_val.end();    
}
