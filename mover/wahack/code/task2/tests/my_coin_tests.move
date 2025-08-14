#[test_only]
module move_coin::my_coin_tests {
    use move_coin::my_coin;
    use sui::test_scenario;
    use sui::coin;

    #[test]
    fun test_init() {
        // Initialize a mock sender address
        let addr1 = @0xA;
        // Begins a multi-transaction scenario with addr1 as the sender
        let mut scenario = test_scenario::begin(addr1);
        my_coin::test_init(test_scenario::ctx(&mut scenario));
        test_scenario::end(scenario);
    }

   #[test]
    fun test_mint() {
       let deployer_address = @0xA;
       let mut scenario = test_scenario::begin(deployer_address);
       let dummy_address = @0xCAFE;

       my_coin::test_init(test_scenario::ctx(&mut scenario));

       test_scenario::next_tx(&mut scenario, deployer_address);

       let mut treasurycap = test_scenario::take_from_sender<coin::TreasuryCap<my_coin::MY_COIN>>(&scenario);
       my_coin::mint(&mut treasurycap, 100, deployer_address, test_scenario::ctx(&mut scenario));

       test_scenario::next_tx(&mut scenario, deployer_address);

       test_scenario::return_to_address<coin::TreasuryCap<my_coin::MY_COIN>>(deployer_address, treasurycap);
       let mut my_coin = test_scenario::take_from_address<coin::Coin<my_coin::MY_COIN>>(&scenario, deployer_address);

       assert!(coin::value(&my_coin) == 100, 0);
       transfer::public_transfer(my_coin, dummy_address);
       test_scenario::end(scenario);
   }

    #[test, expected_failure]
    fun test_mint_fail() {
        let deployer_address = @0xA;
        let other_address: address = @0xB;
        let mut scenario = test_scenario::begin(deployer_address);
        let dummy_address = @0xCAFE;

        my_coin::test_init(test_scenario::ctx(&mut scenario));

        test_scenario::next_tx(&mut scenario, deployer_address);
        test_scenario::end(scenario);

        let mut scenario = test_scenario::begin(other_address);

        let mut treasurycap = test_scenario::take_from_sender<coin::TreasuryCap<my_coin::MY_COIN>>(&scenario);
        my_coin::mint(&mut treasurycap, 100, other_address, test_scenario::ctx(&mut scenario));
        test_scenario::next_tx(&mut scenario, other_address);
        transfer::public_transfer(treasurycap, dummy_address);
        test_scenario::end(scenario);
    }

    fun test_burn () {
        let deployer_address = @0xA;
        let mut scenario = test_scenario::begin(deployer_address);
        let dummy_address = @0xCAFE;

        my_coin::test_init(test_scenario::ctx(&mut scenario));

        test_scenario::next_tx(&mut scenario, deployer_address);

        let mut treasurycap = test_scenario::take_from_sender<coin::TreasuryCap<my_coin::MY_COIN>>(&scenario);
        my_coin::mint(&mut treasurycap, 100, deployer_address, test_scenario::ctx(&mut scenario));

        test_scenario::next_tx(&mut scenario, deployer_address);

        // test_scenario::return_to_address<coin::TreasuryCap<my_coin::MY_COIN>>(deployer_address, &treasurycap);
        let mut my_coin = test_scenario::take_from_address<coin::Coin<my_coin::MY_COIN>>(&scenario, deployer_address);

        assert!(coin::value(&my_coin) == 100, 0);


        my_coin::burn(&mut treasurycap, my_coin);

        test_scenario::next_tx(&mut scenario, deployer_address);

        let mut my_coin = test_scenario::take_from_address<coin::Coin<my_coin::MY_COIN>>(&scenario, deployer_address);
        assert!(coin::value(&my_coin) == 0, 0);


        transfer::public_transfer(my_coin, dummy_address);
        transfer::public_transfer(treasurycap, dummy_address);
        test_scenario::end(scenario);
    }

}