#[test_only]
module t2::faucet_coin_tests {
    use sui::coin::TreasuryCap;
    use sui::test_scenario::{begin, ctx, end, next_tx, return_shared, take_shared};

    use t2::faucet_coin::{FAUCET_COIN, mint, test_init};

    #[test]
    public fun test_mint_burn() {
        let addr1 = @0xB;
        let addr2 = @0xC;

        let mut scenario1 = begin(addr1);
        let mut scenario2 = begin(addr2);

        //测试init
        {
            test_init(ctx(&mut scenario1));
        };

        //测试mint
        next_tx(&mut scenario1, addr1);
        {
            let mut treasury_cap = take_shared<TreasuryCap<FAUCET_COIN>>(&scenario1);
            mint(&mut treasury_cap, 1000, addr1, ctx(&mut scenario1));//地址1可以mint
            mint(&mut treasury_cap, 1000, addr2, ctx(&mut scenario2));//地址2也可以mint
            return_shared(treasury_cap);
        };

        end(scenario1);
        end(scenario2);
    }
}
