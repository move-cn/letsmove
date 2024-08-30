module fantasy_move_swap::pool {
    use fantasy_move_swap::core_amm::{get_lp_coin_by_coinx_coiny_amount, get_coinx_coiny_by_lp_coin,get_amount_out, get_fee, get_no_loss_values};
    use fantasy_move_swap::constants::{get_default_fee, get_min_lp_value};
    use fantasy_move_swap::events;
    use fantasy_move_swap::global::{Self, Global, get_manager_address};
    use sui::balance::{Self, Balance, Supply, supply_value};
    use sui::coin::{Self, Coin};
    use sui::object::{Self, UID, ID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};


    const EZeroAmount: u64 = 0;
    const ENotAllow: u64 = 1;

    const MAX_POOL_VALUE: u64 = {
        18446744073709551615 / 10000
    };

    const EPoolFull: u64 = 1;
    const EReservesEmpty: u64 = 2;

    public struct LPCoin<phantom X, phantom Y> has drop {}

    public struct Pool<phantom X, phantom Y> has store, key {
        id: UID,
        enable: bool,
        reserve_x: Balance<X>,
        reserve_y: Balance<Y>,

        fee_x: Balance<X>,
        fee_y: Balance<Y>,
        dao_fee: u64,
        lp_fee: u64,
        locked_lp: Balance<LPCoin<X, Y>>,
        lp_supply: Supply<LPCoin<X, Y>>
    }

    public entry fun withdraw_fee<X, Y>(pool: &mut Pool<X, Y>, g: &Global, to: address, amount_x: u64, amount_y: u64, ctx: &mut TxContext){
        assert!(global::get_withdraw_address(g) == tx_context::sender(ctx), ENotAllow);

        let balance_x = balance::split(&mut pool.fee_x, amount_x);
        let balance_y = balance::split(&mut pool.fee_y, amount_y);
        transfer::public_transfer(coin::from_balance(balance_x, ctx), to);
        transfer::public_transfer(coin::from_balance(balance_y, ctx), to);
    }

    public entry fun set_dao_fee<X, Y>(pool: &mut Pool<X, Y>, g: &Global, fee: u64, ctx: &mut TxContext){
        let sender_address = tx_context::sender(ctx);
        let (manager_address1, manager_address2) = get_manager_address(g);
        assert!(manager_address1 == sender_address || manager_address2 == sender_address, ENotAllow);
        pool.dao_fee = fee;
    }

    public entry fun set_lp_fee<X, Y>(pool: &mut Pool<X, Y>, g: &Global, fee: u64, ctx: &mut TxContext) {
        let sender_address = tx_context::sender(ctx);
        let (manager_address1, manager_address12) = get_manager_address(g) ;
        assert!(manager_address1 == sender_address || manager_address12 == sender_address, ENotAllow);
        pool.lp_fee = fee;
    }

    public(package) fun create_pool<X,Y>(ctx: &mut TxContext): ID{
        let (dao_fee, lp_fee) = get_default_fee();
        let pool = Pool<X, Y> {
            id: object::new(ctx),
            enable: true,
            reserve_x: balance::zero(),
            reserve_y: balance::zero(),
            fee_x: balance::zero(),
            fee_y: balance::zero(),
            locked_lp: balance::zero(),
            dao_fee,
            lp_fee,
            lp_supply: balance::create_supply(LPCoin<X,Y>{})
        };

        let id = object::id(&pool);
        events::emit_create_pool_event<X,Y>(tx_context::sender(ctx), id);
        transfer::share_object(pool);
        id
    }

    public(package) fun add_liquidity<X, Y>(
        pool: &mut Pool<X, Y>,
        mut coin_x: Coin<X>,
        mut coin_y: Coin<Y>,
        coin_x_amount: u64,
        coin_x_min: u64,
        coin_y_amount: u64,
        coin_y_min: u64,
        ctx: &mut TxContext
    ):(Coin<LPCoin<X, Y>>, Coin<X>, Coin<Y>){
        let (coin_x_value, coin_y_value) = (coin::value(&coin_x), coin::value(&coin_y));
        assert!(coin_x_value > 0, EZeroAmount);
        assert!(coin_y_value > 0, EZeroAmount);
        let (reserve_x, reserve_y, lp_suppply) = get_reserve(pool);
        /// calculate add coin_x and coin_y in pool
        let (no_loss_x, no_loss_y) = get_no_loss_values(coin_x_amount, coin_y_amount, coin_x_min, coin_y_min, reserve_x, reserve_y);

        let (coin_x_rest_amount, coin_y_rest_amount) = (coin_x_value - no_loss_x, coin_y_value - no_loss_y);

        let coin_x_rest = coin::split(&mut coin_x, coin_x_rest_amount, ctx);
        let coin_y_rest = coin::split(&mut coin_y, coin_y_rest_amount, ctx);
        /// coin_x.value == no_loss_x && coin_y.value == no_loss_y
        let coin_x_balance = coin::into_balance(coin_x);
        let coin_y_balance = coin::into_balance(coin_y);
        /// calculate the add lp_coin value
        let share_minted = get_lp_coin_by_coinx_coiny_amount(no_loss_x, no_loss_y, (lp_suppply as u128), reserve_x, reserve_y);

        let x_amount = balance::join(&mut pool.reserve_x, coin_x_balance);
        let y_amount = balance::join(&mut pool.reserve_y, coin_y_balance);

        assert!(x_amount < MAX_POOL_VALUE && y_amount < MAX_POOL_VALUE, EPoolFull);

        let mut balance_lp = balance::increase_supply(&mut pool.lp_supply, share_minted);

        let mut real_lp_amount = share_minted;

        if (lp_suppply == 0){
            let min_lp_value = get_min_lp_value();
            balance::join(&mut pool.locked_lp, balance::split(&mut balance_lp, min_lp_value));
            real_lp_amount = share_minted - min_lp_value;
        };

        events::emit_add_lp_event<X, Y>(
            tx_context::sender(ctx),
            real_lp_amount,
            coin_x_amount,
            coin_y_amount,
            no_loss_x,
            no_loss_y,
            reserve_x,
            reserve_y,
            lp_suppply
        );

        (coin::from_balance(balance_lp, ctx), coin_x_rest, coin_y_rest)

    }


    public(package) fun decrease_liquidity_by_lpcoin<X, Y>(pool: &mut Pool<X,Y>, lp: Coin<LPCoin<X,Y>>,
        min_x: u64,
        min_y: u64,
        ctx: &mut TxContext): (Coin<X>, Coin<Y>, u64, u64){
        let lp_amount = coin::value(&lp);
        assert!(lp_amount > 0, EZeroAmount);

        let (reserve_x, reserve_y, lp_supply) = get_reserve(pool);
        let (x_decrease, y_decrease) = get_coinx_coiny_by_lp_coin(lp_amount, reserve_x, reserve_y, (lp_supply as u128));
        balance::decrease_supply(&mut pool.lp_supply, coin::into_balance(lp));
        events::emit_remove_lp_event<X, Y>(
            tx_context::sender(ctx),
            lp_amount,
            min_x,
            min_y,
            x_decrease,
            y_decrease,
            reserve_x,
            reserve_y,
            lp_supply
        );

        (
            coin::take(&mut pool.reserve_x, x_decrease, ctx),
            coin::take(&mut pool.reserve_y, y_decrease, ctx),
            x_decrease, y_decrease
        )

    }


    public(package) fun swap_x_to_y<CoinIn, CoinOut>(pool: &mut Pool<CoinIn, CoinOut>, mut in: Coin<CoinIn>, min_out: u64, ctx: &mut TxContext): (Coin<CoinOut>, u64){
        let in_value = coin::value(&in);
        assert!(in_value > 0, EZeroAmount);

        let dao_fee = get_fee(in_value, pool.dao_fee);
        let lp_fee = get_fee(in_value, pool.lp_fee);
        let dao_coin = coin::split(&mut in, dao_fee, ctx);
        // lp_fee will remian in the pool.reserve_x, so don't need to split
        // let lp_fee_coin = coin::split(&mut in, lp_fee, ctx);
        coin::put(&mut pool.fee_x, dao_coin);
        let in_balance = coin::into_balance(in);

        let (reserve_in, reserve_out, _) = get_reserve(pool);

        assert!(reserve_in > 0 && reserve_out > 0, EReservesEmpty);

        let output_amount = get_amount_out(in_value - dao_fee - lp_fee, reserve_in, reserve_out);

        balance::join(&mut pool.reserve_x, in_balance);


        events::emit_swap_event<CoinIn, CoinOut>(
            tx_context::sender(ctx),
            in_value,
            output_amount,
            min_out,
            dao_fee,
            lp_fee,
            reserve_in,
            reserve_out
        );
        (coin::take(&mut pool.reserve_y, output_amount, ctx), output_amount)
    }

    public(package) fun swap_y_to_x<CoinIn, CoinOut>(pool: &mut Pool<CoinIn, CoinOut>, mut in: Coin<CoinOut>, min_out: u64, ctx: &mut TxContext): (Coin<CoinIn>, u64){
        let in_value = coin::value(&in);
        assert!(in_value > 0, EZeroAmount);

        let dao_fee = get_fee(in_value, pool.dao_fee);
        let lp_fee = get_fee(in_value, pool.lp_fee);
        let dao_coin = coin::split(&mut in, dao_fee, ctx);
        // lp_fee will remian in the pool.reserve_x, so don't need to split
        // let lp_fee_coin = coin::split(&mut in, lp_fee, ctx);
        coin::put(&mut pool.fee_y, dao_coin);
        let in_balance = coin::into_balance(in);

        let (reserve_in, reserve_out, _) = get_reserve(pool);

        assert!(reserve_in > 0 && reserve_out > 0, EReservesEmpty);

        let output_amount = get_amount_out(in_value - dao_fee - lp_fee, reserve_out, reserve_in);

        balance::join(&mut pool.reserve_y, in_balance);


        events::emit_swap_event<CoinIn, CoinOut>(
            tx_context::sender(ctx),
            in_value,
            output_amount,
            min_out,
            dao_fee,
            lp_fee,
            reserve_in,
            reserve_out
        );
        (coin::take(&mut pool.reserve_x, output_amount, ctx), output_amount)
    }

    public fun get_reserve<X, Y>(pool: &Pool<X, Y>): (u64, u64, u64) {
        (
            balance::value(&pool.reserve_x),
            balance::value(&pool.reserve_y),
            balance::supply_value(&pool.lp_supply)
        )
    }


}
