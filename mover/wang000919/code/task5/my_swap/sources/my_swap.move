/*
/// Module: my_swap
module my_swap::my_swap;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module my_swap::my_swap{
    use my_coin::wang000919_coin::WANG000919_COIN;
    use my_coin::wang000919_faucet_coin::WANG000919_FAUCET_COIN;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin, from_balance, into_balance};
    use sui::transfer::{share_object, transfer, public_transfer};

    const EInputNotEnough: u64 = 1000;
    const EPoolNotEnough: u64 = 1001;
    public struct AdminCap has key {
        id: UID
    }
    public struct Pool has key {
        id: UID,
        wang000919_faucet_coin: Balance<WANG000919_FAUCET_COIN>,
        wang000919_coin: Balance<WANG000919_COIN>,
    }
    fun init(ctx: &mut TxContext){
        let pool = Pool {
            id: object::new(ctx),
            wang000919_faucet_coin: balance::zero<WANG000919_FAUCET_COIN>(),
            wang000919_coin: balance::zero<WANG000919_COIN>()
        };
        let admin = AdminCap {id: object::new(ctx)};
        share_object(pool);
        transfer(admin, ctx.sender());
    }

    public entry fun deposit_my_coin(
        pool: &mut Pool,
        user_coin: Coin<WANG000919_COIN>,
        amount: u64,
        ctx: &mut TxContext
    ){
        let coin_value = user_coin.value();
        // 检查是否有足够余额支持存入
        assert!(coin_value >= amount, EInputNotEnough);
        let mut input_balance = into_balance(user_coin);
        if(coin_value == amount){
            balance::join(&mut pool.wang000919_coin, input_balance);
        }else {
            balance::join(
                &mut pool.wang000919_coin,
                balance::split(&mut input_balance, amount),
            );
            let surplus_coin = from_balance(input_balance, ctx);
            public_transfer(surplus_coin, ctx.sender());
        };
    }
    public entry fun deposit_faucet_coin(
        pool: &mut Pool,
        user_coin: Coin<WANG000919_FAUCET_COIN>,
        amount: u64,
        ctx: &mut TxContext
    ){
        let coin_value = user_coin.value();
        // 检查是否有足够余额支持存入
        assert!(coin_value >= amount, EInputNotEnough);
        let mut input_balance = into_balance(user_coin);
        if(coin_value == amount){
            balance::join(&mut pool.wang000919_faucet_coin, input_balance);
        }else {
            balance::join(
                &mut pool.wang000919_faucet_coin,
                balance::split(&mut input_balance, amount),
            );
            let surplus_coin = from_balance(input_balance, ctx);
            public_transfer(surplus_coin, ctx.sender());
        };
    }
    public entry fun withdraw_coin(
        _: &AdminCap,
        pool: &mut Pool,
        amount: u64,
        ctx: &mut TxContext
    ){
        assert!(pool.wang000919_coin.value() >= amount, EPoolNotEnough);
        let withdrawn_balance = balance::split(&mut pool.wang000919_coin, amount);
        let withdrawn_coin = from_balance(withdrawn_balance, ctx);
        public_transfer(withdrawn_coin, ctx.sender());
    }

    public entry fun withdraw_faucet_coin(
        _: &AdminCap,
        pool: &mut Pool,
        amount: u64,
        ctx: &mut TxContext
    ){
        assert!(pool.wang000919_faucet_coin.value() >= amount, EPoolNotEnough);
        let withdrawn_balance = balance::split(&mut pool.wang000919_faucet_coin, amount);
        let withdrawn_coin = from_balance(withdrawn_balance, ctx);
        public_transfer(withdrawn_coin, ctx.sender());
    }

    public entry fun swap_faucet_coin_to_my_coin(
        pool: &mut Pool,
        user_coin: Coin<WANG000919_FAUCET_COIN>,
        amount: u64,
        ctx: &mut TxContext       
    ){
        let output_value = amount * 1000 / 2000;
        assert!(pool.wang000919_coin.value() >= output_value, EPoolNotEnough);
        deposit_faucet_coin(pool, user_coin, amount, ctx);
        let output_balance = balance::split(&mut pool.wang000919_coin, output_value);
        let output_coin = from_balance(output_balance, ctx);
        public_transfer(output_coin, ctx.sender());
    }

    public entry fun swap_my_coin_to_faucet_coin(
        pool: &mut Pool,
        user_coin: Coin<WANG000919_COIN>,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        let output_value = amount * 2000 / 1000;
        assert!(pool.wang000919_faucet_coin.value() >= output_value, EPoolNotEnough);

        deposit_my_coin(pool, user_coin, amount, ctx);

        let output_balance = balance::split(&mut pool.wang000919_faucet_coin, output_value);
        let output = from_balance(output_balance, ctx);
        public_transfer(output, ctx.sender());
    }
}