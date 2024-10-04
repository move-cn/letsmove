// 这个游戏的关键是随机数和延迟函数
// 延迟函数负责在一定时间后，生成结果；随机数负责生成结果，可以为多人单局游戏
module task5::swap_moveexpert {
    use sui::balance::{Self, Balance, Supply};
    use sui::table::{Self, Table};
    use sui::coin::{Self, Coin};
    
    
    public struct LP<phantom MOVE410COIN, phantom SUI410COIN> has drop {}
    public struct Pool<phantom MOVE410COIN, phantom SUI410COIN> has key {
        id: UID,
        balance_move_coin: Balance<MOVE410COIN>,
        balance_sui_coin: Balance<SUI410COIN>,
        lp: Supply<LP<MOVE410COIN, SUI410COIN>>,
    }

    public struct Pocket has key {
        id: UID,
        id_vector: Table<ID, vector<u64>>
    }

    fun init(ctx: &mut TxContext) {
        transfer::share_object(Pocket{id: object::new(ctx), id_vector: table::new<ID, vector<u64>>(ctx)});
    }

    entry fun create_pool<MOVE410COIN, SUI410COIN>(ctx: &mut TxContext) {
        let pool = Pool<MOVE410COIN, SUI410COIN> {
            id: object::new(ctx),
            balance_move_coin: balance::zero(),
            balance_sui_coin: balance::zero(),
            lp: balance::create_supply<LP<MOVE410COIN, SUI410COIN>>(LP<MOVE410COIN, SUI410COIN>{}),
        };
        transfer::share_object(pool);
    }

    entry fun add_liquidity<MOVE410COIN, SUI410COIN>(pool: &mut Pool<MOVE410COIN, SUI410COIN>, left_coin:Coin<MOVE410COIN>, right_coin:Coin<SUI410COIN>, pocket: &mut Pocket, ctx: &mut TxContext) {
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

    entry fun remove_liquidity<MOVE410COIN, SUI410COIN>(pool: &mut Pool<MOVE410COIN, SUI410COIN>, lp: Coin<LP<MOVE410COIN, SUI410COIN>>, pocket: &mut Pocket, ctx: &mut TxContext) {
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

    entry fun move_swap_to_sui<MOVE410COIN, SUI410COIN>(pool: &mut Pool<MOVE410COIN, SUI410COIN>, coin_move: Coin<MOVE410COIN>, ctx: &mut TxContext) {
        let amount = coin_move.value();
        assert!(amount <= pool.balance_move_coin.value(), 2);

        pool.balance_move_coin.join(coin_move.into_balance());

        let coin = coin::take(&mut pool.balance_sui_coin, amount, ctx);
        transfer::public_transfer(coin, tx_context::sender(ctx));
    }


    entry fun sui_swap_to_to<MOVE410COIN, SUI410COIN>(pool: &mut Pool<MOVE410COIN, SUI410COIN>, coin_sui: Coin<SUI410COIN>, ctx: &mut TxContext) {
        let amount = coin_sui.value();
        assert!(amount <= pool.balance_sui_coin.value(), 2);

        pool.balance_sui_coin.join(coin_sui.into_balance());

        let coin = coin::take(&mut pool.balance_move_coin, amount, ctx);
        transfer::public_transfer(coin, tx_context::sender(ctx));
    }
}


