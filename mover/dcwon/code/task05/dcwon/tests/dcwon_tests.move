#[test_only]
module dcwon::dcwon_tests {
    // uncomment this line to import the module
    use sui::test_scenario as ts;
    use sui::test_scenario::Scenario;
    use sui::coin::{Self, Coin, TreasuryCap};
    use dcwon::dcwon;
    use mycoin::mycoin::{Self, MYCOIN};
    use faucetcoin::faucetcoin::{Self, FAUCETCOIN};

    const ENotExpect: u64 = 0;
    // const EInvalidVal: u64 = 1;

    const Address1:address = @0x0A;

    fun init_modules(scenario: &mut Scenario) {
        dcwon::init_for_testing(scenario.ctx());
        mycoin::init_for_testing(scenario.ctx());
        faucetcoin::init_for_testing(scenario.ctx());
    }

    fun min_mycoin(scenario: &mut Scenario, amt: u64) {
        scenario.next_tx(Address1);
        {
            let mut cap = scenario.take_from_sender<TreasuryCap<MYCOIN>>();
            mycoin::mint(&mut cap, amt, Address1, scenario.ctx());
            scenario.return_to_sender(cap);
        }
    }

    fun min_faucetcoin(scenario: &mut Scenario, amt: u64) {
        scenario.next_tx(Address1);
        {
            let mut cap = scenario.take_shared<TreasuryCap<FAUCETCOIN>>();
            faucetcoin::mint(&mut cap, amt, Address1, scenario.ctx());
            ts::return_shared(cap);
        }
    }


    #[test]
    fun test_dcwon_basic() {
        let mut scenario = ts::begin(Address1);
        init_modules(&mut scenario);

        scenario.next_tx(Address1);
        let mut bank = scenario.take_shared<dcwon::Bank>();

        min_mycoin(&mut scenario, 1_000_000);

        scenario.next_tx(Address1);
        {
            let mycoin = scenario.take_from_sender<Coin<MYCOIN>>();
            dcwon::deposit_mycoin(&mut bank, mycoin, scenario.ctx());
        };

        min_faucetcoin(&mut scenario, 1_000_000);

        scenario.next_tx(Address1);
        {
            let faucetcoin = scenario.take_from_sender<Coin<FAUCETCOIN>>();
            dcwon::deposit_faucetcoin(&mut bank, faucetcoin, scenario.ctx());
        };

        // test swap faucetcoin
        min_mycoin(&mut scenario, 10);
        scenario.next_tx(Address1);
        {
            let mc_to_swap = scenario.take_from_sender<Coin<MYCOIN>>();
            dcwon::swap_faucetcoin(&mut bank, mc_to_swap, scenario.ctx());
            // swap_faucetcoin会给sender发送交换后的faucetcoin，但是要这次交易介绍后才能看到
            scenario.next_tx(Address1);
            {
                let fc_after_swap = scenario.take_from_sender<Coin<FAUCETCOIN>>();
                assert!(fc_after_swap.value() == 73, ENotExpect);
                scenario.return_to_sender(fc_after_swap);
            }
        };    

        // test swap mycoin
        scenario.next_tx(Address1);
        {
            let fc_to_swap = scenario.take_from_sender<Coin<FAUCETCOIN>>();
            dcwon::swap_mycoin(&mut bank, fc_to_swap, scenario.ctx());
            // swap_mycoin会给sender发送交换后的mycoin，但是要这次交易介绍后才能看到
            scenario.next_tx(Address1);
            {
                let mc_after_swap = scenario.take_from_sender<Coin<MYCOIN>>();
                assert!(mc_after_swap.value() == 10, ENotExpect);
                scenario.return_to_sender(mc_after_swap);
            }
        };

        ts::return_shared(bank);
        ts::end(scenario);
    }
}
