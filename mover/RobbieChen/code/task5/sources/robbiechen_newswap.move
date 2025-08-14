module task5::robbiechen_swap {
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance, Supply};
    use sui::table::{Self, Table};

    const ErrNotContainLP: u64 = 0;
    const ErrNotEnoughBalance: u64 = 1;

    public struct LP<phantom COIN_TOM, phantom COIN_JERRY> has drop {}

    public struct Pool<phantom COIN_TOM, phantom COIN_JERRY> has key {
        id: UID,
        balance_a: Balance<COIN_TOM>,
        balance_b: Balance<COIN_JERRY>,
        lp_supply: Supply<LP<COIN_TOM, COIN_JERRY>>,
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

    entry fun create_pool<COIN_TOM, COIN_JERRY>(ctx: &mut TxContext) {
        let pool = Pool<COIN_TOM, COIN_JERRY> {
            id: object::new(ctx),
            balance_a: balance::zero(),
            balance_b: balance::zero(),
            lp_supply: balance::create_supply<LP<COIN_TOM, COIN_JERRY>>(LP<COIN_TOM, COIN_JERRY> {}),
        };
        transfer::share_object(pool);
    }

    entry fun add_liquidity<COIN_TOM, COIN_JERRY>(pool: &mut Pool<COIN_TOM, COIN_JERRY>, coin_tom: Coin<COIN_TOM>, coin_jerry: Coin<COIN_JERRY>, pocket: &mut Pocket, ctx: &mut TxContext) {
        let coin_tom_amount = coin_tom.value();
        let coin_jerry_amount = coin_jerry.value();

        pool.balance_a.join(coin_tom.into_balance());
        pool.balance_b.join(coin_jerry.into_balance());

        let lp_balance = pool.lp_supply.increase_supply(coin_tom_amount + coin_jerry_amount);
        let lp_coin = coin::from_balance(lp_balance, ctx);
        let lp_id = object::id(&lp_coin);

        let mut vec = vector::empty<u64>();
        vec.push_back(coin_tom_amount);
        vec.push_back(coin_jerry_amount);

        pocket.id_to_vec.add(lp_id, vec);
        transfer::public_transfer(lp_coin, tx_context::sender(ctx));
    }

    entry fun remove_liquidity<COIN_TOM, COIN_JERRY>(pool: &mut Pool<COIN_TOM, COIN_JERRY>, lp: Coin<LP<COIN_TOM, COIN_JERRY>>, pocket: &mut Pocket, ctx: &mut TxContext) {
        let lp_id = object::id(&lp);
        assert!(pocket.id_to_vec.contains(lp_id), ErrNotContainLP);

        let vec = pocket.id_to_vec.remove(lp_id);
        let coin_tom_amount = vec[0];
        let coin_jerry_amount = vec[1];
        assert!(coin_tom_amount <= pool.balance_a.value() && coin_jerry_amount <= pool.balance_b.value(), ErrNotEnoughBalance);

        pool.lp_supply.decrease_supply(lp.into_balance());

        let sender = tx_context::sender(ctx);
        transfer::public_transfer(coin::take(&mut pool.balance_a, coin_tom_amount, ctx), sender);
        transfer::public_transfer(coin::take(&mut pool.balance_b, coin_jerry_amount, ctx), sender);
    }

    entry fun tom_swap_jerry<COIN_TOM, COIN_JERRY>(pool: &mut Pool<COIN_TOM, COIN_JERRY>, coin_tom: Coin<COIN_TOM>, ctx: &mut TxContext) {
        let amount = coin_tom.value();
        assert!(amount <= pool.balance_b.value(), ErrNotEnoughBalance);

        pool.balance_a.join(coin_tom.into_balance());
        transfer::public_transfer(coin::take(&mut pool.balance_b, amount, ctx), tx_context::sender(ctx));
    }

    entry fun jerry_swap_tom<COIN_TOM, COIN_JERRY>(pool: &mut Pool<COIN_TOM, COIN_JERRY>, coin_jerry: Coin<COIN_JERRY>, ctx: &mut TxContext) {
        let amount = coin_jerry.value();
        assert!(amount <= pool.balance_a.value(), ErrNotEnoughBalance);

        pool.balance_b.join(coin_jerry.into_balance());
        transfer::public_transfer(coin::take(&mut pool.balance_a, amount, ctx), tx_context::sender(ctx));
    }
}