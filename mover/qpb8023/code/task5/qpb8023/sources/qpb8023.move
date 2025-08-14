module qpb8023::qpb8023 {
    use sui::coin;
    use sui::balance;

    const WrongAmount:u64 = 0;

    public struct PoolInfo<phantom A,phantom B> has key,store{
        id: UID,
        token1: balance::Balance<A>,
        token2: balance::Balance<B>,
    }

    public entry fun init_pool<A,B>(token1: coin::Coin<A>,token2: coin::Coin<B>, ctx: &mut TxContext) {
        let b1 = coin::into_balance(token1);
        let b2 = coin::into_balance(token2);

        let pool = PoolInfo {
            id: object::new(ctx),
            token1: b1,
            token2: b2,
        };

        transfer::share_object(pool);
    }
    
    public entry fun add_liquty<A,B>(pool: &mut PoolInfo<A, B>, token1: coin::Coin<A>, token2: coin::Coin<B>, _: &mut TxContext) {
        let balance_a = coin::into_balance<A>(token1);
        let balance_b = coin::into_balance<B>(token2);
    
        balance::join<A>(&mut pool.token1, balance_a);
        balance::join<B>(&mut pool.token2, balance_b);
    }

    public entry fun remove_liquty<A,B>(pool: &mut PoolInfo<A, B>, token1: u64, token2: u64, ctx: &mut TxContext) {
       let token1_balance = pool.token1.split(token1);
       let token2_balance = pool.token2.split(token2);
       let send_token1 = coin::from_balance(token1_balance,ctx);
       let send_token2 = coin::from_balance(token2_balance,ctx);
       transfer::public_transfer(send_token1,tx_context::sender(ctx));
       transfer::public_transfer(send_token2,tx_context::sender(ctx));
    }

    public entry fun AtoB<A,B>(pool: &mut PoolInfo<A, B>, token1: coin::Coin<A>,ctx: &mut TxContext) {
        assert!(coin::value(&token1) > 0,WrongAmount);
        let value = coin::value(&token1);
        balance::join(&mut pool.token1, coin::into_balance(token1));
        
        let join_balance = pool.token2.split(value);
        let send_coin = coin::from_balance(join_balance,ctx);
        transfer::public_transfer(send_coin,tx_context::sender(ctx));
    }

    public entry fun BtoA<A,B>(pool: &mut PoolInfo<A, B>, token2: coin::Coin<B>,ctx: &mut TxContext) {
        assert!(coin::value(&token2) > 0,WrongAmount);
        let value = coin::value(&token2);
        balance::join(&mut pool.token2, coin::into_balance(token2));
        
        let join_balance = pool.token1.split(value);
        let send_coin = coin::from_balance(join_balance,ctx);
        transfer::public_transfer(send_coin,tx_context::sender(ctx));
    }


    

    

}

