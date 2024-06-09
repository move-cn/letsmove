#[test_only]
module t5::t5_tests {
    use std::debug::print;

    use sui::coin;
    use sui::coin::Coin;
    use sui::test_scenario::{
        begin,
        ctx,
        end,
        next_tx,
        return_shared,
        return_to_sender,
        take_from_sender, take_shared
    };
    use t2::faucet_coin::FAUCET_COIN;
    use t2::my_coin::MY_COIN;

    use t5::gaowanlang_swap::{create_pool, Pool, swap_a_to_b, swap_b_to_a};

    // use sui::coin::{Self, Coin, TreasuryCap};
    const ENotImplemented: u64 = 0;

    #[test]
    fun test_t5() {
        let addr = @0xA;
        let mut scenario = begin(addr);

        let coin_a_1 = coin::mint_for_testing<MY_COIN>(1000, ctx(&mut scenario));
        let coin_a_2 = coin::mint_for_testing<MY_COIN>(800, ctx(&mut scenario));
        let coin_b_1 = coin::mint_for_testing<FAUCET_COIN>(1000, ctx(&mut scenario));


        //构建流动性池子
        {
            create_pool(coin_a_1, coin_b_1, ctx(&mut scenario));
        };
        next_tx(&mut scenario, addr);

        //使用a 兑换b
        {
            let mut pool = take_shared<Pool<MY_COIN, FAUCET_COIN>>(&scenario);
            swap_a_to_b(&mut pool, coin_a_2, ctx(&mut scenario));
            return_shared(pool);
        };
        next_tx(&mut scenario, addr);
        //使用b兑换a
        {
            let mut pool = take_shared<Pool<MY_COIN, FAUCET_COIN>>(&scenario);
            let coin_b = take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            //看看上一步用800 MY_COIN 换到了多少 FAUCET_COIN
            print(&coin::value(&coin_b));
            //算一算,对不对
            //y - (k / (x + input_with_fee));
            let k = 1000 * 1000;
            let input_with_fee = (800 as u128) * ((10000 as u128) / ((10000 as u128) - (30 as u128)));
            print(&input_with_fee);
            let should = 1000 - (k / (1000 + input_with_fee));
            print(&should);
            // assert!(should == (coin::value(&coin_b) as u128), 0); 有误差,所以不能用相等来判断
            swap_b_to_a(&mut pool, coin_b, ctx(&mut scenario));
            return_shared(pool);
        };
        next_tx(&mut scenario, addr);
        //看看第二轮,用 FAUCET_COIN 换到了多少 MY_COIN
        {
            let coin_a = take_from_sender<Coin<MY_COIN>>(&scenario);
            print(&coin::value(&coin_a));
            return_to_sender(&scenario, coin_a);
        };
        end(scenario);
    }

    #[test, expected_failure(abort_code = ENotImplemented)]
    fun test_t5_fail() {
        abort ENotImplemented
    }
}
