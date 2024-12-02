#[test_only]
module my_game::my_game_tests;
use my_coin::faucet_coin::FAUCET_COIN;
use sui::coin;
use sui::coin::Coin;
use sui::random;
use sui::random::{Random};
use sui::test_scenario;
use sui::test_scenario::{ctx, end, next_tx, return_shared, return_to_sender, Scenario, take_from_sender, take_shared};

use my_game::my_game::{deposit_balance_to_game, Game, GameAdminCap, get_balance, get_epoch,
    test_init, play
};



#[test]
fun test_my_game() {
    //定义两个用户用于测试
    let user1 = @0x0;
    let user2 = @0x1;

    //开始测试用例，将user1做为初始用户
    let mut ts = test_scenario::begin(user1);
    //为测试用例创建Random对象
    random::create_for_testing(ctx(&mut ts));

    //将user1做为交易发送方开始新的交易
    next_tx(&mut ts, user1);
    //获取Random对象
    let mut random_state = take_shared<Random>(&ts);
    //更新Random对象的随机数状态
    random_state.update_randomness_state_for_testing(
        0,
        x"1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F",
        ctx(&mut ts)
    );

    next_tx(&mut ts, user1);
    //初始化my_game合约
    test_init(ctx(&mut ts));

    next_tx(&mut ts, user1);
    //user1往游戏合约里面充值钱
    //获取游戏管理员对象
    let cap = take_from_sender<GameAdminCap>(&ts);
    //获取game对象
    let mut game = take_shared<Game>(&ts);
    //往游戏里面存钱

    mint(user1, 1000, &mut ts);
    let coin = take_from_sender<Coin<FAUCET_COIN>>(&ts);
    deposit_balance_to_game(&cap, &mut game, coin, ctx(&mut ts));
    return_to_sender(&ts, cap);

    //校验游戏余额是否正确
    assert!(get_balance(&game) == 1000, 1);
    assert!(get_epoch(&game) == 0, 1);

    //Round1
    {
        //切换到user2，开始玩游戏
        next_tx(&mut ts, user2);
        //给user2 mint 100个FAUCET_COIN
        mint(user2, 100, &mut ts);
        //获取user2的coin对象
        let mut coin = take_from_sender<Coin<FAUCET_COIN>>(&ts);
        //开始玩游戏
        play(&mut coin, &mut game, &random_state, ctx(&mut ts));
        //校验游戏余额是否正确
        assert!(get_balance(&game) == 900, 1);//lost 100
        //校验用户的coin对象是否正确
        assert!(coin::value(&coin) == 200, 1); // won 100
        return_to_sender(&ts, coin);
    };

    //Round2
    {
        //切换到user2，开始玩游戏
        next_tx(&mut ts, user2);
        //给user2 mint 200个FAUCET_COIN
        mint(user2, 200, &mut ts);
        //获取user2的coin对象
        let mut coin = take_from_sender<Coin<FAUCET_COIN>>(&ts);
        //开始玩游戏
        play(&mut coin, &mut game, &random_state, ctx(&mut ts));
        //校验游戏余额是否正确
        assert!(get_balance(&game) == 1100, 1); //won 200
        //校验用户的coin对象是否正确
        assert!(coin::value(&coin) == 0, 1); // lost 200
        return_to_sender(&ts, coin);
    };

    //Round3
    {
        //切换到user2，开始玩游戏
        next_tx(&mut ts, user2);
        //给user2 mint 300个FAUCET_COIN
        mint(user2, 300, &mut ts);
        //获取user2的coin对象
        let mut coin = take_from_sender<Coin<FAUCET_COIN>>(&ts);
        //开始玩游戏
        play(&mut coin, &mut game, &random_state, ctx(&mut ts));
        //校验游戏余额是否正确
        assert!(get_balance(&game) == 1400, 1); //won 300
        //校验用户的coin对象是否正确
        assert!(coin::value(&coin) == 0, 1); // lost 300
        return_to_sender(&ts, coin);
    };


    //Round4
    {
        //切换到user2，开始玩游戏
        next_tx(&mut ts, user2);
        //给user2 mint 400个FAUCET_COIN
        mint(user2, 400, &mut ts);
        //获取user2的coin对象
        let mut coin = take_from_sender<Coin<FAUCET_COIN>>(&ts);
        //开始玩游戏
        play(&mut coin, &mut game, &random_state, ctx(&mut ts));
        //校验游戏余额是否正确
        assert!(get_balance(&game) == 1000, 1); //lost 400
        //校验用户的coin对象是否正确
        assert!(coin::value(&coin) == 800, 1); // won 400
        return_to_sender(&ts, coin);
    };

    //销毁测试用例中的对象
    return_shared(game);
    return_shared(random_state);

    //结束测试用例
    end(ts);
}


fun mint(address: address, amount: u64, scenario: &mut Scenario) {
    let coin = coin::mint_for_testing<FAUCET_COIN>(amount, ctx(scenario));
    transfer::public_transfer(coin, address);
    next_tx(scenario, address);
}
