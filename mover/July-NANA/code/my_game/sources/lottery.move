module my_game::lottery {
    use std::vector;
    use sui::balance;
    use sui::clock::Clock;
    use sui::coin;
    use sui::coin::{Coin, TreasuryCap, balance};
    use sui::event;
    use sui::object;
    use sui::sui::SUI;
    use sui::tx_context;
    use my_game::utils;
    use my_token::july_nana_faucet_token::{JULY_NANA_FAUCET_TOKEN, mint};

    const SUI_LIMMIT: u64 = 100000;
    const TIMES: u64 = 2;
    const MIST_PER_JULY_NANA_FAUCET: u64 = 100_000_000;
    const MIST_PER_SUI: u64 = 1_000_000_000;

    //错误码
    const ENOT_ENOUGH_SUI: u64 = 0;
    const ENOT_ADMIN: u64 = 1;

    public struct LOTTERY has drop {}

    public struct StoredSUI has key, store {
        id: UID,
        coins: vector<Coin<SUI>>,
        admin: address,
    }

    // 事件
    public struct RandomNum has copy, drop {
        balance: u64,
        min: u64,
        max: u64,
        rate: u64,
        random_num: u64,
    }

    fun init(otw: LOTTERY, ctx: &mut TxContext) {
        let stored_sui = StoredSUI {
            id: object::new(ctx),
            coins: vector::empty(),
            admin: tx_context::sender(ctx)
        };
        transfer::public_share_object(stored_sui);
    }

    // 花费少量SUI，抽取随机数量的Faucet Coin
    entry fun play(
        clock: &Clock,
        store: &mut StoredSUI,
        sui_coin: Coin<SUI>,
        cap: &mut TreasuryCap<JULY_NANA_FAUCET_TOKEN>,
        ctx: &mut TxContext
    ) {
        //检查是否足够
        let balance = coin::balance(&sui_coin);
        let balance_value = balance::value(balance);
        assert!(balance::value(balance) >= SUI_LIMMIT, 0);

        //收款
        vector::push_back(&mut store.coins, sui_coin);
        //生成随机数
        //计算汇率
        let rate: u64 = MIST_PER_SUI / MIST_PER_JULY_NANA_FAUCET;
        // let mut random_generator = random::new_generator(random, ctx);
        let random_num = utils::generate_random_in_range(
            ctx,
            clock,
            balance_value / rate,
            balance_value * TIMES / rate,
        );
        // let random_num = balance_value * MIST_PER_JULY_NANA_FAUCET / MIST_PER_SUI;

        //铸造奖励代币
        event::emit(RandomNum {
            balance: balance_value,
            min: balance_value / rate,
            max: balance_value * TIMES / rate,
            rate: rate,
            random_num: random_num,
        });
        mint(cap, random_num, tx_context::sender(ctx), ctx);
    }

    //管理员提取所有coin
    entry fun withdrow(store: &mut StoredSUI, ctx: &mut TxContext) {
        assert!(tx_context::sender(ctx) == store.admin, ENOT_ADMIN);
        while (!vector::is_empty(&store.coins)) {
            let coin_transfer = vector::pop_back(&mut store.coins);
            transfer::public_transfer(coin_transfer, store.admin);
        };
    }
}