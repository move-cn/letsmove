#[test_only]
module two_coins::siphonelee_coin_tests {
    use two_coins::siphonelee_coin::{Self, SIPHONELEE_COIN};
    use sui::test_scenario;
    use sui::test_scenario::{next_tx, ctx};
    use sui::coin::{Coin, TreasuryCap};

    const ENotImplemented: u64 = 0;
    const EWrongBalance: u64 = 1;

    #[test]
    fun test_siphonelee_coin() {
        let addr1 = @0xA;
        let mut scenario = test_scenario::begin(addr1);
        let dummy_address = @0xCAFE;

        {  
            siphonelee_coin::test_init(scenario.ctx());
        };

        next_tx(&mut scenario, addr1);
        {
            let coin = test_scenario::take_from_sender<Coin<SIPHONELEE_COIN>>(&scenario);
            assert!(&coin.balance().value() == 1000000000000, EWrongBalance);
            transfer::public_transfer(coin, dummy_address);
        };

        next_tx(&mut scenario, addr1);
        {
            let mut treasury_cap = test_scenario::take_from_sender<TreasuryCap<SIPHONELEE_COIN>>(&scenario);
            siphonelee_coin::mint(&mut treasury_cap, 100, addr1, scenario.ctx());
            test_scenario::return_to_address<TreasuryCap<SIPHONELEE_COIN>>(addr1, treasury_cap);
        };

        next_tx(&mut scenario, addr1);
        {
            let coin = test_scenario::take_from_sender<Coin<SIPHONELEE_COIN>>(&scenario);
            let mut treasury_cap = test_scenario::take_from_sender<TreasuryCap<SIPHONELEE_COIN>>(&scenario);
            siphonelee_coin::burn(&mut treasury_cap, coin);
            test_scenario::return_to_address<TreasuryCap<SIPHONELEE_COIN>>(addr1, treasury_cap);
        };

        test_scenario::end(scenario);
    }

    #[test, expected_failure(abort_code = two_coins::siphonelee_coin_tests::ENotImplemented)]
    fun test_siphonelee_coin_fail() {
        abort ENotImplemented
    }
}

