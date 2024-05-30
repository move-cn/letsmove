#[test_only]
#[allow(duplicate_alias, unused_use)]
module blue_game::blue_game_tests {
    // uncomment this line to import the module
    use std::debug;
    use sui::clock::{Self, Clock};
    use sui::tx_context;
    use blue_game::blue_game;
    use sui::coin::{Self, Coin};
    use faucetcoin::faucet_coin::FAUCET_COIN;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_blue_game() {
        let mut ctx = tx_context::dummy();
        let clock = clock::create_for_testing(&mut ctx);
        // blue_game::play(1, &clock);
        clock.destroy_for_testing();

        // let coin = coin::mint_for_testing(100, &mut ctx);
        // pass
    }

    #[test, expected_failure(abort_code = ::blue_game::blue_game_tests::ENotImplemented)]
    fun test_blue_game_fail() {
        abort ENotImplemented
    }
}

