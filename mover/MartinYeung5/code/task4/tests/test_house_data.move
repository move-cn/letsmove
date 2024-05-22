// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

#[test_only]
module martinyeung5::test_house_data {

    use sui::coin::{Self, Coin};
    use sui::sui::SUI;
    use sui::test_scenario::{Self, Scenario};

    use martinyeung5::test_common::{Self as tc};
    use martinyeung5::single_player_satoshi::{Self as sps};
    use martinyeung5::house_data::{Self as hd, HouseData};

    // Faucet Coin
    use fungible_tokens::faucetucoin::{Self, FAUCETUCOIN};

    const EWrongWithdrawAmount: u64 = 1;
    const EWrongHouseBalanceAfterFund: u64 = 2;
    const EWrongMaxStake: u64 = 3;
    const EWrongMinStake: u64 = 4;

    // ---------- Helper functions ---------

    // Used to initialize the user and house balances.
    fun fund_house(scenario: &mut Scenario, house: address, house_funds: u64) {
        let ctx = scenario.ctx();
        let coinA = coin::mint_for_testing<FAUCETUCOIN>(house_funds, ctx);
        transfer::public_transfer(coinA, house);
    }

    // -------------- Sunny Day Tests ----------------
    #[test]
    fun house_withdraws_balance() {
        let house = @0xCAFE;

        let mut scenario_val = test_scenario::begin(house);
        let scenario = &mut scenario_val;
        {
            fund_house(scenario, house, tc::get_initial_house_balance());
        };

        tc::init_house(scenario, house, true);

        // House withdraws funds.
        scenario.next_tx(house);
        {
            let mut house_data = scenario.take_shared<HouseData>();
            let ctx = scenario.ctx();
            house_data.withdraw(ctx);
            test_scenario::return_shared(house_data);
        };

        // Check that the HouseData balance has been depleted and that the house's account has been credited.
        scenario.next_tx(house);
        {
            let withdraw_coin = scenario.take_from_sender<Coin<FAUCETUCOIN>>();
            assert!(withdraw_coin.value() == tc::get_initial_house_balance(), EWrongWithdrawAmount);
            scenario.return_to_sender(withdraw_coin);
        };

        scenario_val.end();
    }

    #[test]
    fun house_withdraws_fees() {
        let house = @0xCAFE;
        let player = @0xDECAf;

        let mut scenario_val = test_scenario::begin(house);
        let scenario = &mut scenario_val;
        {
            tc::fund_addresses(scenario, house, player, tc::get_initial_house_balance(), tc::get_initial_player_balance());
        };

        tc::init_house(scenario, house, true);

        // Player creates his/her counter NFT and the game.
        let game_id = tc::create_counter_nft_and_game(scenario, player, tc::get_min_stake(), false, true);

        // Get the game's fee
        let game_fee = tc::game_fees(scenario, game_id, house);

        // House ends the game.
        tc::end_game(scenario, game_id, house, true);

        // House withdraws fees.
        scenario.next_tx(house);
        {
            let mut house_data = scenario.take_shared<HouseData>();
            let ctx = scenario.ctx();
            house_data.claim_fees(ctx);
            test_scenario::return_shared(house_data);
        };

        // Check that the HouseData fees balance has been depleted and that the house's account has been credited.
        scenario.next_tx(house);
        {
            let withdraw_coin = scenario.take_from_sender<Coin<FAUCETUCOIN>>();
            let fees = sps::fee_amount(tc::get_min_stake()*2, game_fee);
            assert!(withdraw_coin.value() == fees, EWrongWithdrawAmount);
            scenario.return_to_sender(withdraw_coin);
        };

        scenario_val.end();
    }

    #[test]
    fun house_top_ups() {
        let house = @0xCAFE;

        let mut scenario_val = test_scenario::begin(house);
        let scenario = &mut scenario_val;
        {
            fund_house(scenario, house, tc::get_initial_house_balance());
        };

        tc::init_house(scenario, house, true);

        // Create fund coin & send it to house.
        scenario.next_tx(house);
        {
            let ctx = scenario.ctx();
            let fund_coin = coin::mint_for_testing<FAUCETUCOIN>(tc::get_min_stake(), ctx);
            transfer::public_transfer(fund_coin, house);
        };

        // Top up with fund coin.
        scenario.next_tx(house);
        {
            let mut house_data = scenario.take_shared<HouseData>();
            let owned_fund_coin = scenario.take_from_sender<Coin<FAUCETUCOIN>>();
            let ctx = scenario.ctx();
            house_data.top_up(owned_fund_coin, ctx);
            let house_balance = house_data.balance();
            assert!(house_balance == tc::get_initial_house_balance() + tc::get_min_stake(), EWrongHouseBalanceAfterFund);
            test_scenario::return_shared(house_data);
        };

        scenario_val.end();
    }

