# swap合约

## 0x01 引用 `MY_COIN` 和 `FAUCET_COIN`

在Move.toml文件中增加对coin的地址引用
```move
[dependencies]
Sui = { git = "https://github.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/testnet" }
coin = { local = "../coin"}
```

## 0x02 定义流动性提供者`LSP`和资金池`Pool`
```move
    ///liquidity share provider(流动性提供者), parameter 'X' and 'Y'
    ///are coins held in the pool.
    public struct LSP<phantom X, phantom Y> has drop {}

    /// Pool with exchange
    public struct Pool<phantom X, phantom Y> has key {
        id: UID,
        coin_x: Balance<X>,
        coin_y: Balance<Y>,
        lsp_supply: Supply<LSP<X, Y>>,
        fee_percent: u64
    }
```
注意：
* 定义`LSP`的目的是为了在定义`Supply`时能确定`swap`的对象

## 初始化资金池
```move
    public fun new_pool<X, Y>(
        ctx: &mut TxContext
    ) {
        debug::print(&string(b"init MY_COIN <==> FAUCET_COIN pool"));
        let new_pool = Pool<X, Y> {
            id: object::new(ctx),
            coin_x: balance::zero(),
            coin_y: balance::zero(),
            lsp_supply: balance::create_supply<LSP<X, Y>>(LSP {}),  // 初始化供应量 （这里仅仅规范了X，Y，源代码：Supply { value: 0 }）
            fee_percent: (FEE_PERCENT as u64),
        };
        transfer::share_object(new_pool);       // share object
    }
```
注意：
* lsp_supply: balance::create_supply<LSP<X, Y>>(LSP {}),  // 这里仅仅规范了X，Y
* 因为是公开调用，所有需要共享资金池 transfer::share_object(new_pool);

## 测试代码
```move
#[test_only]
#[allow(unused_use)]
module swap::swap_tests {
    use std::ascii::string;
    use std::debug;
    use coin::my_coin::MY_COIN;
    use coin::faucet_coin::FAUCET_COIN;
    use sui::coin::{Self, Coin};
    use sui::test_scenario as ts;
    use swap::swap::{Self, Pool};


    #[test]
    public fun test_swap() {
        let admin = @0xA;
        let tom = @0xB;
        let john = @0xC;
        let mut scenario = ts::begin(admin);

        // init MY_COIN <==> FAUCET_COIN pool
        ts::next_tx(&mut scenario, admin);
        {
            swap::new_pool<MY_COIN,FAUCET_COIN>(scenario.ctx());
        };

        // add 200 MY_COIN and 100 FAUCET_COIN into liquidity pool
        ts::next_tx(&mut scenario, admin);
        {
            let mut pool = ts::take_shared<Pool<MY_COIN,FAUCET_COIN>>(&scenario);
            let coin_a_1 = coin::mint_for_testing<MY_COIN>(200, scenario.ctx());
            // let coin_b_1 = coin::zero<FAUCET_COIN>(scenario.ctx());
            let coin_b_1 = coin::mint_for_testing<FAUCET_COIN>(100, scenario.ctx());
            // debug::print(&pool);
            debug::print(&string(b"add 200 MY_COIN and 100 FAUCET_COIN into liquidity pool"));
            swap::add_liquidity(&mut pool, coin_a_1, coin_b_1, scenario.ctx());
            // debug::print(&pool);
            ts::return_shared<Pool<MY_COIN,FAUCET_COIN>>(pool);
        };

        // swap 10 MY_COIN to FAUCET_COIN
        ts::next_tx(&mut scenario, tom);
        {
            let mut pool = ts::take_shared<Pool<MY_COIN,FAUCET_COIN>>(&scenario);
            let coinA = coin::mint_for_testing<MY_COIN>(10, scenario.ctx());
            debug::print(&string(b"swap 10 MY_COIN to FAUCET_COIN"));
            swap::sellA(&mut pool, coinA, scenario.ctx());
            debug::print(&pool);
            ts::return_shared<Pool<MY_COIN,FAUCET_COIN>>(pool);
        };

        // swap 10 FAUCET_COIN to MY_COIN
        ts::next_tx(&mut scenario, john);
        {
            let mut pool = ts::take_shared<Pool<MY_COIN,FAUCET_COIN>>(&scenario);
            let coinB = coin::mint_for_testing<FAUCET_COIN>(10, scenario.ctx());
            debug::print(&string(b"swap 10 FAUCET_COIN to MY_COIN"));
            swap::sellB(&mut pool, coinB, scenario.ctx());
            debug::print(&pool);
            ts::return_shared<Pool<MY_COIN,FAUCET_COIN>>(pool);
        };

        // query tom's coin
        ts::next_tx(&mut scenario, tom);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            debug::print(&string(b"query tom's coin"));
            debug::print(&coin::value(&coin));
            ts::return_to_sender<Coin<FAUCET_COIN>>(&scenario, coin);
        };

        // query john's coin
        ts::next_tx(&mut scenario, john);
        {
            let coin = ts::take_from_sender<Coin<MY_COIN>>(&scenario);
            debug::print(&string(b"query john's coin"));
            debug::print(&coin::value(&coin));
            ts::return_to_sender<Coin<MY_COIN>>(&scenario, coin);
        };

        // coin::burn_for_testing(coin_a_1);
        // coin::burn_for_testing(coin_b_1);

        ts::end(scenario);
        // pass
    }

    #[test]
    public fun test_add_liquidity() {
        let admin = @0xA;
        let mut scenario = ts::begin(admin);

        // init MY_COIN <==> FAUCET_COIN pool
        ts::next_tx(&mut scenario, admin);
        {
        swap::new_pool<MY_COIN, FAUCET_COIN>(scenario.ctx());
        };

        // add 200 MY_COIN and 100 FAUCET_COIN into liquidity pool
        ts::next_tx(&mut scenario, admin);
        {
        let mut pool = ts::take_shared<Pool<MY_COIN, FAUCET_COIN>>(&scenario);
        let coin_a_1 = coin::mint_for_testing<MY_COIN>(200, scenario.ctx());
        let coin_b_1 = coin::mint_for_testing<FAUCET_COIN>(100, scenario.ctx());
        debug::print(&string(b"add 200 MY_COIN and 100 FAUCET_COIN into liquidity pool"));
        swap::add_liquidity(&mut pool, coin_a_1, coin_b_1, scenario.ctx());
        // debug::print(&pool);
        ts::return_shared<Pool<MY_COIN, FAUCET_COIN>>(pool);
        };

        ts::end(scenario);
        // pass
    }
}
```

这里暂时不增加测试，否则需要在发布时将coin代码包含到package中