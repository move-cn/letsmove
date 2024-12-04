// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

#[test_only]
module martinyeung5::test_counter_nft {
    use sui::test_scenario;

    use martinyeung5::counter_nft::{Self, Counter};

    // Faucet Coin
    use fungible_tokens::faucetucoin::{Self, FAUCETUCOIN};

    // Test addresses.
    const USER: address = @0xCAFE;
    const NEW_USER: address = @0xDECAF;

    // Test errors.
    const EInvalidCountOnNewCounter: u64 = 1;
    const EInvalidCountOnIncreasedCounter: u64 = 2;

    #[test]
    fun creates_counter_nft() {
        let mut scenario = test_scenario::begin(USER);

        // Mint a counter NFT for USER.
        {
            let ctx = scenario.ctx();
            let counter = counter_nft::mint(ctx);
            counter.transfer_to_sender(ctx);
        };

        // Check that the initial count value is 0.
        scenario.next_tx(USER);
        {
            let counter_nft = scenario.take_from_sender<Counter>();
            assert!(counter_nft.count() == 0, EInvalidCountOnNewCounter);
            scenario.return_to_sender(counter_nft);
        };

        scenario.end();
    }

    #[test]
    fun increments_counter_nft() {
        let mut scenario = test_scenario::begin(USER);

        // Mint a counter NFT for USER.
        {
            let ctx = scenario.ctx();
            let counter = counter_nft::mint(ctx);
            counter.transfer_to_sender(ctx);
        };

        // Increment it & check its value has increased.
        scenario.next_tx(USER);
        {
            let mut counter_nft = scenario.take_from_sender<Counter>();
            counter_nft.get_vrf_input_and_increment();
            assert!(counter_nft.count() == 1, EInvalidCountOnIncreasedCounter);
            scenario.return_to_sender(counter_nft);
        };

        scenario.end();
    }

    #[test]
    fun burns_counter_nft() {
        let mut scenario = test_scenario::begin(USER);

       // Mint a counter NFT for USER.
        {
            let ctx = scenario.ctx();
            let counter = counter_nft::mint(ctx);
            counter.transfer_to_sender(ctx);
        };

        // Burn the NFT.
        scenario.next_tx(USER);
        {
            let counter_nft = scenario.take_from_sender<Counter>();
            counter_nft.burn_for_testing();
        };

        scenario.end();
    }

}