    #[test]
    fun house_updates_max_stake() {
        let house = @0xCAFE;

        let mut scenario_val = test_scenario::begin(house);
        let scenario = &mut scenario_val;
        {
            fund_house(scenario, house, tc::get_initial_house_balance());
        };

        tc::init_house(scenario, house, true);

        // House address updates max stake.
        scenario.next_tx(house);
        {
            let mut house_data = scenario.take_shared<HouseData>();
            let ctx = scenario.ctx();
            house_data.update_max_stake(tc::get_max_stake()*2, ctx);
            test_scenario::return_shared(house_data);
        };

        // Check if max stake has been updated.
        scenario.next_tx(house);
        {
            let house_data = scenario.take_shared<HouseData>();
            let max_stake = house_data.max_stake();
            assert!(max_stake == tc::get_max_stake()*2, EWrongMaxStake);
            test_scenario::return_shared(house_data);
        };

        scenario_val.end();
    }

    #[test]
    fun house_updates_min_stake() {
        let house = @0xCAFE;

        let mut scenario_val = test_scenario::begin(house);
        let scenario = &mut scenario_val;
        {
            fund_house(scenario, house, tc::get_initial_house_balance());
        };

        tc::init_house(scenario, house, true);

        // House address updates min stake.
        scenario.next_tx(house);
        {
            let mut house_data = scenario.take_shared<HouseData>();
            let ctx = scenario.ctx();
            house_data.update_min_stake(tc::get_min_stake()*2, ctx);
            test_scenario::return_shared(house_data);
        };

        // Check if min stake has been updated.
        scenario.next_tx(house);
        {
            let house_data = scenario.take_shared<HouseData>();
            let min_stake = house_data.min_stake();
            assert!(min_stake == tc::get_min_stake()*2, EWrongMaxStake);
            test_scenario::return_shared(house_data);
        };

        scenario_val.end();
    }

    // ------------- Rainy day tests -------------

    #[test]
    #[expected_failure(abort_code = hd::ECallerNotHouse)]
    fun caller_not_house_on_withdraw() {
        let house = @0xCAFE;
        let player = @0xDECAF;

        let mut scenario_val = test_scenario::begin(house);
        let scenario = &mut scenario_val;
        {
            fund_house(scenario, house, tc::get_initial_house_balance());
        };

        tc::init_house(scenario, house, true);

        // Non house address tries to withdraw.
        scenario.next_tx(player);
        {
            let mut house_data = scenario.take_shared<HouseData>();
            let ctx = scenario.ctx();
            house_data.withdraw(ctx);
            test_scenario::return_shared(house_data);
        };

        scenario_val.end();
    }

    #[test]
    #[expected_failure(abort_code = hd::ECallerNotHouse)]
    fun caller_not_house_on_claim_fees() {
        let house = @0xCAFE;
        let player = @0xDECAF;

        let mut scenario_val = test_scenario::begin(house);
        let scenario = &mut scenario_val;
        {
            fund_house(scenario, house, tc::get_initial_house_balance());
        };

        tc::init_house(scenario, house, true);

        // Non house address tries to claim fees.
        scenario.next_tx(player);
        {
            let mut house_data = scenario.take_shared<HouseData>();
            let ctx = scenario.ctx();
            house_data.claim_fees(ctx);
            test_scenario::return_shared(house_data);
        };

        scenario_val.end();
    }


    #[test]
    #[expected_failure(abort_code = hd::EInsufficientBalance)]
    fun house_wrong_initialization() {
        let house = @0xCAFE;

        let mut scenario_val = test_scenario::begin(house);
        let scenario = &mut scenario_val;
        {
            fund_house(scenario, house, 0);
        };

        // Should throw because house has no funds.
        tc::init_house(scenario, house, true);

        scenario_val.end();
    }

    #[test]
    #[expected_failure(abort_code = hd::ECallerNotHouse)]
    fun caller_not_house_on_update_max_stake() {
        let house = @0xCAFE;
        let player = @0xDECAF;

        let mut scenario_val = test_scenario::begin(house);
        let scenario = &mut scenario_val;
        {
            fund_house(scenario, house, tc::get_initial_house_balance());
        };

        tc::init_house(scenario, house, true);

        // Non house address tries to update max stake.
        scenario.next_tx(player);
        {
            let mut house_data = scenario.take_shared<HouseData>();
            let ctx = scenario.ctx();
            house_data.update_max_stake(tc::get_max_stake()*2, ctx);
            test_scenario::return_shared(house_data);
        };

        scenario_val.end();
    }

    #[test]
    #[expected_failure(abort_code = hd::ECallerNotHouse)]
    fun caller_not_house_on_update_min_stake() {
        let house = @0xCAFE;
        let player = @0xDECAF;

        let mut scenario_val = test_scenario::begin(house);
        let scenario = &mut scenario_val;
        {
            fund_house(scenario, house, tc::get_initial_house_balance());
        };

        tc::init_house(scenario, house, true);

        // Non house address tries to update min stake.
        scenario.next_tx(player);
        {
            let mut house_data = scenario.take_shared<HouseData>();
            let ctx = scenario.ctx();
            house_data.update_min_stake(tc::get_min_stake()*2, ctx);
            test_scenario::return_shared(house_data);
        };

        scenario_val.end();
    }
}
