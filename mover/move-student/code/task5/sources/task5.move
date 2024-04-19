module task5::swap_movestudent {
    use sui::balance::{Self, Balance, Supply};
    use sui::table::{Self, Table};
    use sui::coin::{Self, Coin};
    
    
    public struct LP<phantom MOVESTUDENT1COIN, phantom MOVESTUDENT2COIN> has drop {}
    public struct Pool<phantom MOVESTUDENT1COIN, phantom MOVESTUDENT2COIN> has key {
        id: UID,
        balance_move_coin: Balance<MOVESTUDENT1COIN>,
        balance_sui_coin: Balance<MOVESTUDENT2COIN>,
        lp: Supply<LP<MOVESTUDENT1COIN, MOVESTUDENT2COIN>>,
    }

    public struct Pocket has key {
        id: UID,
        id_vector: Table<ID, vector<u64>>
    }

    fun init(ctx: &mut TxContext) {
        transfer::share_object(Pocket{id: object::new(ctx), id_vector: table::new<ID, vector<u64>>(ctx)});
    }

    entry fun create_pool<MOVESTUDENT1COIN, MOVESTUDENT2COIN>(ctx: &mut TxContext) {
        let pool = Pool<MOVESTUDENT1COIN, MOVESTUDENT2COIN> {
            id: object::new(ctx),
            balance_move_coin: balance::zero(),
            balance_sui_coin: balance::zero(),
            lp: balance::create_supply<LP<MOVESTUDENT1COIN, MOVESTUDENT2COIN>>(LP<MOVESTUDENT1COIN, MOVESTUDENT2COIN>{}),
        };
        transfer::share_object(pool);
    }

    entry fun add_liquidity<MOVESTUDENT1COIN, MOVESTUDENT2COIN>(pool: &mut Pool<MOVESTUDENT1COIN, MOVESTUDENT2COIN>, left_coin:Coin<MOVESTUDENT1COIN>, right_coin:Coin<MOVESTUDENT2COIN>, pocket: &mut Pocket, ctx: &mut TxContext) {
        let coin_left_amount = left_coin.value();
        let coin_right_amount = right_coin.value();

        pool.balance_move_coin.join(left_coin.into_balance());
        pool.balance_sui_coin.join(right_coin.into_balance());

        let lp_balance = pool.lp.increase_supply(coin_left_amount + coin_right_amount);
        let lp_coin = coin::from_balance(lp_balance, ctx);
        let lp_id = object::id(&lp_coin);

        let mut vec = vector::empty<u64>();
        vec.push_back(coin_left_amount);
        vec.push_back(coin_right_amount);

        pocket.id_vector.add(lp_id, vec);
        transfer::public_transfer(lp_coin, tx_context::sender(ctx));
    }

    entry fun remove_liquidity<MOVESTUDENT1COIN, MOVESTUDENT2COIN>(pool: &mut Pool<MOVESTUDENT1COIN, MOVESTUDENT2COIN>, lp: Coin<LP<MOVESTUDENT1COIN, MOVESTUDENT2COIN>>, pocket: &mut Pocket, ctx: &mut TxContext) {
        let lp_id = object::id(&lp);
        assert!(pocket.id_vector.contains(lp_id), 0);
        
        let vec = pocket.id_vector.remove(lp_id);
        let coin_move_amount = vec[0];
        let coin_sui_amount = vec[1];
        assert!(coin_move_amount <= pool.balance_move_coin.value() && coin_sui_amount <= pool.balance_sui_coin.value(), 1);

        pool.lp.decrease_supply(lp.into_balance());
        let sender = tx_context::sender(ctx);
        transfer::public_transfer(coin::take(&mut pool.balance_move_coin, coin_move_amount, ctx), sender);
        transfer::public_transfer(coin::take(&mut pool.balance_sui_coin, coin_sui_amount, ctx), sender);
    }

    entry fun movestudent1_swap_to_movestudent2<MOVESTUDENT1COIN, MOVESTUDENT2COIN>(pool: &mut Pool<MOVESTUDENT1COIN, MOVESTUDENT2COIN>, coin_move: Coin<MOVESTUDENT1COIN>, ctx: &mut TxContext) {
        let amount = coin_move.value();
        assert!(amount <= pool.balance_move_coin.value(), 2);

        pool.balance_move_coin.join(coin_move.into_balance());

        let coin = coin::take(&mut pool.balance_sui_coin, amount, ctx);
        transfer::public_transfer(coin, tx_context::sender(ctx));
    }


    entry fun movestudent2_swap_to_movestudent1<MOVESTUDENT1COIN, MOVESTUDENT2COIN>(pool: &mut Pool<MOVESTUDENT1COIN, MOVESTUDENT2COIN>, coin_sui: Coin<MOVESTUDENT2COIN>, ctx: &mut TxContext) {
        let amount = coin_sui.value();
        assert!(amount <= pool.balance_sui_coin.value(), 2);

        pool.balance_sui_coin.join(coin_sui.into_balance());

        let coin = coin::take(&mut pool.balance_move_coin, amount, ctx);
        transfer::public_transfer(coin, tx_context::sender(ctx));
    }
}


