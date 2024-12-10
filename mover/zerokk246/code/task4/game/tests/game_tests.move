#[test_only]
module game::game_tests;
use game::game;
use game::game::{Game, balance};
use sui::test_scenario::{Self};
use sui::coin::{Coin, TreasuryCap};
use faucet_coin::faucetcoin::{Self, test_init_coin};
use sui::random;


const ENotImplemented: u64 = 0;

#[test]
fun test_game() {
    let mut scenario_val = test_scenario::begin(@0x01);
    let scenario = &mut scenario_val;
    game::test_init(scenario.ctx());
    test_init_coin(scenario.ctx());

    scenario.next_tx(@0x1);
    let mut cap = scenario.take_shared<TreasuryCap<faucetcoin::FAUCETCOIN>>();
    faucetcoin::request_coin(&mut cap, scenario.ctx());
    faucetcoin::request_coin(&mut cap, scenario.ctx());
    faucetcoin::request_coin(&mut cap, scenario.ctx());

    scenario.next_tx(@0x1);
    let c = scenario.take_from_sender<Coin<faucetcoin::FAUCETCOIN>>();
    assert!(c.balance().value() > 0, 1);

    scenario.next_tx(@0x01);
    let mut g = scenario.take_shared<Game>();

    assert!(g.balance() == 0, 1);
    game::add_sui(&mut g, c, scenario.ctx());
    let old = g.balance();
    assert!(old == 1000, 1);

    scenario.next_tx(@0x0);
    random::create_for_testing(scenario.ctx());
    scenario.next_tx(@0x0);
    let rand = scenario.take_shared<random::Random>();

    scenario.next_tx(@0x01);
    let c = scenario.take_from_sender<Coin<faucetcoin::FAUCETCOIN>>();
    assert!(c.balance().value() > 0, 1);
    game::play(&mut g, false, c, &rand, scenario.ctx());
    assert!(old != g.balance(), 1);

    test_scenario::return_shared(cap);
    test_scenario::return_shared(rand);
    test_scenario::return_shared(g);
    scenario_val.end();
}

#[test, expected_failure]
fun test_game_fail() {
    abort ENotImplemented
}

