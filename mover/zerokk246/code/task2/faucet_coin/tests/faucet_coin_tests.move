#[test_only]
module faucet_coin::faucetcoin_tests;
use sui::coin::{Coin, TreasuryCap};
use sui::test_scenario::{Self};
use faucet_coin::faucetcoin::{Self, test_init_coin};


#[test]
fun test_faucet_coin() {
    let mut scenario_val = test_scenario::begin(@0x01);
    let scenario = &mut scenario_val;
    test_init_coin(scenario.ctx());

    scenario.next_tx(@0x1);
    let mut cap = scenario.take_shared<TreasuryCap<faucetcoin::FAUCETCOIN>>();
    faucetcoin::request_coin(&mut cap, scenario.ctx());

    scenario.next_tx(@0x1);
    let c = scenario.take_from_sender<Coin<faucetcoin::FAUCETCOIN>>();
    assert!(c.balance().value() > 0, 1);

    scenario.return_to_sender(c);
    test_scenario::return_shared(cap);
    scenario_val.end();
}

