#[test_only]
module cnel_swap::coin_a_tests {
    use cnel_swap::coin_a::{Self, COIN_A};
    use sui::coin::{Coin, TreasuryCap};
    use sui::test_scenario::{Self, next_tx, ctx};

    #[test]
    fun mint_burn() {
        // Initialize a mock sender address
        let addr1 = @0xA;

        // Begins a multi transaction scenario with addr1 as the sender
        let scenario = test_scenario::begin(addr1);

        // Run the coin module init function
        {
            coin_a::test_init(ctx(&mut scenario))
        };

        // Mint a `Coin<COIN_A>` object
        next_tx(&mut scenario, addr1);
        {
            let treasurycap = test_scenario::take_from_sender<TreasuryCap<COIN_A>>(&scenario);
            coin_a::mint(&mut treasurycap, 100, addr1, test_scenario::ctx(&mut scenario));
            test_scenario::return_to_address<TreasuryCap<COIN_A>>(addr1, treasurycap);
        };

        // Burn a `Coin<COIN_A>` object
        next_tx(&mut scenario, addr1);
        {
            let coin = test_scenario::take_from_sender<Coin<COIN_A>>(&scenario);
            let treasurycap = test_scenario::take_from_sender<TreasuryCap<COIN_A>>(&scenario);
            coin_a::burn(&mut treasurycap, coin);
            test_scenario::return_to_address<TreasuryCap<COIN_A>>(addr1, treasurycap);
        };

        // Cleans up the scenario object
        test_scenario::end(scenario);
    }
}