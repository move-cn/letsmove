/// Module: my_swap
module my_swap::tianhun_swap {
    use sui::balance::{Self, Balance, Supply};
    use sui::coin::{Self, Coin};
    use sui::pay;
    use sui::table::{Self, Table};
    use my_coin::tianhun_coin::{TIANHUN_COIN};
    use faucet_coin::tianhun_faucet_coin::{TIANHUN_FAUCET_COIN};

    const EZeroAmount: u64 = 0;
    const EInvalidVectorLength: u64 = 1;
    const EBalancesNotMatch: u64 = 2;
    const ENotEnoughBalance: u64 = 3;
    const ERemoveFailed: u64 = 4;

    /// 保存两种 Coin 加入流动性时的总数额
    public struct LP has drop {}

    /// 交易流动池
    public struct Pool has key {
        id: UID,
        coin_tianhun: Balance<TIANHUN_COIN>,
        cion_faucet: Balance<TIANHUN_FAUCET_COIN>,
        lp_supply: Supply<LP>,
    }

    /// 存储每一笔流水中两种 Coin 的存入流动池中的数额
    public struct Pocket has key, store {
        id: UID,
        record: Table<ID, vector<u64>>,
    }

    public fun new_pool(ctx: &mut TxContext) {
        let pool = Pool {
            id: object::new(ctx),
            coin_tianhun: balance::zero(),
            cion_faucet: balance::zero(),
            lp_supply: balance::create_supply(LP {}),
        };
        transfer::share_object(pool);
    }

    public entry fun generate_pool(ctx: &mut TxContext) {
        new_pool(ctx);
    }

    public entry fun create_pocket(ctx: &mut TxContext) {
        let pocket = Pocket {
            id: object::new(ctx),
            record: table::new<ID, vector<u64>>(ctx),
        };
        transfer::public_transfer(pocket, ctx.sender());
    }

    public fun add_liquidity(
        pool: &mut Pool,
        coin_tianhun: Coin<TIANHUN_COIN>,
        coin_faucet: Coin<TIANHUN_FAUCET_COIN>,
        ctx: &mut TxContext,
    ): (Coin<LP>, vector<u64>) {
        let coin_tianhun_value = coin_tianhun.value();
        let coin_faucet_value = coin_faucet.value();
        assert!(coin_tianhun_value > 0 && coin_faucet_value > 0, EZeroAmount);

        // 更新流动池中两种 Coin 的余额，并销毁 Coin
        coin::put(&mut pool.coin_tianhun, coin_tianhun);
        coin::put(&mut pool.cion_faucet, coin_faucet);

        // 更新流动池中 LP 的余额，增量为两种 Coin 的总数额，两种 Coin 的兑换比例为 1:1
        let lp_balance = pool.lp_supply.increase_supply(coin_tianhun_value + coin_faucet_value);
        let mut vec_value = vector::empty<u64>();
        vector::push_back(&mut vec_value, coin_tianhun_value);
        vector::push_back(&mut vec_value, coin_faucet_value);

        (
            coin::from_balance(lp_balance, ctx),
            vec_value,
        )
    }

    public entry fun deposit_totally(
        pool: &mut Pool,
        coin_tianhun: Coin<TIANHUN_COIN>,
        coin_faucet: Coin<TIANHUN_FAUCET_COIN>,
        pocket: &mut Pocket,
        ctx: &mut TxContext,
    ) {
        let (lp, vec_value) = add_liquidity(pool, coin_tianhun, coin_faucet, ctx);
        let lp_id = object::id(&lp);
        table::add(&mut pocket.record, lp_id, vec_value);
        transfer::public_transfer(lp, ctx.sender());
    }

    public entry fun deposit_partially(
        pool: &mut Pool,
        coin_tianhun_vec: vector<Coin<TIANHUN_COIN>>,
        coin_faucet_vec: vector<Coin<TIANHUN_FAUCET_COIN>>,
        coin_tianhun_amount: u64,
        coin_faucet_amount: u64,
        pocket: &mut Pocket,
        ctx: &mut TxContext,
    ) {
        let mut coin_tianhun_new = coin::zero<TIANHUN_COIN>(ctx);
        let mut coin_faucet_new = coin::zero<TIANHUN_FAUCET_COIN>(ctx);

        pay::join_vec(&mut coin_tianhun_new, coin_tianhun_vec);
        pay::join_vec(&mut coin_faucet_new, coin_faucet_vec);

        let coin_tianhun_in = coin_tianhun_new.split(coin_tianhun_amount, ctx);
        let coin_faucet_in = coin_faucet_new.split(coin_faucet_amount, ctx);

        let (lp, vec_value) = add_liquidity(pool, coin_tianhun_in, coin_faucet_in, ctx);
        let lp_id = object::id(&lp);
        table::add(&mut pocket.record, lp_id, vec_value);
        transfer::public_transfer(lp, ctx.sender());

        transfer::public_transfer(coin_tianhun_new, ctx.sender());
        transfer::public_transfer(coin_faucet_new, ctx.sender());
    }

