/*
/// Module: swap
module swap::swap;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module swap::swap {
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::event;
    use std::string::{Self, String};

    // 导入自定义的代币模块
    use mycoin::mycoin::MYCOIN;
    use faucet_coin::faucet_coin::FAUCET_COIN;
    const E_INSUFFICIENT_LIQUIDITY: u64 = 0;
    const E_ZERO_AMOUNT: u64 = 1;

    //流动性池结构体
    public struct Pool has key {
        id: UID,
        coin_a: Balance<MYCOIN>, //代币A的余额
        coin_b: Balance<FAUCET_COIN> //代币B的余额
    }
    //添加流动性事件结构体
    public struct LiquidityEvent has copy,drop {
        provider:address,//提供流动性的地址
        coin_a_amount:u64,//代币A的数量
        coin_b_amount:u64,//代币B的数量
        coin_a_type:String,
        coin_b_type:String,
        timestamp:u64,//时间戳
    }
    //交换事件结构体
    public struct SwapEvent has copy,drop {
        sender:address,//发起交换的地址
        coin_in_amount:u64,//输入代币的数量
        coin_out_amount:u64,//输出代币的数量
        coin_in_type:String,//输入代币的类型
        coin_out_type:String,//输出代币的类型
        timestamp:u64,//时间戳
    }
    fun init(ctx: &mut TxContext) {
        let pool = Pool{
            id: object::new(ctx),
            coin_a:balance::zero<MYCOIN>(),
            coin_b:balance::zero<FAUCET_COIN>(),
        };
        transfer::share_object(pool);
    }
    //添加流动性函数
    public entry fun add_liquidity(
        pool: &mut Pool,
        coin_a: Coin<MYCOIN>,
        coin_b: Coin<FAUCET_COIN>,
        ctx: &mut TxContext
    ){
        let a_amount = coin::value(&coin_a);//获取代币A的数量
        let b_amount = coin::value(&coin_b);//获取代币B的数量
        assert!(a_amount > 0 && b_amount > 0,E_ZERO_AMOUNT);
        balance::join(&mut pool.coin_a,coin::into_balance(coin_a));
        balance::join(&mut pool.coin_b,coin::into_balance(coin_b));
        //记录添加流动性的事件
        event::emit(LiquidityEvent{
           provider: ctx.sender(),
            coin_a_amount:a_amount,
            coin_b_amount:b_amount,
            coin_a_type:string::utf8(b"mycoin"),
            coin_b_type:string::utf8(b"faucet_coin"),
            timestamp: tx_context::epoch(ctx),
        });
    }
    //代币A换代币B的函数
    public entry fun swap_a_to_b(
        pool: &mut Pool,
        coin_a_in: Coin<MYCOIN>,
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
            coin_in_type: string::utf8(b"MYCOIN"), // 输入的代币A的类型
            coin_out_type: string::utf8(b"faucet_coin"), // 输出的代币B的类型
            timestamp: tx_context::epoch(ctx), // 当前时间戳
        });
    }
    //代币B换代币A的函数
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
        let a_out = (b_amount * a_reserve) / (b_reserve + b_amount); // 计算可以换取的代币A的数量
        assert!(a_out > 0 && a_out <= b_reserve, E_INSUFFICIENT_LIQUIDITY); // 确保可以换取的代币A数量有效

        // 更新流动性池的余额
        balance::join(&mut pool.coin_b, coin::into_balance(coin_b_in)); // 将输入的代币B加入流动性池
        let coin_a_out = coin::take(&mut pool.coin_a, a_out, ctx); // 从流动性池中取出代币A
        transfer::public_transfer(coin_a_out, tx_context::sender(ctx)); // 将代币A转给发起者

        // 记录交换事件
        event::emit(SwapEvent {
            sender: tx_context::sender(ctx), // 发起交换的地址
            coin_in_amount: b_amount, // 输入的代币的数量
            coin_out_amount: a_out, // 输出的代币的数量
            coin_in_type: string::utf8(b"FAUCET_COIN"), // 输入的代币的类型
            coin_out_type: string::utf8(b"MYCOIN"), // 输出的代币的类型
            timestamp: tx_context::epoch(ctx), // 当前时间戳
        });
    }

}