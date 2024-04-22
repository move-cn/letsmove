#[test_only]
module two_coins::siphonelee_faucet_tests {
    use two_coins::siphonelee_faucet::{Self, SIPHONELEE_FAUCET, Faucet};
    use sui::test_scenario;
    use sui::test_scenario::{next_tx, ctx};

    const ENotImplemented: u64 = 0;
    const EWrongBalance: u64 = 1;

    #[test]
    fun test_siphonelee_faucet() {
        let addr1 = @0xA;
        let mut scenario = test_scenario::begin(addr1);
        let dummy_address = @0xCAFE;

        {  
            siphonelee_faucet::test_init(scenario.ctx());
        };

        // can't find way to get faucet in UT code, abort other scenarios

        test_scenario::end(scenario);
    }

    #[test, expected_failure(abort_code = two_coins::siphonelee_faucet_tests::ENotImplemented)]
    fun test_siphonelee_faucet_fail() {
        abort ENotImplemented
    }

}

