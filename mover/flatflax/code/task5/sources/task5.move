/*
/// Module: task5
module task5::task5;
*/
module task5::swap {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::event;
    use std::string::{Self, String};

    use mycoin::my_coin::MY_COIN;
    use faucet_coin::faucet_coin::FAUCET_COIN;

    const E_INSUFFICIENT_LIQUIDITY: u64 = 0;
    const E_ZERO_AMOUNT: u64 = 1;

    public struct Pool has key {
        id: UID,
        // 代币A的余额
        coin_a: Balance<MY_COIN>,
        // 代币B的余额
        coin_b: Balance<FAUCET_COIN>,
    }

    public struct LiquidityEvent has copy, drop {
        provider: address, // 提供流动性的地址
        coin_a_amount: u64, // 代币A的数量
        coin_b_amount: u64, // 代币B的数量
        coin_a_type: String, // 代币A的类型
        coin_b_type: String, // 代币B的类型
        timestamp: u64, // 时间戳
    }

    public struct SwapEvent has copy, drop {
        sender: address, // 发起交换的地址
        coin_in_amount: u64, // 输入代币的数量
        coin_out_amount: u64, // 输出代币的数量
        coin_in_type: String, // 输入代币的类型
        coin_out_type: String, // 输出代币的类型
        timestamp: u64, // 时间戳
    }

    fun init(ctx: &mut TxContext) {
        let pool = Pool {
            id: object::new(ctx), // 生成新的唯一标识符
            coin_a: balance::zero(), // 初始代币A的余额为零
            coin_b: balance::zero(), // 初始代币B的余额为零
        };
        transfer::share_object(pool); // 将流动性池共享
    }

    public entry fun add_liquidity(
        pool: &mut Pool,
        coin_a: Coin<MY_COIN>,
        coin_b: Coin<FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        let a_amount = coin::value(&coin_a); // 获取代币A的数量
        let b_amount = coin::value(&coin_b); // 获取代币B的数量

        assert!(a_amount > 0 && b_amount > 0, E_ZERO_AMOUNT); // 确保提供的代币数量大于零

        balance::join(&mut pool.coin_a, coin::into_balance(coin_a)); // 将代币A加入流动性池
        balance::join(&mut pool.coin_b, coin::into_balance(coin_b)); // 将代币B加入流动性池

        // 记录添加流动性的事件
        event::emit(LiquidityEvent {
            provider: tx_context::sender(ctx), // 提供流动性的地址
            coin_a_amount: a_amount, // 代币A的数量
            coin_b_amount: b_amount, // 代币B的数量
            coin_a_type: string::utf8(b"MY_COIN"), // 代币A的类型
            coin_b_type: string::utf8(b"FAUCET_COIN"), // 代币B的类型
            timestamp: tx_context::epoch(ctx), // 当前时间戳
        });
    }

    public entry fun swap_a_to_b(
        pool: &mut Pool,
        coin_a_in: Coin<MY_COIN>,
        ctx: &mut TxContext
    ) {
        let a_amount = coin::value(&coin_a_in); // 获取输入的代币A的数量
        assert!(a_amount > 0, E_ZERO_AMOUNT); // 确保输入的代币数量大于零

        let b_reserve = balance::value(&pool.coin_b); // 获取代币B的储备量
        assert!(b_reserve > 0, E_INSUFFICIENT_LIQUIDITY); // 确保代币B的储备量大于零

        let a_reserve = balance::value(&pool.coin_a); // 获取代币A的储备量
        let b_out = (a_amount * b_reserve) / (a_reserve + a_amount); // 计算可以换取的代币B的数量

        assert!(b_out > 0 && b_out <= b_reserve, E_INSUFFICIENT_LIQUIDITY); // 确保可以换取的代币B数量有效

        // 更新流动性池的余额
        balance::join(&mut pool.coin_a, coin::into_balance(coin_a_in)); // 将输入的代币A加入流动性池
        let coin_b_out = coin::take(&mut pool.coin_b, b_out, ctx); // 从流动性池中取出代币B
        transfer::public_transfer(coin_b_out, tx_context::sender(ctx)); // 将代币B转给发起者

        // 记录交换事件
        event::emit(SwapEvent {
            sender: tx_context::sender(ctx), // 发起交换的地址
            coin_in_amount: a_amount, // 输入的代币A的数量
            coin_out_amount: b_out, // 输出的代币B的数量
            coin_in_type: string::utf8(b"MY_COIN"), // 输入的代币A的类型
            coin_out_type: string::utf8(b"FAUCET_COIN"), // 输出的代币B的类型
            timestamp: tx_context::epoch(ctx), // 当前时间戳
        });
    }

    public entry fun swap_b_to_a(
        pool: &mut Pool,
        coin_b_in: Coin<FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        let b_amount = coin::value(&coin_b_in); // 获取输入的代币B的数量
        assert!(b_amount > 0, E_ZERO_AMOUNT); // 确保输入的代币数量大于零

        let a_reserve = balance::value(&pool.coin_a); // 获取代币A的储备量
        assert!(a_reserve > 0, E_INSUFFICIENT_LIQUIDITY); // 确保代币A的储备量大于零

        let b_reserve = balance::value(&pool.coin_b); // 获取代币B的储备量
        let a_out = (b_amount * a_reserve) / (b_reserve + b_amount); // 计算可以换取的代币B的数量

        assert!(a_out > 0 && a_out <= a_reserve, E_INSUFFICIENT_LIQUIDITY); // 确保可以换取的代币B数量有效

        // 更新流动性池的余额
        balance::join(&mut pool.coin_b, coin::into_balance(coin_b_in)); // 将输入的代币A加入流动性池
        let coin_a_out = coin::take(&mut pool.coin_a, a_out, ctx); // 从流动性池中取出代币A
        transfer::public_transfer(coin_a_out, tx_context::sender(ctx)); // 将代币A转给发起者

        // 记录交换事件
        event::emit(SwapEvent {
            sender: tx_context::sender(ctx), // 发起交换的地址
            coin_in_amount: b_amount, // 输入的代币B的数量
            coin_out_amount: a_out, // 输出的代币A的数量
            coin_in_type: string::utf8(b"FAUCET_COIN"), // 输入的代币B的类型
            coin_out_type: string::utf8(b"MY_COIN"), // 输出的代币A的类型
            timestamp: tx_context::epoch(ctx), // 当前时间戳
        });
    }
}