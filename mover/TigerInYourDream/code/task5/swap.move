module swap::alvin_swap {
    use sui::object::{UID, ID, Self};
    use sui::balance::{Self, Supply, Balance};
    use sui::table::{Self, Table};
    use sui::tx_context::{TxContext, sender};
    use sui::transfer;
    use sui::coin::{Self, Coin};
    use std::vector;
    use sui::pay;


    const ErrInvalidVecotrType: u64 = 1002;
    const ErrZeroAmount: u64 = 1001;
    const ErrBalanceNotMatch: u64 = 1003;
    const ErrdNotEnoughA: u64 = 1004;
    const ErrdNotEnoughB: u64 = 1005;
    const ErrdNotEnoughBalanceLp: u64 = 1006;
    const ErrRemoveFailed: u64 = 1011;
    const ErrEmptyLPVector: u64 = 1012;

    struct LP<phantom A, phantom B> has drop {}

    struct Pool<phantom A, phantom B> has key {
        id: UID,
        coin_a: Balance<A>,
        coin_b: Balance<B>,
        lp_supply: Supply<LP<A, B>>,
    }

    struct Pocket has key, store{
        id: UID,
        table: Table<ID, vector<u64>>,
    }

    public fun new_pool<A,B>(ctx: &mut TxContext) {
        let new_pool = Pool<A, B> {
            id: object::new(ctx),
            coin_a: balance::zero(),
            coin_b: balance::zero(),
            lp_supply: balance::create_supply<LP<A,B>>(LP {}),
        };

        transfer::share_object(new_pool)
    }

    public entry fun generate_pool<A, B>(ctx: &mut TxContext) {
        new_pool<A, B>(ctx);
    }

    public fun add_liquidity<A, B>(pool: &mut Pool<A, B>, coin_a: Coin<A>, coin_b: Coin<B>, ctx: &mut TxContext) :(Coin<LP<A,B>>, vector<u64>) {
        let coin_a_value = coin::value(&coin_a);
        let coin_b_value = coin::value(&coin_b);
        assert!(coin_a_value > 0 && coin_b_value > 0, ErrZeroAmount);

        coin::put(&mut pool.coin_a, coin_a);
        coin::put(&mut pool.coin_b, coin_b);
        let lp_balance = balance::increase_supply(&mut pool.lp_supply, coin_b_value+coin_a_value);
        let vec_value = vector::empty<u64>();
        vector::push_back(&mut vec_value, coin_a_value);
        vector::push_back(&mut vec_value, coin_b_value);
        (coin::from_balance(lp_balance, ctx), vec_value)
    }


    public fun remove_liquidity<A, B>(pool: &mut Pool<A, B>, lp: Coin<LP<A, B>>, vec: vector<u64>, ctx: &mut TxContext) :(Coin<A>, Coin<B>) {
        assert!(vector::length(&vec) == 2, ErrInvalidVecotrType);
        let coin_a_out = *vector::borrow_mut(&mut vec, 0);
        let coin_b_out = *vector::borrow_mut(&mut vec, 1);

        let lp_balance_value = coin::value(&lp);
        assert!(lp_balance_value == coin_a_out + coin_b_out, ErrBalanceNotMatch);
        assert!(balance::value(&pool.coin_a) > coin_a_out, ErrdNotEnoughA);
        assert!(balance::value(&pool.coin_b) > coin_b_out, ErrdNotEnoughB);
        balance::decrease_supply(&mut pool.lp_supply, coin::into_balance(lp));

        (coin::take(&mut pool.coin_a, coin_a_out, ctx), coin::take(&mut pool.coin_b, coin_b_out, ctx))
    }

    public fun withdraw<A, B>(pool: &mut Pool<A, B>,
                              lp: &mut Coin<LP<A, B>>,
                              vec: &mut vector<u64>,
                              coin_a_out: u64,
                              coin_b_out: u64,
                              ctx: &mut TxContext): (Coin<A>, Coin<B>) {
        assert!(balance::value(&pool.coin_a) > coin_a_out, ErrdNotEnoughA);
        assert!(balance::value(&pool.coin_b) > coin_b_out, ErrdNotEnoughB);
        assert!(coin::value(lp) >= coin_a_out + coin_b_out, ErrdNotEnoughBalanceLp);
        let coin_a_balance = vector::borrow_mut(vec, 0);
        *coin_a_balance = *coin_a_balance - coin_a_out;
        let coin_b_balance = vector::borrow_mut(vec, 1);
        *coin_b_balance = *coin_b_balance - coin_a_out;
        let lp_split = coin::split(lp, coin_a_out + coin_b_out, ctx);
        balance::decrease_supply(&mut pool.lp_supply, coin::into_balance(lp_split));
        (
            coin::take(&mut pool.coin_a, coin_a_out, ctx),
            coin::take(&mut pool.coin_b, coin_b_out, ctx)
        )
    }

    public fun swap_a_outto_b<A,B>(pool: &mut Pool<A,B>, paid_a: Coin<A>, ctx: &mut TxContext) : Coin<B> {
        let paid_value = coin::value(&paid_a);
        coin::put(&mut pool.coin_a, paid_a);
        assert!(paid_value < balance::value(&pool.coin_b), ErrdNotEnoughB);
        coin::take(&mut pool.coin_b, paid_value, ctx)
    }

    public fun swap_b_into_a<A,B>(pool: &mut Pool<A,B>, paid_b: Coin<B>, ctx: &mut TxContext) : Coin<A> {
        let paid_value = coin::value(&paid_b);
        coin::put(&mut pool.coin_b, paid_b);
        assert!(paid_value < balance::value(&pool.coin_a), ErrdNotEnoughA);
        coin::take(&mut pool.coin_a, paid_value, ctx)
    }

    public entry fun create_pocket(ctx: &mut TxContext) {
        let pocket = Pocket {
            id: object::new(ctx),
            table: table::new<ID, vector<u64>>(ctx)
        };
        transfer::public_transfer(pocket, sender(ctx));
    }

    public entry fun deposit_totally<A, B>(pool: &mut Pool<A, B>,
                                           coin_a: Coin<A>,
                                           coin_b: Coin<B>,
                                           pocket: &mut Pocket,
                                           ctx: &mut TxContext) {
        let (lp, vec) = add_liquidity(pool, coin_a, coin_b, ctx);
        let lp_id = object::id(&lp);
        table::add(&mut pocket.table, lp_id, vec);
        transfer::public_transfer(lp, sender(ctx));
    }

    public entry fun deposit_partly<A, B>(pool: &mut Pool<A, B>,
                                        coin_a_vec: vector<Coin<A>>,
                                        coin_b_vec: vector<Coin<B>>,
                                        coin_a_amt: u64,
                                        coin_b_amt: u64,
                                        pocket: &mut Pocket,
                                        ctx: &mut TxContext) {
        let coin_a_new = coin::zero<A>(ctx);
        let coin_b_new = coin::zero<B>(ctx);

        pay::join_vec(&mut coin_a_new, coin_a_vec);
        pay::join_vec(&mut coin_b_new, coin_b_vec);

        let coin_a_in = coin::split(&mut coin_a_new, coin_a_amt, ctx);
        let coin_b_in = coin::split(&mut coin_b_new, coin_b_amt, ctx);
        let (lp, vec) = add_liquidity(pool, coin_a_in, coin_b_in, ctx);
        let lp_id = object::id(&lp);
        table::add(&mut pocket.table, lp_id, vec);
        transfer::public_transfer(lp, sender(ctx));
        let sender_address = sender(ctx);

        transfer::public_transfer(coin_a_new, sender_address);
        transfer::public_transfer(coin_b_new, sender_address);
    }

    public entry fun remove_liquidity_totally<A, B>(pool: &mut Pool<A, B>,
                                                    lp: Coin<LP<A, B>>,
                                                    pocket: &mut Pocket,
                                                    ctx: &mut TxContext) {
        let lp_id = object::id(&lp);
        let vec = *table::borrow(&pocket.table, lp_id);
        let (coin_a_out, coin_b_out) = remove_liquidity(pool, lp, vec, ctx);
        assert!(coin::value(&coin_a_out) > 0 && coin::value(&coin_b_out) > 0, ErrRemoveFailed);
        let vec_out = table::remove(&mut pocket.table, lp_id);
        vector::remove(&mut vec_out, 0);
        vector::remove(&mut vec_out, 0);
        let sender_address = sender(ctx);
        transfer::public_transfer(coin_a_out, sender_address);
        transfer::public_transfer(coin_b_out, sender_address);
    }

    public fun join_lp_vec<A, B>(lp_vec: vector<Coin<LP<A, B>>>,
                                 pocket: &mut Pocket,
                                 ctx: &mut TxContext): (Coin<LP<A, B>>, vector<u64>) {
        let idx = 0;
        let vec_length = vector::length(&lp_vec);
        assert!(vec_length > 0, ErrEmptyLPVector);
        let (combined_lp, combined_vec, combined_a_amt, combined_b_amt) =
            (coin::zero<LP<A, B>>(ctx), vector::empty<u64>(), (0 as u64), (0 as u64));
        while (idx < vec_length) {
            let lp_out = vector::pop_back(&mut lp_vec);
            let lp_id = object::id(&lp_out);
            let vec_out = table::remove(&mut pocket.table, lp_id);
            combined_b_amt = combined_b_amt + vector::pop_back(&mut vec_out);
            combined_a_amt = combined_a_amt + vector::pop_back(&mut vec_out);
            vector::destroy_empty(vec_out);
            pay::join(&mut combined_lp, lp_out);
            idx = idx + 1;
        };
        vector::destroy_empty(lp_vec);
        vector::push_back(&mut combined_vec, combined_a_amt);
        vector::push_back(&mut combined_vec, combined_b_amt);
        (combined_lp, combined_vec)
    }

     public entry fun withdraw_out<A, B>(pool: &mut Pool<A, B>,
                                        lp_vec: vector<Coin<LP<A, B>>>,
                                        coin_a_amt: u64,
                                        coin_b_amt: u64,
                                        pocket: &mut Pocket,
                                        ctx: &mut TxContext) {
        let (combined_lp, combined_vec) = join_lp_vec(lp_vec, pocket, ctx);
        let (withdraw_coin_a, withdraw_coin_b) =
            withdraw(pool, &mut combined_lp, &mut combined_vec, coin_a_amt, coin_b_amt, ctx);
        let combined_lp_id = object::id(&combined_lp);
        table::add(&mut pocket.table, combined_lp_id, combined_vec);
        let sender_address = sender(ctx);
        transfer::public_transfer(withdraw_coin_a, sender_address);
        transfer::public_transfer(withdraw_coin_b, sender_address);
        transfer::public_transfer(combined_lp, sender_address);
    }
    
    public entry fun swap_a_to_b<A, B>(pool: &mut Pool<A, B>,
                                       coin_a_vec: vector<Coin<A>>,
                                       amount: u64,
                                       ctx: &mut TxContext) {
        let coin_a = coin::zero<A>(ctx);
        pay::join_vec<A>(&mut coin_a, coin_a_vec);
        let coin_a_in = coin::split(&mut coin_a, amount, ctx);
        let coin_b_out = swap_a_outto_b(pool, coin_a_in, ctx);
        let sender_addres = sender(ctx);
        transfer::public_transfer(coin_a, sender_addres);
        transfer::public_transfer(coin_b_out, sender_addres);
    }
    
    public entry fun swap_b_to_a<A, B>(pool: &mut Pool<A, B>,
                                       coin_b_vec: vector<Coin<B>>,
                                       amount: u64,
                                       ctx: &mut TxContext) {
        let coin_b = coin::zero<B>(ctx);
        pay::join_vec<B>(&mut coin_b, coin_b_vec);
        let coin_y_in = coin::split(&mut coin_b, amount, ctx);
        let coin_x_out = swap_b_into_a(pool, coin_y_in, ctx);
        let sender_addres = sender(ctx);
        transfer::public_transfer(coin_x_out, sender_addres);
        transfer::public_transfer(coin_b, sender_addres);
    }

}