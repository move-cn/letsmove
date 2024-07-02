#[test_only]
module move_coin::faucet_coin_tests {
    use move_coin::faucet_coin;
    use sui::test_scenario;
    use sui::coin;

    #[test]
    fun test_init() {
        // Initialize a mock sender address
        let addr1 = @0xA;
        // Begins a multi-transaction scenario with addr1 as the sender
        let mut scenario = test_scenario::begin(addr1);
        faucet_coin::test_init(test_scenario::ctx(&mut scenario));
        test_scenario::end(scenario);
    }

    #[test]
    fun test_mint() {
        let deployer_address = @0xA;
        let other_address: address = @0xB;

        let mut scenario = test_scenario::begin(deployer_address);
        let dummy_address = @0xCAFE;

        faucet_coin::test_init(test_scenario::ctx(&mut scenario));

        test_scenario::next_tx(&mut scenario, deployer_address);

        test_scenario::end(scenario);

        let mut scenario = test_scenario::begin(other_address);

        let mut treasurycap = test_scenario::take_shared<coin::TreasuryCap<faucet_coin::FAUCET_COIN>>(&mut scenario);
        faucet_coin::mint(&mut treasurycap, 100, other_address, test_scenario::ctx(&mut scenario));

        test_scenario::next_tx(&mut scenario, other_address);

        let mut faucet_coin = test_scenario::take_from_address<coin::Coin<faucet_coin::FAUCET_COIN>>(&scenario, other_address);

        assert!(coin::value(&faucet_coin) == 100, 0);
        transfer::public_transfer(faucet_coin, dummy_address);
        transfer::public_transfer(treasurycap, dummy_address);
        test_scenario::end(scenario);
    }

}