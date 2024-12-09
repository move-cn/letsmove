#[test_only]
module task5::test_swap {
    use sui::test_scenario::{Self, ctx};
    use sui::coin::{TreasuryCap, Coin};
    use sui::balance::{Self};

    use task5::faucet_coin::{Self, FAUCET_COIN};
    use task5::my_coin::{Self, MY_COIN};
    use task5::swap::{Self, Treasury};

    const ADMIN: address = @0xA;

    #[test]
    fun process_for_testing() {
        let mut scenario = test_scenario::begin(ADMIN);

        // 初始化代币a合约和代币b合约
        {
            faucet_coin::init_for_testing(ctx(&mut scenario));
            my_coin::init_for_testing(ctx(&mut scenario));
        };
        test_scenario::next_tx(&mut scenario, ADMIN);

        // 获取代币a铸币权
        let mut treasury_cap_a = test_scenario::take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
        // 获取代币b铸币权
        let mut treasury_cap_b = test_scenario::take_from_address<TreasuryCap<MY_COIN>>(&scenario, ADMIN);

        // 创建库存
        swap::new<FAUCET_COIN, MY_COIN>(ctx(&mut scenario));
        test_scenario::next_tx(&mut scenario, ADMIN);
        // 铸造代币a
        faucet_coin::mint(&mut treasury_cap_a, 100_000_000_000, ADMIN, ctx(&mut scenario));
        test_scenario::next_tx(&mut scenario, ADMIN);
        // 铸造代币b
        my_coin::mint(&mut treasury_cap_b, 100_000_000_000, ADMIN, ctx(&mut scenario));
        test_scenario::next_tx(&mut scenario, ADMIN);

        // 获取库存对象
        let mut treasury = test_scenario::take_shared<Treasury<FAUCET_COIN, MY_COIN>>(&scenario);
        // 获取代币a
        let despoit_coin_a = test_scenario::take_from_address<Coin<FAUCET_COIN>>(&scenario, ADMIN);
        // 获取代币b
        let despoit_coin_b = test_scenario::take_from_address<Coin<MY_COIN>>(&scenario, ADMIN);

        // === add_liquidity ===

        // 添加流动性
        swap::add_liquidity<FAUCET_COIN, MY_COIN>(
            &mut treasury,
            despoit_coin_a,
            despoit_coin_b,
        );
        test_scenario::next_tx(&mut scenario, ADMIN);
        // 查看资金
        {
            let (treasury_coin_a, treasury_coin_b) = swap::get_coin_mut<FAUCET_COIN, MY_COIN>(&mut treasury);
            assert!(balance::value(treasury_coin_a) == 100_000_000_000, 0);
            assert!(balance::value(treasury_coin_b) == 100_000_000_000, 0);
        };

        // === swap_a_to_b ===

        // 获取代币a
        faucet_coin::mint(&mut treasury_cap_a, 100, ADMIN, ctx(&mut scenario));
        test_scenario::next_tx(&mut scenario, ADMIN);
        // 获取代币a
        let input_coin_a = test_scenario::take_from_address<Coin<FAUCET_COIN>>(&scenario, ADMIN);
        // 代币a兑换代币b
        {
            let out_coin = swap::swap_a_to_b<FAUCET_COIN, MY_COIN>(&mut treasury, input_coin_a, ctx(&mut scenario));
            transfer::public_transfer(out_coin, ADMIN);
        };
        test_scenario::next_tx(&mut scenario, ADMIN);
        // 查看资金
        {
            let (treasury_coin_a, treasury_coin_b) = swap::get_coin_mut<FAUCET_COIN, MY_COIN>(&mut treasury);
            assert!(balance::value(treasury_coin_a) == 100_000_000_000 + 100, 0);
            assert!(balance::value(treasury_coin_b) == 100_000_000_000 - 100, 0);
        };

        // === swap_b_to_a ===

        // 铸造代币b
        my_coin::mint(&mut treasury_cap_b, 100, ADMIN, ctx(&mut scenario));
        test_scenario::next_tx(&mut scenario, ADMIN);
        // 获取代币b
        let input_coin_b = test_scenario::take_from_address<Coin<MY_COIN>>(&scenario, ADMIN);
        // 代币b兑换代币a
        {
            let out_coin = swap::swap_b_to_a<FAUCET_COIN, MY_COIN>(&mut treasury, input_coin_b, ctx(&mut scenario));
            transfer::public_transfer(out_coin, ADMIN);
        };
        test_scenario::next_tx(&mut scenario, ADMIN);
        // 查看资金
        {
            let (treasury_coin_a, treasury_coin_b) = swap::get_coin_mut<FAUCET_COIN, MY_COIN>(&mut treasury);
            assert!(balance::value(treasury_coin_a) == 100_000_000_000 + 100 - 100, 0);
            assert!(balance::value(treasury_coin_b) == 100_000_000_000 - 100 + 100, 0);
        };

        test_scenario::return_shared(treasury_cap_a);
        transfer::public_transfer(treasury_cap_b, ADMIN);
        test_scenario::return_shared(treasury);
        test_scenario::end(scenario);
    }
}
