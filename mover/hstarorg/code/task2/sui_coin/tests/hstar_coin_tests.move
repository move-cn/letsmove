#[test_only]
module hstar::hstar_coin_tests {
  use sui::coin::{TreasuryCap, Coin};
  use hstar::hstar_coin::{Self, HSTAR_COIN};
  use sui::test_scenario::{Self};
  
  const ENotImplemented: u64 = 0;
  
  #[test]
  fun test_hstar_coin() {
    let sender = @0x1;
    let mut scenario = test_scenario::begin(sender);
    {
      hstar_coin::test_init(test_scenario::ctx(&mut scenario));
    };
    
    
    test_scenario::next_tx(&mut scenario, sender);
    {
      let mut cap = test_scenario::take_from_sender<TreasuryCap<HSTAR_COIN>>(&scenario);
      
      hstar_coin::mint(&mut cap, 1, sender, test_scenario::ctx(&mut scenario));
      
      test_scenario::return_to_address<TreasuryCap<HSTAR_COIN>>(sender, cap);
    };
    
    test_scenario::next_tx(&mut scenario, sender);
    {
      let mut cap = test_scenario::take_from_sender<TreasuryCap<HSTAR_COIN>>(&scenario);
      let coin = test_scenario::take_from_sender<Coin<HSTAR_COIN>>(&scenario);
      
      hstar_coin::burn(&mut cap, coin);
      
      test_scenario::return_to_address<TreasuryCap<HSTAR_COIN>>(sender, cap);
    };
    
    test_scenario::end(scenario);
  }
  
  #[test, expected_failure(abort_code = hstar::hstar_coin_tests::ENotImplemented)]
  fun test_hstar_coin_fail() {
    abort ENotImplemented
  }
}

