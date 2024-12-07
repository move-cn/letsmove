
module nextuser::swap;
use sui::balance::{Self,Balance};
use sui::coin::{Self,Coin};
use std::ascii::String;
use std::type_name;


public struct LiquidPool<phantom A,phantom B> has key,store{
    id : UID,
    balance_a: Balance<A>,
    balance_b:Balance<B> ,
    rate_a2b_100 : u64, //  (a * 100)/ b 
}

public fun get_pool_balance<A,B>(lpool : &LiquidPool<A,B>) : (u64,u64){
    (lpool.balance_a.value(),lpool.balance_b.value())
}

public struct AdminCap has key{
    id : UID,
}

#[allow(lint(self_transfer))]
public fun swap_a2b<A,B>(lpool : &mut LiquidPool<A,B>
                        ,coin : Coin<A>
                        ,ctx : &mut TxContext) : Coin<B>
{
    let a_value = coin::value(&coin);
    let b_value = a_value  * lpool.rate_a2b_100 / 100;
    assert!(b_value <=  balance::value(&lpool.balance_b));
    lpool.balance_a.join(coin::into_balance(coin));
    coin::from_balance(lpool.balance_b.split(b_value),ctx)
}

#[allow(lint(self_transfer))]
public  fun swap_b2a<A,B>(pool:& mut LiquidPool<A,B>
                        ,coin : Coin<B>
                        ,ctx : &mut TxContext) : Coin<A>
{
    let b_value = coin::value(&coin);
    let a_value = b_value * 100 / pool.rate_a2b_100 ;
    assert!(a_value <=  balance::value(&pool.balance_a));
    pool.balance_b.join(coin.into_balance());
    coin::from_balance(pool.balance_a.split(a_value),ctx)
}

public struct PoolCreateEvent has copy,drop{
    coin_a : String,
    coin_b : String,
    balance_a : u64,
    balance_b : u64,
}

entry fun create_pool<A,B>(mut coin_a : Coin<A> ,
                        mut coin_b : Coin<B>, 
                        rate_100 :u64, //输入汇率乘以100
                        ctx : &mut TxContext){
    let a_origin = coin_a.value();
    let b_origin = coin_b.value();
    let mut a_value = coin_a.value();
    let mut b_value = coin_b.value();
    let a_ext = a_value * rate_100;
    let b_ext = b_value * 100; //保持汇率
    if( a_ext > b_ext )
    {
        a_value = b_ext / rate_100;
        transfer::public_transfer( coin_a.split(a_origin - a_value,ctx),
                                  ctx.sender() );
    }
    else if(a_ext < b_ext)
    {
        b_value = a_ext / 100;
        transfer::public_transfer( coin_b.split(b_origin - b_value,ctx),
                                  ctx.sender() );
    };

    let pool = LiquidPool<A,B>{
        id : object::new(ctx),
        balance_a : coin::into_balance(coin_a),
        balance_b : coin::into_balance(coin_b),
        rate_a2b_100 : rate_100,
    };
    transfer::share_object(pool);
    let coin_a_name = * type_name::borrow_string(&type_name::get<Coin<A>>());
    let coin_b_name = * type_name::borrow_string(&type_name::get<Coin<B>>());
    let e = PoolCreateEvent{
        coin_a : coin_a_name,
        coin_b : coin_b_name,
        balance_a : a_value,
        balance_b : b_value
    };
    sui::event::emit(e);
}

fun init(ctx : &mut TxContext){
    let admin = AdminCap{
        id : object::new(ctx),
    };
    transfer::transfer(admin,ctx.sender() );

}

