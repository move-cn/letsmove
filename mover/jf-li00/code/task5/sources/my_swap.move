
module my_swap::swap{

    use sui::coin::{Self, Coin};
    #[allow(lint(coin_field))]
    // Transfering Coins are more convenient than Balances in cli
    public struct Pool<phantom A, phantom B> has key,store{
        id: UID,
        coin_a: Coin<A>,
        coin_b: Coin<B>,
    }


    public fun create_pool<A, B>(coin_a: Coin<A>, coin_b: Coin<B>, ctx:
    &mut TxContext){

        let pool = Pool{
            id: object::new(ctx),
            coin_a,
            coin_b,
        };
        transfer::share_object(pool);
    }

    // Simple implementation of swap, just swap out the same amount of B for A
    #[allow(lint(self_transfer))]
    public fun swap_a_for_b<A, B>(pool: &mut Pool<A, B>, coin_in: Coin<A>,
    ctx: &mut TxContext){
        let amount_out = coin::value(&coin_in);
        coin::join(&mut pool.coin_a, coin_in);
        let coin_out = coin::take<B>(coin::balance_mut<B>(&mut pool.coin_b),amount_out,ctx);
        transfer::public_transfer(coin_out, tx_context::sender(ctx)); 
    }

    #[allow(lint(self_transfer))]
    public fun swap_b_for_a<A, B>(pool: &mut Pool<A, B>, coin_in: Coin<B>,
    ctx: &mut TxContext){
        let amount_out = coin::value(&coin_in);
        coin::join(&mut pool.coin_b, coin_in);
        let coin_out = coin::take<A>(coin::balance_mut<A>(&mut pool.coin_a),amount_out,ctx);
        transfer::public_transfer(coin_out, tx_context::sender(ctx)); 
    }
}