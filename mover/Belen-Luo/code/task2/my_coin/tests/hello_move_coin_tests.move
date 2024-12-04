#[test_only]
module hello_move_coin::BelenLuoCoinTest {
    use hello_move_coin::BelenLuoCoin::{Self, BELENLUOCOIN};
    use sui::test_scenario::{Self, next_tx, ctx};
    use sui::coin::{TreasuryCap};
    use std::debug::print;
    use std::string::utf8;

    #[test]
    fun testMyCoin() {
      print(&utf8(b"Start Test Init"));

      let address = @0x0;
      
      let mut scenario = test_scenario::begin(address);
      BelenLuoCoin::test_init(ctx(&mut scenario));

      print(&utf8(b"Mint Coin"));

      next_tx(&mut scenario, address);

      let mut treasurycap = test_scenario::take_from_sender<TreasuryCap<BELENLUOCOIN>>(&scenario);
      BelenLuoCoin::mint(&mut treasurycap, 100, address, test_scenario::ctx(&mut scenario));
      test_scenario::return_to_address<TreasuryCap<BELENLUOCOIN>>(address, treasurycap);

      test_scenario::end(scenario);

      print(&utf8(b"End Test"));
    }
}
