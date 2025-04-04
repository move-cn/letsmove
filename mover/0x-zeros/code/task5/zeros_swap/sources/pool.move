module zeros_swap::pool;

use zeros_swap::algo::{get_lp_coin_by_coinx_coiny_amount, get_coinx_coiny_by_lp_coin, get_amount_out, get_fee, get_no_loss_values};
use zeros_swap::events;
use zeros_swap::global::{Self, Global};

use sui::balance::{Self, Balance, Supply};
use sui::coin::{Self, Coin};
use sui::object::{Self, UID, ID};
use sui::transfer;
use sui::tx_context::{Self, TxContext};


const FEE_BASE_OF_PERCENTAGE: u64 = 100000;
const MIN_LP: u64 = 1000; //why 1000?

const EZeroAmount: u64 = 0;
const ENotAllow: u64 = 1;

//todo why 18446744073709551615?
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

    lp_fee: u64, //250  -> 0.25%
    lp_supply: Supply<LPCoin<X, Y>>,
}


public(package) fun create_pool<X, Y>(lp_fee: u64, ctx: &mut TxContext): ID {

    let pool = Pool<X, Y> {
        id: object::new(ctx),
        enable: true,
        reserve_x: balance::zero(),
        reserve_y: balance::zero(),
        fee_x: balance::zero(),
        fee_y: balance::zero(),
        lp_fee,
        lp_supply: balance::create_supply(LPCoin<X, Y> {}),
    };

    let id = object::id(&pool);

    events::emit_create_pool_event<X, Y>(tx_context::sender(ctx), id, lp_fee);

    transfer::share_object(pool);
    id
}

///返回lp coin, 剩余coin_x, 剩余coin_y
public(package) fun add_liquidity<X, Y>(pool: &mut Pool<X, Y>,
                                        mut coin_x: Coin<X>, mut coin_y: Coin<Y>,
                                        coin_x_amount: u64,
                                        coin_x_min: u64,
                                        coin_y_amount: u64,
                                        coin_y_min: u64,
                                        ctx: &mut TxContext): (Coin<LPCoin<X, Y>>, Coin<X>, Coin<Y>) {
    let (coin_x_value, coin_y_value) = (coin::value(&coin_x), coin::value(&coin_y));

    assert!(coin_x_value > 0, EZeroAmount);
    assert!(coin_y_value > 0, EZeroAmount);

    let (reserve_x, reserve_y, lp_supply) = get_reserve(pool);

    let (no_loss_x, no_loss_y) = get_no_loss_values(coin_x_amount, coin_y_amount, coin_x_min, coin_y_min, reserve_x, reserve_y);

    // let (coin_x_rest_amount, coin_y_rest_amount) = (coin_x_value - reserve_x, coin_y_value - no_loss_y);// coin_x_value - reserve_x ? wrong?
    let (coin_x_rest_amount, coin_y_rest_amount) = (coin_x_value - no_loss_x, coin_y_value - no_loss_y);

    let coin_x_rest = coin::split(&mut coin_x, coin_x_rest_amount, ctx);
    let coin_y_rest = coin::split(&mut coin_y, coin_y_rest_amount, ctx);


    let coin_x_balance = coin::into_balance(coin_x);
    let coin_y_balance = coin::into_balance(coin_y);

    //换算为lp
    let minted_lp = get_lp_coin_by_coinx_coiny_amount(no_loss_x, no_loss_y, (lp_supply as u128), reserve_x, reserve_y, MIN_LP);

    let x_amount = balance::join(&mut pool.reserve_x, coin_x_balance);
    let y_amount = balance::join(&mut pool.reserve_y, coin_y_balance);
    assert!(x_amount < MAX_POOL_VALUE, EPoolFull);
    assert!(y_amount < MAX_POOL_VALUE, EPoolFull);

    let mut balance_lp = balance::increase_supply(&mut pool.lp_supply, minted_lp);

    events::emit_add_lp_event<X, Y>(
        tx_context::sender(ctx),
        minted_lp,
        coin_x_amount,
        coin_y_amount,
        no_loss_x,
        no_loss_y,
        reserve_x,
        reserve_y,
        lp_supply
    );

    (coin::from_balance(balance_lp, ctx), coin_x_rest, coin_y_rest)
}

///返回coin_x, coin_y, coin_x 数量，coin_y 数量
public(package) fun remove_liquidity<X, Y>(pool: &mut Pool<X, Y>, lp: Coin<LPCoin<X, Y>>,
                                            min_x: u64,
                                            min_y: u64,
                                            ctx: &mut TxContext): (Coin<X>, Coin<Y>, u64, u64) {
    let lp_amount = coin::value(&lp);
    assert!(lp_amount > 0, EZeroAmount);
    let (reserve_x, reserve_y, lp_supply) = get_reserve(pool);
    let (x_removed, y_removed) = get_coinx_coiny_by_lp_coin(lp_amount, reserve_x, reserve_y, (lp_supply as u128));

    balance::decrease_supply(&mut pool.lp_supply, coin::into_balance(lp));
    events::emit_remove_lp_event<X, Y>(
        tx_context::sender(ctx),
        lp_amount,
        min_x,
        min_y,
        x_removed,
        y_removed,
        reserve_x,
        reserve_y,
        lp_supply
    );

    (
        coin::take(&mut pool.reserve_x, x_removed, ctx),
        coin::take(&mut pool.reserve_y, y_removed, ctx), x_removed, y_removed
    )
}


public(package) fun swap_x_to_y<CoinIn, CoinOut>(pool: &mut Pool<CoinIn, CoinOut>, mut in: Coin<CoinIn>, min_out: u64, ctx: &mut TxContext): (Coin<CoinOut>, u64) {
    let in_value = coin::value(&in);
    assert!(in_value > 0, EZeroAmount);

    let lp_fee = get_fee(in_value, pool.lp_fee, FEE_BASE_OF_PERCENTAGE);

    let in_balance = coin::into_balance(in);

    let (reserve_in, reserve_out, _) = get_reserve(pool);

    assert!(reserve_in > 0 && reserve_out > 0, EReservesEmpty);

    let output_amount = get_amount_out(in_value - lp_fee, reserve_in, reserve_out);
    balance::join(&mut pool.reserve_x, in_balance);


    events::emit_swap_event<CoinIn, CoinOut>(
        tx_context::sender(ctx),
        in_value,
        output_amount,
        min_out,
        lp_fee,
        reserve_in,
        reserve_out
    );

    // (coin::take(&mut pool.reserve_y, output_amount, ctx), reserve_out) //?
    (coin::take(&mut pool.reserve_y, output_amount, ctx), output_amount)
}


public(package) fun swap_y_to_x<CoinIn, CoinOut>(pool: &mut Pool<CoinOut, CoinIn>, mut in: Coin<CoinIn>, min_out: u64, ctx: &mut TxContext): (Coin<CoinOut>, u64) {
    let in_value = coin::value(&in);
    assert!(in_value > 0, EZeroAmount);

    let lp_fee = get_fee(in_value, pool.lp_fee, FEE_BASE_OF_PERCENTAGE);

    let in_balance = coin::into_balance(in);

    let (reserve_out, reserve_in, _) = get_reserve(pool);

    assert!(reserve_in > 0 && reserve_out > 0, EReservesEmpty);

    let output_amount = get_amount_out(in_value - lp_fee, reserve_in, reserve_out);
    balance::join(&mut pool.reserve_y, in_balance);


    events::emit_swap_event<CoinIn, CoinOut>(
        tx_context::sender(ctx),
        in_value,
        output_amount,
        min_out,
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