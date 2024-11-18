#[test_only]
module move_game::move_game_tests;
// uncomment this line to import the module
use move_game::klren0312_game::{get_random};
use std::debug::print;
use sui::test_scenario as ts;
use sui::random::{Random, create_for_testing};

#[test]
fun test_get_random() {
    let user = @0x0;
    let mut ts = ts::begin(user);
    create_for_testing(ts.ctx());
    ts.next_tx(user);
    let mut random_state: Random = ts.take_shared();
    random_state.update_randomness_state_for_testing(0, x"feaafeaafeaafeaa", ts.ctx());
    let number = get_random(&random_state, ts.ctx());
    print(&number);
    random_state.update_randomness_state_for_testing(1, x"feaafeaafeaafeaa", ts.ctx());
    let number2 = get_random(&random_state, ts.ctx());
    print(&number2);
    random_state.update_randomness_state_for_testing(2, x"feaafeaafeaafeaa", ts.ctx());
    let number3 = get_random(&random_state, ts.ctx());
    print(&number3);
    ts::return_shared(random_state);
    ts.end();
}


