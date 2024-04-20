#[test_only]
module task2::my_coin_demo_tests {

    use task2::my_coin_demo::{Self, MY_COIN_DEMO};
    use sui::coin::{Coin, TreasuryCap};
    use sui::test_scenario::{Self, next_tx, ctx};

    #[test]
    fun mint_burn() {
        let addr1 = @0xA;

        let mut scenario = test_scenario::begin(addr1);
        
        {
            my_coin_demo::test_init(ctx(&mut scenario))
        };

        next_tx(&mut scenario, addr1);
        {
            let mut treasurycap = test_scenario::take_from_sender<TreasuryCap<MY_COIN_DEMO>>(&scenario);
            my_coin_demo::mint(&mut treasurycap, 100, addr1, test_scenario::ctx(&mut scenario));
            test_scenario::return_to_address<TreasuryCap<MY_COIN_DEMO>>(addr1, treasurycap);
        };

        next_tx(&mut scenario, addr1);
        {
            let coin = test_scenario::take_from_sender<Coin<MY_COIN_DEMO>>(&scenario);
            let mut treasurycap = test_scenario::take_from_sender<TreasuryCap<MY_COIN_DEMO>>(&scenario);
            my_coin_demo::burn(&mut treasurycap, coin);
            test_scenario::return_to_address<TreasuryCap<MY_COIN_DEMO>>(addr1, treasurycap);
        };

        test_scenario::end(scenario);
    }

}