#[test_only]
module game::game_tests ;
    use sui::tx_context::{Self, TxContext};
    use sui::test_scenario::{Self as test, Scenario, next_tx};
    use sui::coin::{Self, Coin};
    use sui::sui::SUI;
    use game::game::{Self, GameStorage};
    use sui::random::{Self, Random};
    use coin_faucet::jp::JP;
    use book::utils::log;

    const ADMIN:address = @0xABCD;
    const PLAYER :address = @0x1234;
    // 测试初始化
    fun init_test(): (Scenario, address) {
        let mut scenario = test::begin(@0x0);
        random::create_for_testing(test::ctx(&mut scenario));

        // 初始化游戏存储
        next_tx(&mut scenario, ADMIN);
        {
            game::init_for_testing(test::ctx(&mut scenario));
        };
        
        
        (scenario, ADMIN)
    }

    #[test_only]
    fun deposite_value(sc :Scenario,amount : u64): Scenario{
        let mut scenario = sc;
        
        // 创建测试用的 SUI coin
        next_tx( &mut scenario, ADMIN);
        {
            let mut storage = test::take_shared<GameStorage>(&scenario);
            let ctx = test::ctx( &mut scenario);
            let coin = coin::mint_for_testing<JP>(amount, ctx);
            
            // 测试存款
            game::deposit(&mut storage, coin, amount, ctx);
            
            assert!(game::get_balance(&storage) == amount, 1);
            test::return_shared(storage);
        };
        scenario
    }

    #[test]
    fun test_deposit_play_success() {
        let (mut scenario, _) = init_test();
        let rnd :Random = test::take_shared(&scenario);

        scenario =  deposite_value(scenario,10000);

        next_tx(&mut scenario, PLAYER);
        {
           
            let mut storage = test::take_shared<GameStorage>(&scenario);
            let ctx = test::ctx(&mut scenario);
            let coin = coin::mint_for_testing<JP>(500, ctx);
            let guess = 3;
            game::play(&mut storage,&rnd,coin,100,guess,ctx);
            assert!(game::get_balance(&storage) != 10000);
            test::return_shared(storage);
        };
        test::return_shared(rnd);
        test::end(scenario);
    }

    #[test]
    #[expected_failure(abort_code = game::EAmountTooLarge)]
    fun test_play_insufficient_balance() {
        let (mut scenario, _) = init_test();

        let rnd =  test::take_shared<Random>(&mut scenario);
        
        //存入太少，余额不足
        scenario =  deposite_value(scenario,300);
        next_tx(&mut scenario, PLAYER);
        {
            
            let mut storage = test::take_shared<GameStorage>(&scenario);
            let ctx = test::ctx(&mut scenario);
            let coin = coin::mint_for_testing<JP>(200, ctx);
            
            let guess = 2;
            // 尝试在余额不足的情况下玩游戏
            game::play(&mut storage, &rnd,coin ,  200,guess,ctx);
            
            test::return_shared(storage);
        };
        test::return_shared(rnd);
        test::end(scenario);
    }


    
    #[test]
    #[expected_failure(abort_code = game::ECoinAmountIllegal)]
    fun test_play_coin_amount_illegal() {
        let (mut scenario, _) = init_test();
        let rnd =  test::take_shared<Random>(&mut scenario);
        
        //存入太少，余额不足
        scenario =  deposite_value(scenario,600);
        next_tx(&mut scenario, PLAYER);
        {
            
            let mut storage = test::take_shared<GameStorage>(&scenario);
            let ctx = test::ctx(&mut scenario);
            let coin = coin::mint_for_testing<JP>(199, ctx);
            
            let guess = 2;
            // 尝试在余额不足的情况下玩游戏
            game::play(&mut storage, &rnd,coin ,  200,guess,ctx);
            
            test::return_shared(storage);
        };
        test::return_shared(rnd);
        test::end(scenario);
    }



    #[test]
    #[expected_failure(abort_code = game::EAmountLessThan20)]
    fun test_play_less20() {
        let (mut scenario, _) = init_test();
        let rnd =  test::take_shared<Random>(&mut scenario);

        scenario = deposite_value(scenario,10000 );
        
        next_tx(&mut scenario, PLAYER);
        {
            let mut storage = test::take_shared<GameStorage>(&scenario);
            let ctx = test::ctx(&mut scenario);
            let coin = coin::mint_for_testing<JP>(19, ctx);
            
            let guess = 2;
            // 尝试在不足20 yen 玩游戏
            game::play(&mut storage, &rnd,coin ,  19,guess,ctx);
            
            test::return_shared(storage);
        };
        test::return_shared(rnd);
        test::end(scenario);
    }

    #[test]
    fun test_play_success() {
        let (mut scenario, _) = init_test();
        let rnd =  test::take_shared<Random>(& scenario);
        
        scenario = deposite_value(scenario,10000 );

        // 测试游戏玩法
        next_tx(&mut scenario, PLAYER);
        {
            
            let mut storage:GameStorage = test::take_shared(&scenario);
            let coin = coin::mint_for_testing<JP>(1000, test::ctx(&mut scenario));
            let coin_id = object::id(&coin);
            log(b"coin id: ",&coin_id);
            game::play(&mut storage, &rnd,coin,200,1, test::ctx(&mut scenario));
            test::next_tx(&mut scenario,PLAYER);
            
            let coin : Coin<JP> = test::take_from_sender_by_id(&scenario, coin_id);
            log(b"1. 交易之后的金额",&coin.value());
            game::play(&mut storage, &rnd,coin,200,2, test::ctx(&mut scenario));
            test::next_tx(&mut scenario,PLAYER);
            
            let coin : Coin<JP> = test::take_from_sender_by_id(&scenario, coin_id);
            log(b"2. 交易之后的金额",&coin.value());
            game::play(&mut storage, &rnd,coin,200,3, test::ctx(&mut scenario));
            test::next_tx(&mut scenario,PLAYER);
            let coin : Coin<JP> = test::take_from_sender_by_id(&scenario, coin_id);
            log(b"3. 交易之后的金额",&coin.value());

            // 验证余额变化
            assert!(game::get_balance(&storage) != 10000, 1);
            log(b"交易之后的金额",&coin.value());
            //验证比赛之后的金额
            assert!(coin.value() != 1000);
            test::return_to_sender(&scenario, coin);
            test::return_shared(rnd);
            test::return_shared(storage);
        };
            
        test::end(scenario);
    }

  

        #[test]
    fun test_dice() {
        let (mut scenario, _) = init_test();
        let rnd :Random = test::take_shared(&scenario); 

        test::next_tx(&mut scenario, @0x1234);
        {
            let mut i =0;
            loop{
                let num = game::dice(&rnd,  scenario.ctx());
                log(b"dice num:",&num);
                i = i + 1;
                if(i >= 10) break;
            };
        };

       
        test::return_shared(rnd); 
        test::end(scenario);
    }

    #[test]
    fun test_withdraw(){
         use std::string::{Self,String};
        let (mut scenario,_) = init_test();
        
        test::next_tx(&mut scenario, ADMIN);
        {
            scenario = deposite_value(scenario,10000 );
        };
        test::next_tx(&mut scenario, ADMIN);
        {
            let mut storage:GameStorage = test::take_shared(&scenario);
            let admin_cap : game::AdminCap = test::take_from_sender(&scenario);
            game::withdraw(&admin_cap, &mut storage, test::ctx(&mut scenario));

            test::return_shared(storage);
            test::return_to_sender(&scenario,admin_cap);
        };

        test::end(scenario);
    }

   