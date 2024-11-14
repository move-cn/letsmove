module funnyyanne::swap{
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::event;
    use std::string::{Self, String};

    use my_coin::funnyyanne_coin::FUNNYYANNE_COIN;
    use faucet_coin::funnyyanne_faucet_coin::FUNNYYANNE_FAUCET_COIN;

    //error code
    const E_INSUFFICIENT_LIQUIDITY: u64 = 0;
    const E_ZERO_AMOUNT:u64 = 1;

    public struct Pool has key{
        id:UID,
        coin_a:Balance<FUNNYYANNE_COIN>,
        coin_b:Balance<FUNNYYANNE_FAUCET_COIN>,
    }

    public struct LiquidityEvent has copy,drop{
        provider: address,
        coin_a_amount: u64,
        coin_b_amount: u64,
        coin_a_type: String,     
        coin_b_type: String,     
        timestamp: u64,        
    }
   public struct SwapEvent has copy,drop{
        sender:address,
       coin_in_amount: u64,
       coin_out_amount: u64,
       coin_in_type:String,
       coin_out_type:String,
    timestamp: u64,
    }

    fun init(ctx: &mut TxContext){
        let pool = Pool{
            id:object::new(ctx),
            coin_a: balance::zero(),
            coin_b: balance::zero(),
        };
        transfer::share_object(pool);
    }

    public entry fun add_liquidity( pool: &mut Pool, coin_a: Coin<FUNNYYANNE_COIN>,coin_b:Coin<FUNNYYANNE_FAUCET_COIN>,ctx: &mut TxContext){
        let a_amount = coin::value(&coin_a);
        let b_amount = coin::value(&coin_b);

        assert!(a_amount > 0 && b_amount > 0,E_ZERO_AMOUNT);

        balance::join(&mut pool.coin_a, coin::into_balance(coin_a));
        balance::join(&mut pool.coin_b, coin::into_balance(coin_b));

        event::emit(LiquidityEvent
        {
            provider:tx_context::sender(ctx),
            coin_a_amount: a_amount,
            coin_b_amount: b_amount,
            coin_a_type: string::utf8(b"FUNNYYANNE_COIN"),
            coin_b_type: string::utf8(b"FUNNYYANNE_FAUCET_COIN"),
            timestamp: tx_context::epoch(ctx),
        })
    }

    //A -> B
    public entry fun swap_a_to_b( pool: &mut Pool, coin_a_in:Coin<FUNNYYANNE_COIN>,ctx: &mut TxContext){
        let a_amount = coin::value(&coin_a_in);
        assert!(a_amount > 0,E_ZERO_AMOUNT);

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
            coin_in_type: string::utf8(b"FUNNYYANNE_COIN"),
            coin_out_type: string::utf8(b"FUNNYYANNE_FAUCET_COIN"),
            timestamp: tx_context::epoch(ctx), 
        });
    }

    //B -> A
    public entry fun swap_b_to_a(pool: &mut Pool, coin_b_in: Coin<FUNNYYANNE_FAUCET_COIN>,
        ctx: &mut TxContext){
        let b_amount = coin::value(&coin_b_in);
        assert!(b_amount > 0, E_ZERO_AMOUNT);

        let a_reserve = balance::value(&pool.coin_a);
        assert!(a_reserve > 0, E_INSUFFICIENT_LIQUIDITY);

        let b_reserve = balance::value(&pool.coin_b);
        let a_out = (b_amount * a_reserve) / (b_reserve + b_amount);

        assert!(a_out > 0 && a_out <= a_reserve, E_INSUFFICIENT_LIQUIDITY);

        //change
        balance::join(&mut pool.coin_b, coin::into_balance(coin_b_in));
        let coin_a_out = coin::take(&mut pool.coin_a, a_out, ctx);
        transfer::public_transfer(coin_a_out, tx_context::sender(ctx));

        event::emit(SwapEvent {
            sender: tx_context::sender(ctx),
            coin_in_amount: b_amount,
            coin_out_amount: a_out,
            coin_in_type: string::utf8(b"FUNNYYANNE_FAUCET_COIN"),
            coin_out_type: string::utf8(b"FUNNYYANNE_COIN"),
            timestamp: tx_context::epoch(ctx),
        });

    }



}


