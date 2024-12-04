#[test_only]
module t2::my_coin_tests {
    use sui::coin::{TreasuryCap, Coin};
    use sui::test_scenario::{ctx, begin, end, next_tx, take_from_sender, return_to_address};
    use t2::my_coin::{Self, MY_COIN, mint, burn};

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_mint_burn() {
        let addr1 = @0xA;
        //以addr1为发送方开始多事物场景
        let mut scenario = begin(addr1);
        //测试init
        {
            my_coin::test_init(ctx(&mut scenario))
        };
        //测试mint
        next_tx(&mut scenario, addr1);//结束上一笔交易,开始下一笔交易
        {
            //从账户中获取treasurycap对象
            let mut treasury_cap = take_from_sender<TreasuryCap<MY_COIN>>(&scenario);
            mint(&mut treasury_cap, 100, addr1, ctx(&mut scenario));
            return_to_address<TreasuryCap<MY_COIN>>(addr1, treasury_cap);//将treasurycap放回到addr1中
        };
        //测试burn
        next_tx(&mut scenario, addr1);
        {
            //从账户中获取treasurycap对象
            let mut treasury_cap = take_from_sender<TreasuryCap<MY_COIN>>(&scenario);
            //从账户中获取coin对象
            let coin = take_from_sender<Coin<MY_COIN>>(&scenario);
            burn(&mut treasury_cap, coin);
            return_to_address(addr1, treasury_cap);
        };

        //清理scenario对象
        end(scenario);
    }

    #[test]
    fun test_mint_borrow() {
        let addr1 = @0xB;
        let addr2 = @0xC;

        let mut scenario1 = begin(addr1);
        let mut scenario2 = begin(addr2);

        {
            my_coin::test_init(ctx(&mut scenario1))
        };
        next_tx(&mut scenario1, addr1);
        {
            let mut treasury_cap = take_from_sender<TreasuryCap<MY_COIN>>(&scenario1);
            //这个不会失败,因为虽然addr2没有treasury_cap的所有权,但是这里已经从addr1中获取treasury_cap所有权
            mint(&mut treasury_cap, 100, addr2, ctx(&mut scenario2));
            return_to_address(addr1, treasury_cap);
        };

        end(scenario1);
        end(scenario2);
    }

    #[test, expected_failure(abort_code = ENotImplemented)]
    fun test_t2_fail() {
        abort ENotImplemented
    }
}
