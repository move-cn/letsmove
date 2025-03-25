/*
/// Module: a1linlin1_swap
module a1linlin1_swap::a1linlin1_swap;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module a1linlin1_swap::a1linlin1_swap {
    use sui::object::{Self, UID};
    use sui::transfer::{share_object, public_transfer};
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin, into_balance, from_balance};
    use sui::balance::{Self, Balance, zero, join, split};
    use sui::event;
    use std::string::{Self, String};
    use my_coin::A1LinLin1_coin::A1LINLIN1_COIN;
    use faucet_coin::A1LinLin1_faucet_coin::A1LINLIN1_FAUCET_COIN;


    /// 定义一个简单的池（Pool），存储两个代币的余额
    public struct Pool has key {
        id: UID,
        balance_a: Balance<A1LINLIN1_COIN>,
        balance_b: Balance<A1LINLIN1_FAUCET_COIN>,
    }

    /// 初始化池
    fun init( //初始化方法只能这么写
        // initial_a: Balance<A1LINLIN1_COIN>,
        // initial_b: Balance<A1LINLIN1_FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        let pool = Pool {
            id: object::new(ctx),
            balance_a: zero(),
            balance_b: zero(),
        };
        share_object(pool);
    }

    public fun addLiquidityAC(
        pool: &mut Pool,
        coin_a: Coin<A1LINLIN1_COIN>,
        //coin_b: Coin<A1LINLIN1_FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        let value_a = into_balance(coin_a); //
        //let value_b = into_balance(coin_b);
        join(&mut pool.balance_a, value_a);
        //join(&mut pool.balance_b, value_b);
        
    }
    public fun addLiquidityAFC(
        pool: &mut Pool,
        //coin_a: Coin<A1LINLIN1_COIN>,
        coin_b: Coin<A1LINLIN1_FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        //let value_a = into_balance(coin_a); //
        let value_b = into_balance(coin_b);
        join(&mut pool.balance_b, value_b);
        //join(&mut pool.balance_a, value_a);
        
    }

    /// 代币 A 换代币 B (1:1)
    public fun swap_a_for_b(
        pool: &mut Pool,
        input_a: Coin<A1LINLIN1_COIN>,
        ctx: &mut TxContext
    ) {
        let value = input_a.value(); // 获取代币 A 的数量
        let output_b = split(&mut pool.balance_b, value); // 从池中提取等量的 B
        join(&mut pool.balance_a, into_balance(input_a)); // 将代币 A 加入池中
        let coin_b = from_balance(output_b, ctx);
        public_transfer(coin_b, ctx.sender());
        //output_b // 返回用户获得的代币 B
    }

    /// 代币 B 换代币 A (1:1)
    public fun swap_b_for_a(
        pool: &mut Pool,
        input_b: Coin<A1LINLIN1_FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        let value = input_b.value(); // 获取代币 B 的数量
        let output_a = split(&mut pool.balance_a, value); // 从池中提取等量的 A
        join(&mut pool.balance_b, into_balance(input_b)); // 将代币 B 加入池中
        let coin_a = from_balance(output_a, ctx);
        public_transfer(coin_a, ctx.sender());
        //output_a // 返回用户获得的代币 A
    }


}
