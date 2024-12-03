#[allow(duplicate_alias)]
module swap::swap {

    use my_coin::yun::YUN;
    use my_coin_faucet::yunfaucet::YUNFAUCET;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    use sui::tx_context;

    const ValueSmall: u64 = 100;

    // 定义一个结构体 Pool，用于存储两种代币的余额
    public struct Pool has key, store {
        id: UID,
        coinA: Balance<YUN>,
        coinB: Balance<YUNFAUCET>,
    }

    // 初始化池子
    fun init(ctx: &mut TxContext) {
        let pool = Pool {
            id: object::new(ctx),
            coinA: balance::zero(),
            coinB: balance::zero(),
        };
        transfer::share_object(pool);
    }

    // 向池子中存储代币A
    public entry fun DepositA(pool: &mut Pool, coinA: &mut Coin<YUN>, amount: u64) {
        assert!(coin::value(coinA) >= amount, ValueSmall);
        let split_balance = balance::split(coin::balance_mut(coinA), amount);
        balance::join(&mut pool.coinA, split_balance);
    }

    // 向池子中存储代币B
    public entry fun DepositB(pool: &mut Pool, coinB: &mut Coin<YUNFAUCET>, amount: u64) {
        assert!(coin::value(coinB) >= amount, ValueSmall);
        let split_balance = balance::split(coin::balance_mut(coinB), amount);
        balance::join(&mut pool.coinB, split_balance);
    }

    // 在池子中将代币A交换为代币B
    public entry fun swap_A_to_B(pool: &mut Pool, coinA: &mut Coin<YUN>, amount: u64, ctx: &mut TxContext) {
        let coinA_store_value = balance::value(&pool.coinA);
        let coinB_store_value = balance::value(&pool.coinB);

        assert!(amount > 0 && coinB_store_value > 0 && coinA_store_value > 0, ValueSmall);
        //恒定乘积市场制造商（AMM）的核心机制利用，交换的越多，得到的比例就越小
        let coinB_swap_value = (amount * coinB_store_value) / (coinA_store_value + amount);
        assert!(coinB_swap_value > 0 && coinB_swap_value < coinB_store_value, ValueSmall);
        let split_balance = balance::split(coin::balance_mut(coinA), amount);
        balance::join(&mut pool.coinA, split_balance);
        let coin_b_out = coin::take(&mut pool.coinB, coinB_swap_value, ctx);
        transfer::public_transfer(coin_b_out, tx_context::sender(ctx));
    }

    // 在池子中将代币B交换为代币A
    public entry fun swap_B_to_A(pool: &mut Pool, coinB: &mut Coin<YUNFAUCET>, amount: u64, ctx: &mut TxContext) {
        let coinA_store_value = balance::value(&pool.coinA);
        let coinB_store_value = balance::value(&pool.coinB);

        assert!(amount > 0 && coinB_store_value > 0 && coinA_store_value > 0, ValueSmall);
        let coinA_swap_value = (amount * coinA_store_value) / (coinB_store_value + amount);
        assert!(coinA_swap_value > 0 && coinA_swap_value < coinA_store_value, ValueSmall);
        let split_balance = balance::split(coin::balance_mut(coinB), amount);
        balance::join(&mut pool.coinB, split_balance);
        let coin_a_out = coin::take(&mut pool.coinA, coinA_swap_value, ctx);
        transfer::public_transfer(coin_a_out, tx_context::sender(ctx));
    }
}