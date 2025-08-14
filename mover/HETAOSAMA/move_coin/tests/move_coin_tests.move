#[test_only]
module move_coin::move_coin_tests {
    // uncomment this line to import the module
    use sui::test_scenario;
    use sui::coin::{TreasuryCap};
    use move_coin::move_coin::{MOVE_COIN};
    use move_coin::move_coin::test_init;
    use move_coin::move_coin::mint;
    use move_coin::faucet_coin::test_faucet_init;
    use move_coin::faucet_coin::{Self,FAUCET_COIN};
    
    #[test]
    fun test_my_coin() {
        
        let initial_owner = @0xCAFE;
        let mut scenario = test_scenario::begin(initial_owner);
        {

            test_init(scenario.ctx());
        };
        scenario.next_tx(initial_owner);
        {
            let mut treasurycap = test_scenario::take_from_sender<TreasuryCap<MOVE_COIN>>(&scenario);
            mint(&mut treasurycap, 100, test_scenario::ctx(&mut scenario));
            test_scenario::return_to_address<TreasuryCap<MOVE_COIN>>(initial_owner, treasurycap);
        };

        scenario.end();
        
    }

    #[test]
    fun test_faucet_coin() {
        let initial_owner = @0xCAFE;
        let recipient = @0xCAFEBABE;
        let mut scenario = test_scenario::begin(initial_owner);
        {
            test_faucet_init(scenario.ctx());
        };
        scenario.next_tx(initial_owner);
        {
            let mut treasurycap = test_scenario::take_from_sender<TreasuryCap<FAUCET_COIN>>(&scenario);
            
            faucet_coin::mint(&mut treasurycap, 100,recipient, test_scenario::ctx(&mut scenario));
            test_scenario::return_to_address<TreasuryCap<FAUCET_COIN>>(initial_owner, treasurycap);
        };
        scenario.end();
    }
}