    public fun remove_liquidity(
        pool: &mut Pool,
        lp: Coin<LP>,
        coins: vector<u64>,
        ctx: &mut TxContext,
    ): (Coin<TIANHUN_COIN>, Coin<TIANHUN_FAUCET_COIN>) {
        assert!(vector::length(&coins) == 2, EInvalidVectorLength);

        let coin_tianhun_out = coins[0];
        let coin_faucet_out = coins[1];

        assert!(lp.value() == coin_tianhun_out + coin_faucet_out, EBalancesNotMatch);
        assert!(pool.coin_tianhun.value() >= coin_tianhun_out, ENotEnoughBalance);
        assert!(pool.cion_faucet.value() >= coin_faucet_out, ENotEnoughBalance);

        // 更新流动池中两种 Coin 的余额
        pool.lp_supply.decrease_supply(coin::into_balance(lp));

        (
            coin::take(&mut pool.coin_tianhun, coin_tianhun_out, ctx),
            coin::take(&mut pool.cion_faucet, coin_faucet_out, ctx),
        )
    }

    public entry fun remove_liquidity_totally(
        pool: &mut Pool,
        lp: Coin<LP>,
        pocket: &mut Pocket,
        ctx: &mut TxContext,
    ) {
        let lp_id = object::id(&lp);
        let coins = *table::borrow(&pocket.record, lp_id);
        let (coin_tianhun_out, coin_faucet_out) = remove_liquidity(pool, lp, coins, ctx);
        assert!(coin_tianhun_out.value() > 0 && coin_faucet_out.value() > 0, ERemoveFailed);

        // 从 Pocket 中移除记录
        let coin_out = table::remove(&mut pocket.record, lp_id);
        vector::destroy_empty(coin_out);

        transfer::public_transfer(coin_tianhun_out, ctx.sender());
        transfer::public_transfer(coin_faucet_out, ctx.sender());
    }

    public fun swap_tianhun_outto(
        pool: &mut Pool,
        coin_faucet_in: Coin<TIANHUN_FAUCET_COIN>,
        ctx: &mut TxContext,
    ): Coin<TIANHUN_COIN> {
        let coin_faucet_in_value = coin_faucet_in.value();
        assert!(coin_faucet_in_value > 0, EZeroAmount);

        coin::put(&mut pool.cion_faucet, coin_faucet_in);
        let coin_tianhun_pool_value = pool.coin_tianhun.value();
        assert!(coin_faucet_in_value < coin_tianhun_pool_value, ENotEnoughBalance);

        coin::take(&mut pool.coin_tianhun, coin_faucet_in_value, ctx)
    }

    public entry fun swap_tianhun_out(
        pool: &mut Pool,
        faucet_coins: vector<Coin<TIANHUN_FAUCET_COIN>>,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        // 将所有的 faucet_coins 合并为一个 Coin
        let mut faucet_coin = coin::zero<TIANHUN_FAUCET_COIN>(ctx);
        pay::join_vec(&mut faucet_coin, faucet_coins);

        // 从 faucet_coin 中取出 amount 数额的 Coin
        let faucet_coin_in = faucet_coin.split(amount, ctx);
        let coin_tianhun_out = swap_tianhun_outto(pool, faucet_coin_in, ctx);

        // 将剩余的 faucet_coin 返回给用户
        transfer::public_transfer(faucet_coin, ctx.sender());
        // 将交换得到的 coin_tianhun 返回给用户
        transfer::public_transfer(coin_tianhun_out, ctx.sender());
    }

    public fun swap_faucet_outto(
        pool: &mut Pool,
        coin_tianhun_in: Coin<TIANHUN_COIN>,
        ctx: &mut TxContext,
    ): Coin<TIANHUN_FAUCET_COIN> {
        let coin_tianhun_in_value = coin_tianhun_in.value();
        assert!(coin_tianhun_in_value > 0, EZeroAmount);

        coin::put(&mut pool.coin_tianhun, coin_tianhun_in);
        let coin_faucet_pool_value = pool.cion_faucet.value();
        assert!(coin_tianhun_in_value < coin_faucet_pool_value, ENotEnoughBalance);

        coin::take(&mut pool.cion_faucet, coin_tianhun_in_value, ctx)
    }

    public entry fun swap_faucet_out(
        pool: &mut Pool,
        tianhun_coins: vector<Coin<TIANHUN_COIN>>,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        // 将所有的 tianhun_coins 合并为一个 Coin
        let mut tianhun_coin = coin::zero<TIANHUN_COIN>(ctx);
        pay::join_vec(&mut tianhun_coin, tianhun_coins);

        // 从 tianhun_coin 中取出 amount 数额的 Coin
        let tianhun_coin_in = tianhun_coin.split(amount, ctx);
        let coin_faucet_out = swap_faucet_outto(pool, tianhun_coin_in, ctx);

        // 将剩余的 tianhun_coin 返回给用户
        transfer::public_transfer(tianhun_coin, ctx.sender());
        // 将交换得到的 coin_faucet 返回给用户
        transfer::public_transfer(coin_faucet_out, ctx.sender());
    }
}
