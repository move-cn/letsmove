#[test_only]
module guess_number::guess_number_tests {
    // uncomment this line to import the module
    use guess_number::guess_number::{Self, PrizePool, PrizePoolCap};
    use sui::coin::{Coin, TreasuryCap};
    use faucetcoin::faucetcoin::{Self, FAUCETCOIN};
    use sui::test_scenario as ts;
    use sui::test_scenario::Scenario;
    use std::debug::print;
    use std::string::utf8;

    const ENotImplemented: u64 = 0;
    const ENotExpectValue: u64 = 1;

    const Address1:address = @0x0A;
    const Address2:address = @0x0B;

    fun init_modules(scenario:&mut  Scenario) {
        guess_number::init_for_testing(scenario.ctx());
        faucetcoin::init_for_testing(scenario.ctx());
    }

    fun init_pool(scenario:&mut  Scenario, sender: address, prize: u64) {
        scenario.next_tx(sender);
        {
            let mut coin_cap = scenario.take_shared<TreasuryCap<FAUCETCOIN>>();
            faucetcoin::mint(&mut coin_cap, prize, sender, scenario.ctx());
            ts::return_shared(coin_cap);
        };

        scenario.next_tx(sender);
        {
            let pool_cap = scenario.take_from_sender<PrizePoolCap>();
            let coin = scenario.take_from_sender<Coin<FAUCETCOIN>>();
            guess_number::initialize_pool(pool_cap, coin, scenario.ctx());
        };
    }

    fun init_gamer(scenario:&mut  Scenario, gamer: address, balance: u64) {
        scenario.next_tx(gamer);
        {
            let mut coin_cap = scenario.take_shared<TreasuryCap<FAUCETCOIN>>();
            faucetcoin::mint(&mut coin_cap, balance, gamer, scenario.ctx());
            ts::return_shared(coin_cap);
        }
    }

    fun start_game(scenario:&mut  Scenario, gamer: address, stake: u64, number: u8):bool {
        let ret: bool;
        print(&utf8(b"start_game enter!"));
        scenario.next_tx(gamer);
        {
            let mut pool = scenario.take_shared<PrizePool>();
            let mut coin = scenario.take_from_sender<Coin<FAUCETCOIN>>();
            let stake = coin.split(stake, scenario.ctx());
            scenario.return_to_sender(coin);
            ret = guess_number::start_game(&mut pool, number, stake, scenario.ctx());
            ts::return_shared(pool);
        };
        print(&utf8(b"start_game exit, result:"));
        print(&ret);
        ret
    }

    fun assert_last_coin_balance(scenario:&mut  Scenario, account: address, target: u64) {
        scenario.next_tx(account);
        {
            let coin = scenario.take_from_sender<Coin<FAUCETCOIN>>();
            let coin_val = coin.value();
            assert!(coin_val == target, ENotExpectValue);
            scenario.return_to_sender(coin);
        }
    }

    #[test]
    // 基本猜数功能测试
    fun test_guess_number() {
        let mut scenario = ts::begin(Address1);
        
        init_modules(&mut scenario);

        init_pool(&mut scenario, Address1, 1_000_000);

        // 玩家A开始参与游戏
        init_gamer(&mut scenario, Address1, 2_000);

        let res1 = start_game(&mut scenario, Address1, 100, 1);

        // 检查游戏是否获胜
        assert!(res1, 0);   

        // 检查游戏获胜后，是否有拿到Coin
        assert_last_coin_balance(&mut scenario, Address1, 200);  // assert coin after win

        // 玩家B开始参与游戏
        init_gamer(&mut scenario, Address2, 2_000);

        let res2 = start_game(&mut scenario, Address2, 100, 0);

        // 检查游戏是否输了
        assert!(!res2, 0);

        ts::end(scenario);
    }

    #[test]
    // 基本存钱取钱功能测试
    fun test_put_and_get_prize() {
        let mut scenario = ts::begin(Address1);
        
        init_modules(&mut scenario);

        init_pool(&mut scenario, Address1, 2_000);

        // 初始化基本金额，用于补充奖金池
        init_gamer(&mut scenario, Address1, 2_000);

        // 获取奖金池
        let mut pool = scenario.take_shared<PrizePool>();

        scenario.next_tx(Address1);
        {
            // 存钱
            let mut coin = scenario.take_from_sender<Coin<FAUCETCOIN>>();
            let coin_to_put = coin.split(1_000, scenario.ctx()); // 存入1_000
            guess_number::top_up(&mut pool, coin_to_put);
            assert!(guess_number::query_prize(&mut pool) == 3_000, ENotExpectValue);  // 检查1_000是否有充值成功 2000 + 1000

            guess_number::withdraw(&mut pool, 500, scenario.ctx());   // 取500

            assert_last_coin_balance(&mut scenario, Address1, 500);  // 检查500是否取出成功

            guess_number::withdraw_all(&mut pool, scenario.ctx());   // 取出剩余2000 + 1000 - 500

            assert_last_coin_balance(&mut scenario, Address1, 2500);  // 检查2500是否取出成功
            
            scenario.return_to_sender(coin);
            ts::return_shared(pool);
        };
        
        ts::end(scenario);
    }

    #[test, expected_failure(abort_code = ::guess_number::guess_number::EInvalidStake)]
    // 下注太小测试
    fun test_guess_number_too_small() {
        let mut scenario = ts::begin(Address1);

        init_modules(&mut scenario);

        init_pool(&mut scenario, Address1, 1_000_000);

        init_gamer(&mut scenario, Address1, 2_000);

        let res1 = start_game(&mut scenario, Address1, 1, 1);

        ts::end(scenario);
    }

    #[test, expected_failure(abort_code = ::guess_number::guess_number::EInvalidStake)]
    // 下注太大测试
    fun test_guess_number_too_big() {
        let mut scenario = ts::begin(Address1);

        init_modules(&mut scenario);

        init_pool(&mut scenario, Address1, 1_000_000);

        init_gamer(&mut scenario, Address1, 2_000);

        let res1 = start_game(&mut scenario, Address1, 1_001, 1);

        ts::end(scenario);
    }
}
