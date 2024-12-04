#[test_only]
module t4::t4_tests {
    use sui::clock::Self;
    use sui::coin::{Coin, TreasuryCap};
    use sui::test_scenario::{begin, end, ctx, next_tx, take_shared, return_shared, take_from_sender, return_to_address};
    use t2::faucet_coin::{FAUCET_COIN, test_init, mint};
    use t4::game::{play, deposit, Game, withdraw, AdminCap, create_game};

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_t4() {
        let addr = @0xA;

        let mut scenario = begin(addr);

        //铸测试币
        {
            test_init(ctx(&mut scenario));
        };
        next_tx(&mut scenario, addr);
        {

            let mut treasury_cap = take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
            mint(&mut treasury_cap, 100000000, addr, ctx(&mut scenario));
            return_shared(treasury_cap);
        };

        //创建游戏
        next_tx(&mut scenario, addr);
        {
            create_game<FAUCET_COIN>(ctx(&mut scenario));
        };

        //存款
        next_tx(&mut scenario, addr);
        {
            let mut game = take_shared<Game<FAUCET_COIN>>(&scenario);
            let faucet_coin = take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            deposit<FAUCET_COIN>(&mut game, faucet_coin, 10000, ctx(&mut scenario));
            // return_to_address(addr, faucet_coin) ;
            return_shared(game);
        };
        //玩游戏
        next_tx(&mut scenario, addr);
        {
            let mut game = take_shared<Game<FAUCET_COIN>>(&scenario);
            let my_clock = clock::create_for_testing(ctx(&mut scenario));
            let faucet_coin = take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            play(0, &mut game, faucet_coin, &my_clock, ctx(&mut scenario));
            clock::destroy_for_testing(my_clock);
            // return_to_address(addr, faucet_coin) ;
            return_shared(game);
        };

        //提款
        next_tx(&mut scenario, addr);
        {
            let admin_cap = take_from_sender<AdminCap>(&scenario);
            let mut game = take_shared<Game<FAUCET_COIN>>(&scenario);
            withdraw(&admin_cap, &mut game, 10000, ctx(&mut scenario));
            return_shared(game);
            return_to_address(addr, admin_cap);
        };
        end(scenario);
    }

    #[test, expected_failure(abort_code = ENotImplemented)]
    fun test_t4_fail() {
        abort ENotImplemented
    }
}
