module simple_swap::swap {
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance, Supply};
    use sui::table::{Self, Table};

    const ErrNotContainLP: u64 = 0;
    const ErrNotEnoughBalance: u64 = 1;

    public struct LP<phantom COINA, phantom COINB> has drop {}

    public struct Pool<phantom COINA, phantom COINB> has key {
        id: UID,
        balance_a: Balance<COINA>,
        balance_b: Balance<COINB>,
        lp_supply: Supply<LP<COINA, COINB>>,
    }

    public struct Pocket has key {
        id: UID,
        id_to_vec: Table<ID, vector<u64>>,
    }

    fun init(ctx: &mut TxContext) {
        transfer::share_object(Pocket {
            id: object::new(ctx),
            id_to_vec: table::new<ID, vector<u64>>(ctx),
        });
    }

    entry fun create_pool<COINA, COINB>(ctx: &mut TxContext) {
        let pool = Pool<COINA, COINB> {
            id: object::new(ctx),
            balance_a: balance::zero(),
            balance_b: balance::zero(),
            lp_supply: balance::create_supply<LP<COINA, COINB>>(LP<COINA, COINB> {}),
        };
        transfer::share_object(pool);
    }

    entry fun add_liquidity<COINA, COINB>(pool: &mut Pool<COINA, COINB>, coin_a: Coin<COINA>, coin_b: Coin<COINB>, pocket: &mut Pocket, ctx: &mut TxContext) {
        let coin_a_amount = coin_a.value();
        let coin_b_amount = coin_b.value();

        pool.balance_a.join(coin_a.into_balance());
        pool.balance_b.join(coin_b.into_balance());

        let lp_balance = pool.lp_supply.increase_supply(coin_a_amount + coin_b_amount);
        let lp_coin = coin::from_balance(lp_balance, ctx);
        let lp_id = object::id(&lp_coin);

        let mut vec = vector::empty<u64>();
        vec.push_back(coin_a_amount);
        vec.push_back(coin_b_amount);

        pocket.id_to_vec.add(lp_id, vec);
        transfer::public_transfer(lp_coin, tx_context::sender(ctx));
    }

    entry fun remove_liquidity<COINA, COINB>(pool: &mut Pool<COINA, COINB>, lp: Coin<LP<COINA, COINB>>, pocket: &mut Pocket, ctx: &mut TxContext) {
        let lp_id = object::id(&lp);
        assert!(pocket.id_to_vec.contains(lp_id), ErrNotContainLP);

        let vec = pocket.id_to_vec.remove(lp_id);
        let coin_a_amount = vec[0];
        let coin_b_amount = vec[1];
        assert!(coin_a_amount <= pool.balance_a.value() && coin_b_amount <= pool.balance_b.value(), ErrNotEnoughBalance);

        pool.lp_supply.decrease_supply(lp.into_balance());

        let sender = tx_context::sender(ctx);
        transfer::public_transfer(coin::take(&mut pool.balance_a, coin_a_amount, ctx), sender);
        transfer::public_transfer(coin::take(&mut pool.balance_b, coin_b_amount, ctx), sender);
    }

    entry fun a_swap_b<COINA, COINB>(pool: &mut Pool<COINA, COINB>, coin_a: Coin<COINA>, ctx: &mut TxContext) {
        let amount = coin_a.value();
        assert!(amount <= pool.balance_b.value(), ErrNotEnoughBalance);

        pool.balance_a.join(coin_a.into_balance());
        transfer::public_transfer(coin::take(&mut pool.balance_b, amount, ctx), tx_context::sender(ctx));
    }

    entry fun b_swap_a<COINA, COINB>(pool: &mut Pool<COINA, COINB>, coin_b: Coin<COINB>, ctx: &mut TxContext) {
        let amount = coin_b.value();
        assert!(amount <= pool.balance_a.value(), ErrNotEnoughBalance);

        pool.balance_b.join(coin_b.into_balance());
        transfer::public_transfer(coin::take(&mut pool.balance_a, amount, ctx), tx_context::sender(ctx));
    }
}