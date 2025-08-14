#[test_only]
module my_coin::my_coin_tests {
    use my_coin::aiqubit_coin::{Self, AIQUBIT_COIN};
    use sui::coin::{Coin, TreasuryCap};
    use sui::test_scenario::{Self, next_tx, ctx};

    #[test]
    fun mint_burn() {
        // Initialize a mock sender address
        let addr1 = @0xA;

        // Begins a multi transaction scenario with addr1 as the sender
        let mut scenario = test_scenario::begin(addr1);

        // Run the coin module init function
        {
            aiqubit_coin::test_init(ctx(&mut scenario))
        };

        // Mint a `Coin<MY_COIN>` object
        next_tx(&mut scenario, addr1);
        {
            let mut treasury_cap = test_scenario::take_from_sender<TreasuryCap<AIQUBIT_COIN>>(&scenario);
            aiqubit_coin::mint(&mut treasury_cap, 100, addr1, test_scenario::ctx(&mut scenario));
            test_scenario::return_to_address<TreasuryCap<AIQUBIT_COIN>>(addr1, treasury_cap);
        };

        // Burn a `Coin<MY_COIN>` object
        next_tx(&mut scenario, addr1);
        {
            let coin = test_scenario::take_from_sender<Coin<AIQUBIT_COIN>>(&scenario);
            let mut treasury_cap = test_scenario::take_from_sender<TreasuryCap<AIQUBIT_COIN>>(&scenario);
            aiqubit_coin::burn(&mut treasury_cap, coin);
            test_scenario::return_to_address<TreasuryCap<AIQUBIT_COIN>>(addr1, treasury_cap);
        };

        // Cleans up the scenario object
        test_scenario::end(scenario);
    }
}