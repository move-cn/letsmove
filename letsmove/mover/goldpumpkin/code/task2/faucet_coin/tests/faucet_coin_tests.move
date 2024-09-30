#[test_only]
module faucet_coin::faucet_coin_tests {

    use sui::coin;
    use sui::coin::{TreasuryCap, Coin};
    use sui::test_scenario;
    use sui::test_scenario::{begin, end};
    use faucet_coin::faucetcoin::{test_init, FAUCETCOIN, mint};

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_faucet_coin() {
        let (bernard, manny) = (@0x1, @0x2);

        // create a test scenario with sender; initiates the first transaction
        let mut scenario = begin(bernard);

        // faucet coin init
        {
            test_init(test_scenario::ctx(&mut scenario));
        };

        // Mint 操作
        test_scenario::next_tx(&mut scenario, bernard);
        {
            let mut treasury_cap = test_scenario::take_shared<TreasuryCap<FAUCETCOIN>>(&scenario);
            mint(&mut treasury_cap, 100000000, bernard, test_scenario::ctx(&mut scenario));
            test_scenario::return_shared(treasury_cap);
        };

        // 验证 mint 是否成功，以及数量是否正确
        test_scenario::next_tx(&mut scenario, bernard);
        {
            let coin = test_scenario::take_from_address<Coin<FAUCETCOIN>>(&scenario, bernard);
            assert!(coin::value(&coin) == 100000000, 1);
            test_scenario::return_to_address(bernard, coin);
        };


        // address2 mint
        let mut scenario2 = begin(manny);
        test_scenario::next_tx(&mut scenario2, manny);
        {
            let mut treasury_cap = test_scenario::take_shared<TreasuryCap<FAUCETCOIN>>(&scenario2);
            mint(&mut treasury_cap, 1, manny, test_scenario::ctx(&mut scenario2));
            test_scenario::return_shared(treasury_cap);
        };
        test_scenario::next_tx(&mut scenario2, manny);
        {
            let coin = test_scenario::take_from_address<Coin<FAUCETCOIN>>(&scenario2, manny);
            assert!(coin::value(&coin) == 1, 2);
            test_scenario::return_to_address(manny, coin);
        };

        end(scenario);
        end(scenario2);
    }

    #[test, expected_failure(abort_code = faucet_coin::faucet_coin_tests::ENotImplemented)]
    fun test_faucet_coin_fail() {
        abort ENotImplemented
    }
}