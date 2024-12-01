#[allow(unused_use, duplicate_alias)]
module z0yuan::my_swap{
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::balance::{Self, Balance};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    use coin::my_coin::{MY_COIN};
    use faucet::mycoin::{MYCOIN};

    const ValueSmall: u64 =  100;

    public struct Pool has key,store {
        id: UID,
        coinA: Balance<MY_COIN>,
        coinB: Balance<MYCOIN>,
    }
    //初始化函数
    fun init(ctx: &mut TxContext) {
        let pool = Pool {
            id: object::new(ctx),
            coinA: balance::zero(),
            coinB: balance::zero(),
        };
        transfer::share_object(pool);
    }
    //存储A代币
    public entry fun DepositA(pool: &mut Pool,coinA: &mut Coin<MY_COIN>,amount: u64){
        assert!(coin::value(coinA) >= amount,ValueSmall);

        let split_balance = balance::split(coin::balance_mut(coinA), amount);

        balance::join(&mut pool.coinA, split_balance);
    }
    //存储B代币
    public entry fun DepositB(pool: &mut Pool,coinB: &mut Coin<MYCOIN>,amount: u64){
        assert!(coin::value(coinB) >= amount,ValueSmall);

        let split_balance = balance::split(coin::balance_mut(coinB),amount);

        balance::join(&mut pool.coinB, split_balance);
    }
    //交换代币 A换B
    public entry fun swap_A_to_B(pool: &mut Pool,coinA: &mut Coin<MY_COIN>,amount: u64,ctx: &mut TxContext){
        //池子中储存的的A和B代币的量
        let coinB_store_value = balance::value(&pool.coinB);
        let coinA_store_value = balance::value(&pool.coinA);

        assert!(amount > 0 && coinB_store_value > 0 && coinA_store_value > 0, ValueSmall);

        //计算A能转换多少B
        let coinB_swap_value = (amount * coinB_store_value) / (coinA_store_value + amount);
        assert!(coinB_swap_value > 0 && coinB_swap_value < coinB_store_value,ValueSmall);

        //更新池子
        let split_balance = balance::split(coin::balance_mut(coinA), amount);
        balance::join(&mut pool.coinA, split_balance);

        let coin_b_out = coin::take(&mut pool.coinB, coinB_swap_value, ctx);
        transfer::public_transfer(coin_b_out, tx_context::sender(ctx));
    }
    //交换代币 B换A
    public entry fun swap_B_to_A(pool: &mut Pool,coinB: &mut Coin<MYCOIN>,amount: u64,ctx: &mut TxContext){
        //池子中储存的的A和B代币的量
        let coinB_store_value = balance::value(&pool.coinB);
        let coinA_store_value = balance::value(&pool.coinA);

        assert!(amount > 0 && coinB_store_value > 0 && coinA_store_value > 0, ValueSmall);

        //计算B能转换多少A
        let coinA_swap_value = (amount * coinA_store_value) / (coinB_store_value + amount);
        assert!(coinA_swap_value > 0 && coinA_swap_value < coinA_store_value,ValueSmall);

        //更新池子
        let split_balance = balance::split(coin::balance_mut(coinB), amount);
        balance::join(&mut pool.coinB, split_balance);

        let coin_A_out = coin::take(&mut pool.coinA, coinA_swap_value, ctx);
        transfer::public_transfer(coin_A_out, tx_context::sender(ctx));
    }
}