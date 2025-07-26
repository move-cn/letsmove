/*
/// 模块: jack_751_swap
/// 一个简单的交换模块，允许用户在 JACK_751 和 JACK_751_FAUCET_COIN 之间进行交换
*/

// Move编程规范请参考
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module jack_751_swap::jack_751_swap {
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::event;
    
    // 从task2导入两种代币类型
    use my_coin::jack_751::JACK_751;
    use my_coin::jack_751_faucet_coin::JACK_751_FAUCET_COIN;

    // 错误代码
    const EInsufficientLiquidity: u64 = 1;
    const EZeroAmount: u64 = 2;
    const EInvalidSwapRatio: u64 = 3;

    // 交换池结构体
    public struct SwapPool has key {
        id: UID,
        jack_751_balance: Balance<JACK_751>,
        faucet_coin_balance: Balance<JACK_751_FAUCET_COIN>,
        // 简单的1:1交换比例示例
        swap_ratio: u64, // 1个jack_751代币可以换多少个faucet代币 (乘以1000用于精度)
    }

    // 事件结构体
    public struct SwapEvent has copy, drop {
        user: address,
        jack_751_in: u64,
        faucet_coin_in: u64,
        jack_751_out: u64,
        faucet_coin_out: u64,
    }

    public struct LiquidityEvent has copy, drop {
        user: address,
        jack_751_amount: u64,
        faucet_coin_amount: u64,
        action: vector<u8>, // "add" 或 "remove"
    }

    // 初始化交换池
    fun init(ctx: &mut TxContext) {
        let pool = SwapPool {
            id: object::new(ctx),
            jack_751_balance: balance::zero<JACK_751>(),
            faucet_coin_balance: balance::zero<JACK_751_FAUCET_COIN>(),
            swap_ratio: 1000, // 1:1 比例 (1000/1000)
        };
        transfer::share_object(pool);
    }

    // 仅用于测试的初始化函数
    #[test_only]
    public fun init_for_testing(ctx: &mut TxContext) {
        init(ctx);
    }

    // 向池子添加流动性
    public entry fun add_liquidity(
        pool: &mut SwapPool,
        jack_751_coin: Coin<JACK_751>,
        faucet_coin: Coin<JACK_751_FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        let jack_751_amount = coin::value(&jack_751_coin);
        let faucet_coin_amount = coin::value(&faucet_coin);
        
        assert!(jack_751_amount > 0 && faucet_coin_amount > 0, EZeroAmount);

        balance::join(&mut pool.jack_751_balance, coin::into_balance(jack_751_coin));
        balance::join(&mut pool.faucet_coin_balance, coin::into_balance(faucet_coin));

        event::emit(LiquidityEvent {
            user: tx_context::sender(ctx),
            jack_751_amount,
            faucet_coin_amount,
            action: b"add",
        });
    }

    // 将 JACK_751 交换为 JACK_751_FAUCET_COIN
    public entry fun swap_jack_751_to_faucet(
        pool: &mut SwapPool,
        jack_751_coin: Coin<JACK_751>,
        ctx: &mut TxContext
    ) {
        let jack_751_amount = coin::value(&jack_751_coin);
        assert!(jack_751_amount > 0, EZeroAmount);

        // 根据交换比例计算输出数量（为简单起见使用1:1）
        let faucet_coin_amount = (jack_751_amount * pool.swap_ratio) / 1000;
        assert!(balance::value(&pool.faucet_coin_balance) >= faucet_coin_amount, EInsufficientLiquidity);

        // 将输入代币添加到池中
        balance::join(&mut pool.jack_751_balance, coin::into_balance(jack_751_coin));

        // 从池中取出输出代币
        let faucet_coin_balance = balance::split(&mut pool.faucet_coin_balance, faucet_coin_amount);
        let faucet_coin = coin::from_balance(faucet_coin_balance, ctx);

        // 将输出代币转给发送者
        transfer::public_transfer(faucet_coin, tx_context::sender(ctx));

        event::emit(SwapEvent {
            user: tx_context::sender(ctx),
            jack_751_in: jack_751_amount,
            faucet_coin_in: 0,
            jack_751_out: 0,
            faucet_coin_out: faucet_coin_amount,
        });
    }

    // 将 JACK_751_FAUCET_COIN 交换为 JACK_751
    public entry fun swap_faucet_to_jack_751(
        pool: &mut SwapPool,
        faucet_coin: Coin<JACK_751_FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        let faucet_coin_amount = coin::value(&faucet_coin);
        assert!(faucet_coin_amount > 0, EZeroAmount);

        // 根据交换比例计算输出数量（为简单起见使用1:1）
        let jack_751_amount = (faucet_coin_amount * 1000) / pool.swap_ratio;
        assert!(balance::value(&pool.jack_751_balance) >= jack_751_amount, EInsufficientLiquidity);

        // 将输入代币添加到池中
        balance::join(&mut pool.faucet_coin_balance, coin::into_balance(faucet_coin));

        // 从池中取出输出代币
        let jack_751_balance = balance::split(&mut pool.jack_751_balance, jack_751_amount);
        let jack_751_coin = coin::from_balance(jack_751_balance, ctx);

        // 将输出代币转给发送者
        transfer::public_transfer(jack_751_coin, tx_context::sender(ctx));

        event::emit(SwapEvent {
            user: tx_context::sender(ctx),
            jack_751_in: 0,
            faucet_coin_in: faucet_coin_amount,
            jack_751_out: jack_751_amount,
            faucet_coin_out: 0,
        });
    }

    // 获取池子信息
    public fun get_pool_info(pool: &SwapPool): (u64, u64, u64) {
        (
            balance::value(&pool.jack_751_balance),
            balance::value(&pool.faucet_coin_balance),
            pool.swap_ratio
        )
    }

    // 更新交换比例（管理员功能）
    public entry fun update_swap_ratio(
        pool: &mut SwapPool,
        new_ratio: u64,
        _ctx: &mut TxContext
    ) {
        assert!(new_ratio > 0, EInvalidSwapRatio);
        pool.swap_ratio = new_ratio;
    }

    // 计算交换输出数量
    public fun calculate_swap_output(
        pool: &SwapPool,
        input_amount: u64,
        is_jack_751_to_faucet: bool
    ): u64 {
        if (is_jack_751_to_faucet) {
            (input_amount * pool.swap_ratio) / 1000
        } else {
            (input_amount * 1000) / pool.swap_ratio
        }
    }
}