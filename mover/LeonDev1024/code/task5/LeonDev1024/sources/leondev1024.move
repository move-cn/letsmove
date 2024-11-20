/*
/// Module: leondev1024
module leondev1024::leondev1024;
swap 必须是 swap 自己发行的 task2 两个 Coin的互换，包名必须是自己的github id
task2铸造的my_coin和faucet_coin的swap，
*/
module leondev1024::leondev1024 {
    // 导入必要的模块
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::event;
    use std::string::{Self, String};

    // 导入自定义的代币模块
    use my_coin::leon_dev_1024_coin::LEON_DEV_1024_COIN;
    use faucet_coin::leon_dev_1024_faucet_coin::LEON_DEV_1024_FAUCET_COIN;

    // 定义错误码， 流动性不足，金额为零
    const E_INSUFFICIENT_LIQUIDITY: u64 = 0;
    const E_ZERO_AMOUNT: u64 = 1;

    // 流动性池结构体
    public struct Pool has key {
        id: UID,
        // 代币A的余额
        coin_a: Balance<LEON_DEV_1024_COIN>,
        // 代币B的余额
        coin_b: Balance<LEON_DEV_1024_FAUCET_COIN>,
    }

    // 添加流动性事件结构体
    public struct LiquidityEvent has copy, drop {
        provider: address,
        coin_a_amount: u64,
        coin_b_amount: u64,
        coin_a_type: String,
        coin_b_type: String,
        timestamp: u64,
    }

    // 交换事件结构体
    public struct SwapEvent has copy, drop {
        sender: address,
        coin_in_amount: u64,
        coin_out_amount: u64,
        coin_in_type: String,
        coin_out_type: String,
        timestamp: u64,
    }

    // 初始化函数，创建一个新的流动性池
    fun init(ctx: &mut TxContext) {
        let pool = Pool {
            id: object::new(ctx),
            coin_a: balance::zero(),
            coin_b: balance::zero(),
        };
        transfer::share_object(pool);
    }

    // 添加流动性函数
    public entry fun add_liquidity(
        pool: &mut Pool,
        coin_a: Coin<LEON_DEV_1024_COIN>,
        coin_b: Coin<LEON_DEV_1024_FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        let a_amount = coin::value(&coin_a);
        let b_amount = coin::value(&coin_b);

        // 确保提供的代币数量大于零
        assert!(a_amount > 0 && b_amount > 0, E_ZERO_AMOUNT);

        balance::join(&mut pool.coin_a, coin::into_balance(coin_a));
        balance::join(&mut pool.coin_b, coin::into_balance(coin_b));

        // 记录添加流动性的事件
        event::emit(LiquidityEvent
            {
                provider: tx_context::sender(ctx),
                coin_a_amount: a_amount,
                coin_b_amount: b_amount,
                coin_a_type: string::utf8(b"LEON_DEV_1024_COIN"),
                coin_b_type: string::utf8(b"LEON_DEV_1024_FAUCET_COIN"),
                timestamp: tx_context::epoch(ctx),
            })
    }

    // 代币A换代币B的函数
    public entry fun swap_a_to_b(pool: &mut Pool, coin_a_in: Coin<LEON_DEV_1024_COIN>, ctx: &mut TxContext) {
        let a_amount = coin::value(&coin_a_in);
        assert!(a_amount > 0, E_ZERO_AMOUNT);

        let b_reserve = balance::value(&pool.coin_b);
        assert!(b_reserve > 0, E_INSUFFICIENT_LIQUIDITY);

        let a_reserve = balance::value(&pool.coin_a);
        let b_out = (a_amount * b_reserve) / (a_reserve + a_amount);

        assert!(b_out > 0 && b_out <= b_reserve, E_INSUFFICIENT_LIQUIDITY);

        // change
        balance::join(&mut pool.coin_a, coin::into_balance(coin_a_in));
        let coin_b_out = coin::take(&mut pool.coin_b, b_out, ctx);
        transfer::public_transfer(coin_b_out, tx_context::sender(ctx));

        event::emit(SwapEvent {
            sender: tx_context::sender(ctx),
            coin_in_amount: a_amount,
            coin_out_amount: b_out,
            coin_in_type: string::utf8(b"LEON_DEV_1024_COIN"),
            coin_out_type: string::utf8(b"LEON_DEV_1024_FAUCET_COIN"),
            timestamp: tx_context::epoch(ctx),
        });
    }

    // 代币B LEON_DEV_1024_FAUCET_COIN 换代币A LEON_DEV_1024_COIN的函数
    public entry fun swap_b_to_a(pool: &mut Pool, coin_b_in: Coin<LEON_DEV_1024_FAUCET_COIN>,
                                 ctx: &mut TxContext) {
        let b_amount = coin::value(&coin_b_in);
        // 确保输入的代币数量大于零
        assert!(b_amount > 0, E_ZERO_AMOUNT);

        let a_reserve = balance::value(&pool.coin_a);
        // 确保可以换取的代币A数量有效
        assert!(a_reserve > 0, E_INSUFFICIENT_LIQUIDITY);

        let b_reserve = balance::value(&pool.coin_b);
        let a_out = (b_amount * a_reserve) / (b_reserve + b_amount);

        assert!(a_out > 0 && a_out <= a_reserve, E_INSUFFICIENT_LIQUIDITY);

        // 更新流动性池的余额
        balance::join(&mut pool.coin_b, coin::into_balance(coin_b_in));
        let coin_a_out = coin::take(&mut pool.coin_a, a_out, ctx);
        transfer::public_transfer(coin_a_out, tx_context::sender(ctx));

        event::emit(SwapEvent {
            sender: tx_context::sender(ctx),
            coin_in_amount: b_amount,
            coin_out_amount: a_out,
            coin_in_type: string::utf8(b"LEON_DEV_1024_FAUCET_COIN"),
            coin_out_type: string::utf8(b"LEON_DEV_1024_COIN"),
            timestamp: tx_context::epoch(ctx),
        });
    }
}



