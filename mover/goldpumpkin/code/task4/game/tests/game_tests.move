#[test_only]
module game::game_tests {

    use sui::clock;
    use sui::coin;
    use sui::test_scenario;
    use sui::test_scenario::{
        begin,
        end,
        ctx as test_ctx,
    };
    use faucet_coin::faucetcoin::{FAUCETCOIN, test_init, mint};
    use sui::coin::{Coin, TreasuryCap};
    use game::game_counter::GameCounter;
    use game::game::{
        init_for_testing,
        HouseAdminCap,
        initialize_house_data,
        HouseData,
        place_bet_and_create_game,
        Game
    };

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_game() {
        let (host, player1) = (@0x1, @0x2);

        // create a test scenario with sender; initiates the first transaction
        let mut scenario = begin(host);

        // init: faucet coint & game
        {
            // init: faucet coint
            test_init(test_ctx(&mut scenario));
            // init: game
            init_for_testing(test_ctx(&mut scenario));
        };

        // host: mint 100000000
        test_scenario::next_tx(&mut scenario, host);
        {
            let mut treasury_cap = test_scenario::take_shared<TreasuryCap<FAUCETCOIN>>(&scenario);
            mint(&mut treasury_cap, 100000000, host, test_scenario::ctx(&mut scenario));
            test_scenario::return_shared(treasury_cap);
        };

        // 游戏初始化
        test_scenario::next_tx(&mut scenario, host);
        {
            let faucetcoin = test_scenario::take_from_address<Coin<FAUCETCOIN>>(&scenario, host);
            let mut house_adming_cap = test_scenario::take_from_address<HouseAdminCap>(&scenario, host);
            initialize_house_data(house_adming_cap, faucetcoin, test_scenario::ctx(&mut scenario))
        };

        let mut scenario2 = begin(player1);

        // player1: mint 50000
        test_scenario::next_tx(&mut scenario2, player1);
        {
            let mut treasury_cap = test_scenario::take_shared<TreasuryCap<FAUCETCOIN>>(&scenario2);
            mint(&mut treasury_cap, 50000, player1, test_scenario::ctx(&mut scenario2));
            test_scenario::return_shared(treasury_cap);
        };


        // 开始游戏
        test_scenario::next_tx(&mut scenario2, player1);
        {
            let mut game_counter = test_scenario::take_shared<GameCounter>(&scenario2);
            let mut house_data = test_scenario::take_shared<HouseData>(&scenario2);
            let mut player_coin = test_scenario::take_from_address<Coin<FAUCETCOIN>>(&scenario2, player1);
            let my_clock = clock::create_for_testing(test_scenario::ctx(&mut scenario2));

            // 下注金额
            let bet_coin = coin::split(&mut player_coin, 500, test_scenario::ctx(&mut scenario2));

            place_bet_and_create_game(&mut game_counter, &mut house_data, 250,
                bet_coin, &my_clock, test_scenario::ctx(&mut scenario2));

            test_scenario::return_shared(game_counter);
            test_scenario::return_shared(house_data);
            clock::destroy_for_testing(my_clock);
            test_scenario::return_to_address(player1, player_coin);
        };

        // 验证游戏结果
        test_scenario::next_tx(&mut scenario2, player1);
        {
            // 检查是否创建了 Game 对象
            assert!(test_scenario::has_most_recent_shared<Game>(), 0);

            // 检查玩家余额变化
            let mut player_coin = test_scenario::take_from_address<Coin<FAUCETCOIN>>(&scenario2, player1);
            let player_balance = coin::value(&player_coin);

            // 输了剩盈利 500，输了得500
            assert!(player_balance == 50500 || player_balance == 49500, 1);

            // 返回对象
            test_scenario::return_to_address(player1, player_coin);
        };

        end(scenario);
        end(scenario2);
    }
}
