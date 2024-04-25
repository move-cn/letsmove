#[test_only]
    module xushizhao_coin::my_coin_tests {
    use xushizhao_coin::xushizhao_coin::{Self, XUSHIZHAO_COIN};
    use sui::coin::{Coin, TreasuryCap};
    use sui::test_scenario::{Self, next_tx, ctx};
    use std::debug::print;

    #[test]
    fun mint_burn() {
        // 模拟address
        let addr1 = @0xA;

        let mut scenario = test_scenario::begin(addr1);

        // r执行初始化
        {
            xushizhao_coin::test_init(ctx(&mut scenario))
        };

        // init coin
        next_tx(&mut scenario, addr1);
        {
            let mut treasurycap = test_scenario::take_from_sender<TreasuryCap<XUSHIZHAO_COIN>>(&scenario);
            xushizhao_coin::mint(&mut treasurycap, 100, addr1, test_scenario::ctx(&mut scenario));
            xushizhao_coin::mint(&mut treasurycap, 100, addr1, test_scenario::ctx(&mut scenario));
            xushizhao_coin::getCoin();
            test_scenario::return_to_address<TreasuryCap<XUSHIZHAO_COIN>>(addr1, treasurycap);            
        };

  
        test_scenario::end(scenario);
    }
    }