module task5::task5 {
    use faucet_coin::faucet_coin::{FAUCET_COIN};
    use mycoin::mycoin::{MYCOIN};
    use sui::balance::{Self,Balance, zero};
    use sui::object::{Self, UID};
    use sui::transfer::{ transfer, share_object, public_transfer };
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin};
    use sui::event;
    use std::string::{Self, String};


    public struct LiquidityEvent has copy, drop {
    provider: address, 
    coin_a_amount: u64, 
    coin_b_amount: u64, 
    coin_a_type: String, 
    coin_b_type: String, 
    timestamp: u64, 
}


        // 流动性池结构体
public struct Pool has key {
        id: UID,
        // 代币A的余额
        coin_a: Balance<FAUCET_COIN>,
        // 代币B的余额
        coin_b: Balance<MYCOIN>,
    }
    fun init(ctx: &mut TxContext) {
    let pool = Pool {
        id: object::new(ctx), 
        coin_a: balance::zero(), 
        coin_b: balance::zero(), 
    };
    transfer::share_object(pool); 
}
    public entry fun add_liquidity( pool: &mut Pool, coin_a: Coin<FAUCET_COIN>,coin_b:Coin<MYCOIN>,ctx: &mut TxContext){
        let a_amount = coin::value(&coin_a);
        let b_amount = coin::value(&coin_b);
        balance::join(&mut pool.coin_a, coin::into_balance(coin_a));
        balance::join(&mut pool.coin_b, coin::into_balance(coin_b));

        event::emit(LiquidityEvent
        {
            provider:tx_context::sender(ctx),
            coin_a_amount: a_amount,
            coin_b_amount: b_amount,
            coin_a_type: string::utf8(b"SY711_FAUCET"),
            coin_b_type: string::utf8(b"SY711Coin"),
            timestamp: tx_context::epoch(ctx),
        })
    }
// 代币A换代币B的函数
public entry fun swap_a_to_b(
    pool: &mut Pool,
    coin_a_in: Coin<FAUCET_COIN>,
    ctx: &mut TxContext
) {
 let amount = coin::value(&coin_a_in);
        balance::join(&mut pool.coin_a, coin::into_balance(coin_a_in));

        let amount_end = amount * 2;
        let coin_b_balance = balance::split(&mut pool.coin_b, amount_end);
        let movebcoin = coin::from_balance(coin_b_balance, ctx);
        public_transfer(movebcoin, ctx.sender());
}

// 代币B换代币A的函数
public entry fun swap_b_to_a(
    pool: &mut Pool,
    coin_b_in: Coin<MYCOIN>,
    ctx: &mut TxContext
) {
    let amount = coin::value(&coin_b_in);
        balance::join(&mut pool.coin_b, coin::into_balance(coin_b_in));

        let amount_end = amount * 2;
        let coin_a_balance = balance::split(&mut pool.coin_a, amount_end);
        let moveacoin = coin::from_balance(coin_a_balance, ctx);
        public_transfer(moveacoin, ctx.sender());

}



}