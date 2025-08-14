#[test_only]
module move_game::move_game_tests {
    // uncomment this line to import the module
    use move_game::kyrincode_game::{Self, Game};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::clock;
    use sui::test_scenario::{Self, next_tx, ctx};
    // use std::debug::print;
    use kyrincode_faucet_coin::kyrincode_faucet_coin::{Self, KYRINCODE_FAUCET_COIN};

    const EGetFaucet: u64 = 0;
    const EDeposit: u64 = 1;

    #[test]
    fun test_move_game() {
        let addr1 = @0xA;
        let addr2 = @0xB;

        let mut scenario = test_scenario::begin(addr1);
        {
            let ctx = ctx(&mut scenario);
            kyrincode_faucet_coin::test_init(ctx);
            kyrincode_game::test_init(ctx);
        };

        next_tx(&mut scenario, addr1);
        {
            let mut treasury_cap = scenario.take_shared<TreasuryCap<KYRINCODE_FAUCET_COIN>>();
            kyrincode_game::get_faucet_coin(&mut treasury_cap, 1_000_000_000, ctx(&mut scenario));

            test_scenario::return_shared(treasury_cap);
        };

        next_tx(&mut scenario, addr1);
        {
            let mut game = scenario.take_shared<Game>();
            let input = scenario.take_from_sender<Coin<KYRINCODE_FAUCET_COIN>>();
            assert!(coin::value(&input) == 1_000_000_000, EGetFaucet);

            kyrincode_game::deposit(&mut game, input, 1_000_000_000, ctx(&mut scenario));

            let pool_amount = kyrincode_game::game_pool(&game);
            assert!(pool_amount == 1_000_000_000, EDeposit);

            test_scenario::return_shared(game);
        };

        next_tx(&mut scenario, addr2);
        {
            let mut treasury_cap = scenario.take_shared<TreasuryCap<KYRINCODE_FAUCET_COIN>>();
            kyrincode_game::get_faucet_coin(&mut treasury_cap, 300_000_000, ctx(&mut scenario));

            test_scenario::return_shared(treasury_cap);
        };

        next_tx(&mut scenario, addr2);
        {
            let mut game = scenario.take_shared<Game>();
            let input = scenario.take_from_sender<Coin<KYRINCODE_FAUCET_COIN>>();
            let ctx = ctx(&mut scenario);
            let mut clock = clock::create_for_testing(ctx);
            clock::set_for_testing(&mut clock, 100);
            kyrincode_game::play(0, &mut game, input, &clock, ctx);

            test_scenario::return_shared(game);
            clock::destroy_for_testing(clock);
        };

        scenario.end();
    }
}
