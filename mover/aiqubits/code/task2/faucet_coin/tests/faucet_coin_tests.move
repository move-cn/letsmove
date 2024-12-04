#[test_only]
module faucet_coin::my_coin_tests {
    use faucet_coin::aiqubit_faucet::{Self, AIQUBIT_FAUCET};
    use sui::coin::{Coin, TreasuryCap};
    use sui::test_scenario::{Self, next_tx, ctx};
    use sui::object;
    use sui::balance::{Self, Balance};

    #[test]
    fun mint_burn() {
        // Initialize a mock sender address
        let addr1 = @0xA;
        let addr2 = @0xB;

        // Begins a multi transaction scenario with addr1 as the sender
        let mut scenario = test_scenario::begin(addr1);
        
        // Run the coin module init function
        {
            aiqubit_faucet::test_init(ctx(&mut scenario))
        };

        // Mint a `Coin<MY_COIN>` object
        next_tx(&mut scenario, addr1);
        {
            let mut treasury_cap = test_scenario::take_from_sender<TreasuryCap<AIQUBIT_FAUCET>>(&scenario);

            aiqubit_faucet::mint(&mut treasury_cap, 100, addr1, test_scenario::ctx(&mut scenario));
            
            test_scenario::return_to_address<TreasuryCap<AIQUBIT_FAUCET>>(addr2, treasury_cap);
        };

        // Burn a `Coin<MY_COIN>` object
        next_tx(&mut scenario, addr1);
        {
            let coin = test_scenario::take_from_sender<Coin<AIQUBIT_FAUCET>>(&scenario);
            let mut treasury_cap = test_scenario::take_from_sender<TreasuryCap<AIQUBIT_FAUCET>>(&scenario);
            aiqubit_faucet::burn(&mut treasury_cap, coin);
            test_scenario::return_to_address<TreasuryCap<AIQUBIT_FAUCET>>(addr1, treasury_cap);
        };

        // Cleans up the scenario object
        test_scenario::end(scenario);
    }
}