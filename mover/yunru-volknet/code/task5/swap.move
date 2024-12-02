
module swap::swap {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::event;
    use std::string::{Self, String};

    use faucet_coin::faucet_coin::FAUCET_COIN;
    use my_coin::my_coin::MY_COIN;
    
    const E_INSUFFICIENT_LIQUIDITY: u64 = 0;
    const E_ZERO_AMOUNT: u64 = 1;

    public struct Pool has key {
        id: UID, 
        coin_a: Balance<MY_COIN>, 
        coin_b: Balance<FAUCET_COIN>, 
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
        coin_a: Coin<MY_COIN>,
        coin_b: Coin<FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        let a_amount = coin::value(&coin_a); 
        let b_amount = coin::value(&coin_b); 

        assert!(a_amount > 0 && b_amount > 0, E_ZERO_AMOUNT); 

        balance::join(&mut pool.coin_a, coin::into_balance(coin_a)); 
        balance::join(&mut pool.coin_b, coin::into_balance(coin_b)); 

    }

    // 代币A换代币B的函数
    public entry fun swap_A_to_B(
        pool: &mut Pool,
        coin_a_in: Coin<MY_COIN>,
        ctx: &mut TxContext
    ) {
        let a_amount = coin::value(&coin_a_in); 
        assert!(a_amount > 0, E_ZERO_AMOUNT); 

        let b_reserve = balance::value(&pool.coin_b); 
        assert!(b_reserve > 0, E_INSUFFICIENT_LIQUIDITY); 

        let a_reserve = balance::value(&pool.coin_a); 
        let b_out = (a_amount * b_reserve) / (a_reserve + a_amount); 

        assert!(b_out > 0 && b_out <= b_reserve, E_INSUFFICIENT_LIQUIDITY); 

        // 更新流动性池的余额
        balance::join(&mut pool.coin_a, coin::into_balance(coin_a_in)); 
        let coin_b_out = coin::take(&mut pool.coin_b, b_out, ctx); 
        transfer::public_transfer(coin_b_out, tx_context::sender(ctx)); 

    }

        // 代币B换代币A的函数
    public entry fun swap_B_to_A(
        pool: &mut Pool,
        coin_b_in: Coin<FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        let b_amount = coin::value(&coin_b_in); 
        assert!(b_amount > 0, E_ZERO_AMOUNT); 

        let a_reserve = balance::value(&pool.coin_a); 
        assert!(a_reserve > 0, E_INSUFFICIENT_LIQUIDITY); 

        let b_reserve = balance::value(&pool.coin_b); 
        let a_out = (b_amount * a_reserve) / (b_reserve + b_amount); 

        assert!(a_out > 0 && a_out <= a_reserve, E_INSUFFICIENT_LIQUIDITY); 

        // 更新流动性池的余额
        balance::join(&mut pool.coin_b, coin::into_balance(coin_b_in)); 
        let coin_a_out = coin::take(&mut pool.coin_a, a_out, ctx); 
        transfer::public_transfer(coin_a_out, tx_context::sender(ctx)); 
    }
}