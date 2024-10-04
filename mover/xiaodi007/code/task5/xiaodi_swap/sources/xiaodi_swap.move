/*
/// Module: xiaodi_swap
module xiaodi_swap::xiaodi_swap {

}
*/

module xiaodi_swap::xiaodi_swap {
    use sui::balance::{Self, Supply, Balance};
    use sui::coin;
    use sui::coin::Coin;
    use sui::transfer::{share_object, public_transfer};
    use sui::tx_context::sender;

    public struct AdminCap has key {
        id: UID,
    }
    
    public struct LP<phantom A, phantom B> has drop {}

    public struct Pool<phantom A, phantom B> has key {
        id: UID,
        coin_a: Balance<A>,
        coin_b: Balance<B>,
        lp_supply: Supply<LP<A, B>>
    }

    public fun create_pool<A, B>(ctx: &mut TxContext) {
        let new_pool = Pool<A, B> {
            id: object::new(ctx),
            coin_a: balance::zero(),
            coin_b: balance::zero(),
            lp_supply: balance::create_supply<LP<A, B>>(LP {})
        };
        share_object(new_pool)
    }

    public fun add_lp<COINA, COINB>(pool: &mut Pool<COINA, COINB>,coin_a: Coin<COINA>, coin_b: Coin<COINB>, ctx: &mut TxContext) {
        let coin_a_value = coin::value(&coin_a);
        let coin_b_value = coin::value(&coin_b);

        coin::put(&mut pool.coin_a, coin_a);
        coin::put(&mut pool.coin_b, coin_b);
        
        let lp_bal = balance::increase_supply(&mut pool.lp_supply, coin_a_value + coin_b_value);
        let lp = coin::from_balance(lp_bal, ctx);
        public_transfer(lp, sender(ctx))
    }

    public fun swap_a_b<COINA, COINB>(pool: &mut Pool<COINA, COINB>,
                                    paid_in: Coin<COINA>,
                                    ctx: &mut TxContext): Coin<COINB> {
        let paid_value = coin::value(&paid_in);
        coin::put(&mut pool.coin_a, paid_in);
        coin::take(&mut pool.coin_b, paid_value, ctx)
    }



    public entry fun swap_a_to_b<COINA, COINB>(pool: &mut Pool<COINA, COINB>,
                                       mut coin_a: Coin<COINA>,
                                       amount: u64,
                                       ctx: &mut TxContext) {
        let coin_a_in = coin::split(&mut coin_a, amount, ctx);
        let coin_b_out = swap_a_b(pool, coin_a_in, ctx);
        let sender_addres = sender(ctx);
        public_transfer(coin_a, sender_addres);
        public_transfer(coin_b_out, sender_addres);
    }


    public fun swap_b_a<COINA, COINB>(pool: &mut Pool<COINA, COINB>,
                                    paid_in: Coin<COINB>,
                                    ctx: &mut TxContext): Coin<COINA> {
        let paid_value = coin::value(&paid_in);
        coin::put(&mut pool.coin_b, paid_in);
        coin::take(&mut pool.coin_a, paid_value, ctx)
    }



    public entry fun swap_b_to_a<COINA, COINB>(pool: &mut Pool<COINA, COINB>,
                                       mut coin_b: Coin<COINB>,
                                       amount: u64,
                                       ctx: &mut TxContext) {
        let coin_b_in = coin::split(&mut coin_b, amount, ctx);
        let coin_a_out = swap_b_a(pool, coin_b_in, ctx);
        let sender_addres = sender(ctx);
        public_transfer(coin_b, sender_addres);
        public_transfer(coin_a_out, sender_addres);
    }

}