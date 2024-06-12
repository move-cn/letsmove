#[test_only]
module coin::coin_tests {
    // uncomment this line to import the module
    use std::debug;
    use coin::faucet_coin::{Self, FAUCET_COIN};
    use coin::my_coin::{Self, MY_COIN};
    use sui::test_scenario as ts;
    use sui::coin::{Self, Coin, TreasuryCap};

    #[test]
    fun test_my_coin() {
        let admin = @0xA;
        let mut scenario = ts::begin(admin);

        // init
        ts::next_tx(&mut scenario, admin);
        {
            my_coin::test_for_init(scenario.ctx());
        };

        // mint 100 coin => admin
        ts::next_tx(&mut scenario, admin);
        {
            let mut treasurycap = ts::take_from_sender<TreasuryCap<MY_COIN>>(&scenario);
            my_coin::mint(&mut treasurycap, 100, admin, scenario.ctx());
            // ts::return_to_address<TreasuryCap<MY_COIN>>(admin, treasurycap);
            ts::return_to_sender<TreasuryCap<MY_COIN>>(&scenario, treasurycap);
        };

        // query [admin] coin
        ts::next_tx(&mut scenario, admin);
        {
            let coin = ts::take_from_sender<Coin<MY_COIN>>(&scenario);
            debug::print(&coin::value(&coin));
            ts::return_to_sender<Coin<MY_COIN>>(&scenario, coin);
        };

        // burn
        ts::next_tx(&mut scenario, admin);
        {
            let coin = ts::take_from_sender<Coin<MY_COIN>>(&scenario);
            let mut treasurycap = ts::take_from_sender<TreasuryCap<MY_COIN>>(&scenario);
            my_coin::burn(&mut treasurycap, coin);
            ts::return_to_address<TreasuryCap<MY_COIN>>(admin, treasurycap);
        };

        ts::end(scenario);
        // pass
    }

    #[test]
    fun test_faucet_coin() {
        let admin = @0xA;
        let user1 = @0xB;
        let mut scenario = ts::begin(admin);

        // init
        ts::next_tx(&mut scenario, admin);
        {
            faucet_coin::test_for_init(scenario.ctx());
        };

        // admin mint 100 coin
        ts::next_tx(&mut scenario, admin);
        {
            let mut treasurycap = ts::take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
            faucet_coin::mint(&mut treasurycap, 100, admin, scenario.ctx());
            ts::return_shared<TreasuryCap<FAUCET_COIN>>(treasurycap);
        };

        // query [admin] coin
        ts::next_tx(&mut scenario, admin);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            debug::print(&coin::value(&coin));
            ts::return_to_sender<Coin<FAUCET_COIN>>(&scenario, coin);
        };

        // user1 mint 200 coin。注意，这里和独享所有权不同，不会报错，可以mint！
        ts::next_tx(&mut scenario, user1);
        {
            let mut treasurycap = ts::take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
            faucet_coin::mint(&mut treasurycap, 200, user1, scenario.ctx());
            ts::return_shared<TreasuryCap<FAUCET_COIN>>(treasurycap);
        };

        // query [user1] coin
        ts::next_tx(&mut scenario, user1);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            debug::print(&coin::value(&coin));
            ts::return_to_sender<Coin<FAUCET_COIN>>(&scenario, coin);
        };

        // burn [admin] coin，共享所有权，可以分别对自己的coin操作！
        ts::next_tx(&mut scenario, admin);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            let mut treasurycap = ts::take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
            faucet_coin::burn(&mut treasurycap, coin);
            ts::return_shared<TreasuryCap<FAUCET_COIN>>(treasurycap);
        };

        // burn [user1] coin，共享所有权，可以分别对自己的coin操作！
        ts::next_tx(&mut scenario, user1);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            let mut treasurycap = ts::take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
            faucet_coin::burn(&mut treasurycap, coin);
            ts::return_shared<TreasuryCap<FAUCET_COIN>>(treasurycap);
        };

        ts::end(scenario);
        // pass
    }
}
