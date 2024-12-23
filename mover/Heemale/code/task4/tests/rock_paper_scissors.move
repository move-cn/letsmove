#[test_only]
#[lint_allow(share_owned)]
module task4::test_rock_paper_scissors {
    use sui::test_scenario::{Self, ctx};
    use sui::sui::SUI;
    use sui::random::{Self, Random};
    use sui::coin::{Self};
    use sui::balance::{Self};
    use std::debug;

    use task4::place::{Self, Place};
    use task4::rock_paper_scissors::{Self};

    const SYSTEM: address = @0x0;
    const ADMIN: address = @0xA;
    const RECEIVER: address = @0xB;
    const PLAYER: address = @0xC;

    #[test]
    fun process_for_testing() {
        let mut scenario = test_scenario::begin(ADMIN);

        // 创建场地
        place::create<SUI>(
            500,
            20000,
            ADMIN,
            RECEIVER,
            ctx(&mut scenario),
        );
        test_scenario::next_tx(&mut scenario, ADMIN);

        // 获取场地对象
        let mut place = test_scenario::take_shared<Place<SUI>>(&scenario);

        // 获取注资资金
        let funds = coin::mint_for_testing<SUI>(100_000_000_000, ctx(&mut scenario));

        // 注资
        place::inject<SUI>(
            &mut place,
            funds,
            100_000_000_000,
            ctx(&mut scenario),
        );
        test_scenario::next_tx(&mut scenario, SYSTEM);
        // 查看奖池资金
        assert!(balance::value(place::prize_pool(&place)) == 100_000_000_000, 0);

        // 获取随机数
        random::create_for_testing(ctx(&mut scenario));
        test_scenario::next_tx(&mut scenario, PLAYER);
        let random = test_scenario::take_shared<Random>(&scenario);

        // 获取入金
        let pay = coin::mint_for_testing<SUI>(1_000_000_000, ctx(&mut scenario));
        // 开始游戏
        rock_paper_scissors::play<SUI>(
            &mut place,
            pay,
            2,
            &random,
            ctx(&mut scenario),
        );
        let balance_value = balance::value<SUI>(place::prize_pool(&place));
        // 奖金校验
        debug::print(&balance_value);

        place::destroy_for_testing(place);
        test_scenario::return_shared(random);
        test_scenario::end(scenario);
    }
}
