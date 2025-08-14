#[test_only]
module new_coin::joker_coin_tests {
    use new_coin::joker_coin::{Self, JOKER_COIN};
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
            joker_coin::test_init(ctx(&mut scenario))
        };

        // Mint a `Coin<JOKER_COIN>` object
        next_tx(&mut scenario, addr1);
        {
            let treasurycap = test_scenario::take_from_sender<TreasuryCap<JOKER_COIN>>(&scenario);
            joker_coin::mint(&mut treasurycap, 100, addr1, test_scenario::ctx(&mut scenario));
            test_scenario::return_to_address<TreasuryCap<JOKER_COIN>>(addr1, treasurycap);
        };

        // Burn a `Coin<JOKER_COIN>` object
        next_tx(&mut scenario, addr1);
        {
            let coin = test_scenario::take_from_sender<Coin<JOKER_COIN>>(&scenario);
            let treasurycap = test_scenario::take_from_sender<TreasuryCap<JOKER_COIN>>(&scenario);
            joker_coin::burn(&mut treasurycap, coin);
            test_scenario::return_to_address<TreasuryCap<JOKER_COIN>>(addr1, treasurycap);
        };

        // Cleans up the scenario object
        test_scenario::end(scenario);
    }
}
