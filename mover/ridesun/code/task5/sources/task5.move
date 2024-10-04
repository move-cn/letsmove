module task5::ridesun_swap{
    use sui::balance::{Self, Balance,Supply};
    use sui::coin::{Self, Coin};
    use sui::table::{Self,Table};
    use task2::ridesun_coin::RIDESUN_COIN;
    use task2::ridesun_FAUCET_coin::RIDESUN_FAUCET_COIN;

    const ENotEnoughBalance:u64=0;
    public struct LP<phantom RIDESUN_COIN, phantom RIDESUN_FAUCET_COIN> has drop {}

    public struct Pool<phantom RIDESUN_COIN, phantom RIDESUN_FAUCET_COIN> has key {
        id: UID,
        balance_a: Balance<RIDESUN_COIN>,
        balance_b: Balance<RIDESUN_FAUCET_COIN>,
        lp_supply: Supply<LP<RIDESUN_COIN, RIDESUN_FAUCET_COIN>>,
    }

    public struct Pocket has key {
        id: UID,
        id_to_vec: Table<ID, vector<u64>>,
    }

    public entry fun create_pool<RIDESUN_COIN, RIDESUN_FAUCET_COIN>(ctx: &mut TxContext) {
        let pool = Pool<RIDESUN_COIN, RIDESUN_FAUCET_COIN> {
            id: object::new(ctx),
            balance_a: balance::zero(),
            balance_b: balance::zero(),
            lp_supply: balance::create_supply<LP<RIDESUN_COIN, RIDESUN_FAUCET_COIN>>(LP<RIDESUN_COIN, RIDESUN_FAUCET_COIN> {}),
        };
        let pocket=Pocket{
            id:object::new(ctx),
            id_to_vec:table::new<ID,vector<u64>>(ctx)
        };
        transfer::share_object(pool);
        transfer::share_object(pocket);
    }

    public entry fun a_swap_b<RIDESUN_COIN, RIDESUN_FAUCET_COIN>(pool: &mut Pool<RIDESUN_COIN, RIDESUN_FAUCET_COIN>, coin_a: Coin<RIDESUN_COIN>, ctx: &mut TxContext) {
        let amount = coin_a.value();
        assert!(amount <= pool.balance_b.value(), ENotEnoughBalance);

        pool.balance_a.join(coin_a.into_balance());
        transfer::public_transfer(coin::take(&mut pool.balance_b, amount, ctx), tx_context::sender(ctx));
    }
    
    public entry fun b_swap_a<RIDESUN_COIN, RIDESUN_FAUCET_COIN>(pool: &mut Pool<RIDESUN_COIN, RIDESUN_FAUCET_COIN>, coin_b: Coin<RIDESUN_FAUCET_COIN>, ctx: &mut TxContext) {
        let amount = coin_b.value();
        assert!(amount <= pool.balance_a.value(), ENotEnoughBalance);

        pool.balance_b.join(coin_b.into_balance());
        transfer::public_transfer(coin::take(&mut pool.balance_a, amount, ctx), tx_context::sender(ctx));
    }

    public entry fun add_liquidity<RIDESUN_COIN, RIDESUN_FAUCET_COIN>(pool: &mut Pool<RIDESUN_COIN, RIDESUN_FAUCET_COIN>, coin_a: Coin<RIDESUN_COIN>, coin_b: Coin<RIDESUN_FAUCET_COIN>, pocket: &mut Pocket, ctx: &mut TxContext) {
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

}
