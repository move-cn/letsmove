module zeros_swap::algo;

use sui::math::{Self, sqrt_u128};

#[test_only]
use sui::math::pow;

const ERR_INSUFFICIENT_INPUT_AMOUNT: u64 = 0x50001;
const ERR_INSUFFICIENT_LIQUIDITY: u64 = 0x50002;
const ERR_OUT_CANT_ZERO: u64 = 0x50004;
const ERR_MIN_LP: u64 = 0x50006;
const ERR_WRONG_AMOUNT: u64 = 0x50007;
const ERR_WRONG_RESERVE: u64 = 0x50008;
const ERR_INSUFFICIENT_Y_AMOUNT: u64 = 0x50009;
const ERR_INSUFFICIENT_X_AMOUNT: u64 = 0x50010;
const ERR_OVERLIMIT_X: u64 = 0x50011;

/// for swap exact in
public fun get_amount_out(amount_in_without_fee: u64, reserve_in: u64, reserve_out: u64): u64 {
    assert!(amount_in_without_fee > 0, ERR_INSUFFICIENT_INPUT_AMOUNT);
    assert!(reserve_in > 0 && reserve_out > 0, ERR_INSUFFICIENT_LIQUIDITY);

    let numerator = (amount_in_without_fee as u128) * (reserve_out as u128);
    let denominator = (reserve_in as u128) + (amount_in_without_fee as u128);
    ((numerator / denominator) as u64)
}

/// get lp coin add liquidity
public fun get_lp_coin_by_coinx_coiny_amount(coin_x_value: u64, coin_y_value: u64, total_supply: u128, reserve_x: u64, reserve_y: u64, min_lp: u64): u64 {
    if (total_supply == 0) {
        let lp = (sqrt_u128((coin_x_value as u128) * (coin_y_value as u128)) as u64);
        assert!(lp > min_lp, ERR_MIN_LP);
        lp
    } else {
        let x_lp = (coin_x_value as u128) * total_supply / (reserve_x as u128);
        let y_lp = (coin_y_value as u128) * total_supply / (reserve_y as u128);
        math::min((x_lp as u64), (y_lp as u64))
    }
}

/// get coin x and coin y  on remove liquidity
public fun get_coinx_coiny_by_lp_coin(lp: u64, reserve_x: u64, reserve_y: u64, total_supply: u128): (u64, u64) {
    let x = (lp as u128) * (reserve_x as u128) / total_supply;
    let y = (lp as u128) * (reserve_y as u128) / total_supply ;
    assert!(x > 0 && y > 0, ERR_OUT_CANT_ZERO);
    ((x as u64), (y as u64))
}

/// Add lp without any loss
public fun get_no_loss_values(
    x_desired: u64,
    y_desired: u64,
    x_min: u64,
    y_min: u64,
    reserves_x: u64,
    reserves_y: u64
): (u64, u64) {
    if (reserves_x == 0 && reserves_y == 0) {
        return (x_desired, y_desired)
    } else {
        let y_returned = convert_current_price(x_desired, reserves_x, reserves_y);
        if (y_returned <= y_desired) {
            assert!(y_returned >= y_min, ERR_INSUFFICIENT_Y_AMOUNT);
            return (x_desired, y_returned)
        } else {
            let x_returned = convert_current_price(y_desired, reserves_y, reserves_x);
            assert!(x_returned <= x_desired, ERR_OVERLIMIT_X);
            assert!(x_returned >= x_min, ERR_INSUFFICIENT_X_AMOUNT);
            return (x_returned, y_desired)
        }
    }
}

public fun convert_current_price(coin_in: u64, reserve_in: u64, reserve_out: u64): u64 {
    assert!(coin_in > 0, ERR_WRONG_AMOUNT);
    assert!(reserve_in > 0 && reserve_out > 0, ERR_WRONG_RESERVE);
    let res = (coin_in as u128) * (reserve_out as u128) / (reserve_in as u128);
    (res as u64)
}


/// get fee from amount
public fun get_fee(amount: u64, fee: u64, fee_base_of_percentage: u64): u64 {
    ((fee as u128) * (amount as u128) / (fee_base_of_percentage as u128) as u64)
}



// #[test]
// fun test_get_amount_out() {
//     let out = get_amount_out(100, 1000, 500000);
//     assert!(out > 0, 0);

//     let out = get_amount_out(100, 500000, 500000);
//     assert!(out == 99, out);


//     let out = get_amount_out(100, 100000, 100000);
//     assert!(out == 99, out);


//     let out = get_amount_out(100, 100000 * pow(10, 10), 100000 * pow(10, 10));
//     assert!(out == 99, out);

//     let out = get_amount_out(100 * pow(10, 10), 100000 * pow(10, 10), 100000 * pow(10, 10));
//     assert!(out == 999000999000, out);


//     let out = get_amount_out(100000 * pow(10, 10), 100000 * pow(10, 10), 100000 * pow(10, 10));
//     assert!(out == 50000 * pow(10, 10), out);
// }

// #[test]
// fun test_get_coinx_coiny_by_lp_coin() {
//     let (coin_x, coin_y) = get_coinx_coiny_by_lp_coin(10000, 10000, 10000, 10000);
//     assert!(coin_x == 10000, coin_x);
//     assert!(coin_y == 10000, coin_y);


//     let (coin_x, coin_y) = get_coinx_coiny_by_lp_coin(10000 * pow(10, 10), 10000 * pow(10, 10), 10000 * pow(10, 10), 10000 * (pow(10, 10) as u128));
//     assert!(coin_x == 10000 * pow(10, 10), coin_x);
//     assert!(coin_y == 10000 * pow(10, 10), coin_y);


//     let (coin_x, coin_y) = get_coinx_coiny_by_lp_coin(10000, 1000000, 1000000, 1000000);
//     assert!(coin_x == 10000, coin_x);
//     assert!(coin_y == 10000, coin_y);


//     let (coin_x, coin_y) = get_coinx_coiny_by_lp_coin(10000, 1000000 * pow(10, 10), 1000000 * pow(10, 10), 1000000 * (pow(10, 10) as u128));
//     assert!(coin_x == 10000, coin_x);
//     assert!(coin_y == 10000, coin_y);


//     let (coin_x, coin_y) = get_coinx_coiny_by_lp_coin(10000, 7000000, 1000000, 1000000);
//     assert!(coin_x == 70000, coin_x);
//     assert!(coin_y == 10000, coin_y);


//     let (coin_x, coin_y) = get_coinx_coiny_by_lp_coin(10000 * pow(10, 10), 7000000 * pow(10, 10), 1000000 * pow(10, 10), 1000000 * (pow(10, 10) as u128));
//     assert!(coin_x == 70000 * pow(10, 10), coin_x);
//     assert!(coin_y == 10000 * pow(10, 10), coin_y);


//     let (coin_x, coin_y) = get_coinx_coiny_by_lp_coin(10000 * pow(10, 10), 7000000 * pow(10, 10), 2000000 * pow(10, 10), 1000000 * (pow(10, 10) as u128));
//     assert!(coin_x == 70000 * pow(10, 10), coin_x);
//     assert!(coin_y == 20000 * pow(10, 10), coin_y);


//     let (coin_x, coin_y) = get_coinx_coiny_by_lp_coin(10000 * pow(10, 10), 7000000 * pow(10, 10), 18000000 * pow(10, 10), 1000000 * (pow(10, 10) as u128));
//     assert!(coin_x == 70000 * pow(10, 10), coin_x);
//     assert!(coin_y == 180000 * pow(10, 10), coin_y);
// }


// #[test]
// fun test_get_no_loss_values() {
//     let (x_desired, y_desired) = get_no_loss_values(1000, 100, 1000, 100, 0, 0);
//     assert!(1000 == x_desired, x_desired);
//     assert!(100 == y_desired, y_desired);

//     let (x_desired, y_desired) = get_no_loss_values(1000 * pow(10, 10), 100 * pow(10, 10), 1000 * pow(10, 10), 100 * pow(10, 10), 0, 0);
//     assert!(1000 * pow(10, 10) == x_desired, x_desired);
//     assert!(100 * pow(10, 10) == y_desired, y_desired);


//     let (x_desired, y_desired) = get_no_loss_values(1000, 1000, 0, 0, 100 * pow(1, 8), 50 * pow(1, 8));
//     assert!(1000 == x_desired, x_desired);
//     assert!(500 == y_desired, y_desired);


//     let (x_desired, y_desired) = get_no_loss_values(1200 * pow(10, 8), 410 * pow(10, 8), 0, 0, 100 * pow(1, 8), 40 * pow(1, 8));
//     assert!(102500000000 == x_desired, x_desired);
//     assert!(410 * pow(10, 8) == y_desired, y_desired);


//     let (x_desired, y_desired) = get_no_loss_values(400 * pow(10, 8), 410 * pow(10, 8), 0, 0, 100 * pow(1, 8), 40 * pow(1, 8));
//     assert!(400 * pow(10, 8) == x_desired, x_desired);
//     assert!(160 * pow(10, 8) == y_desired, y_desired);


//     let (x_desired, y_desired) = get_no_loss_values(1200 * pow(10, 8), 410 * pow(10, 8), 102500000000, 410 * pow(10, 8) - 1, 100 * pow(1, 8), 40 * pow(1, 8));
//     assert!(102500000000 == x_desired, x_desired);
//     assert!(410 * pow(10, 8) == y_desired, y_desired);
// }

// #[test]
// fun test_get_lp_coin_amount() {
//     // get_lp_coin_amount(coin_x_value: u64, coin_y_value: u64, total_supply: u128, reserve_x: u64, reserve_y: u64)

//     let lp_amount = get_lp_coin_by_coinx_coiny_amount(10000, 10000, 0, 0, 0);
//     assert!(lp_amount == 10000, lp_amount);

//     let lp_amount = get_lp_coin_by_coinx_coiny_amount(10000, 20000, 0, 0, 0);
//     assert!(lp_amount == 14142, lp_amount);

//     let lp_amount = get_lp_coin_by_coinx_coiny_amount(10000 * pow(10, 8), 10000 * pow(10, 8), 0, 0, 0);
//     assert!(lp_amount == 10000 * pow(10, 8), lp_amount);

//     let lp_amount = get_lp_coin_by_coinx_coiny_amount(20000 * pow(10, 8), 10000 * pow(10, 8), 0, 0, 0);
//     assert!(lp_amount == 1414213562373, lp_amount);


//     let lp_amount = get_lp_coin_by_coinx_coiny_amount(10000, 10000, 10000, 10000, 10000);
//     assert!(lp_amount == 10000, lp_amount);

//     let lp_amount = get_lp_coin_by_coinx_coiny_amount(10000, 10000, 1000000, 10000000, 10000000);
//     assert!(lp_amount == 1000, lp_amount);


//     let lp_amount = get_lp_coin_by_coinx_coiny_amount(10000 * pow(10, 8), 10000 * pow(10, 8), 1000000 * (pow(10, 8) as u128), 10000000 * pow(10, 8), 10000000 * pow(10, 8));
//     assert!(lp_amount == 1000 * pow(10, 8), lp_amount);


//     let lp_amount = get_lp_coin_by_coinx_coiny_amount(10000 * pow(10, 8), 20000 * pow(10, 8), 1000000 * (pow(10, 8) as u128), 10000000 * pow(10, 8), 10000000 * pow(10, 8));
//     assert!(lp_amount == 1000 * pow(10, 8), lp_amount);


//     let lp_amount = get_lp_coin_by_coinx_coiny_amount(30000 * pow(10, 8), 10000 * pow(10, 8), 1000000 * (pow(10, 8) as u128), 10000000 * pow(10, 8), 10000000 * pow(10, 8));
//     assert!(lp_amount == 1000 * pow(10, 8), lp_amount);


//     let lp_amount = get_lp_coin_by_coinx_coiny_amount(1000000000, 1000000000, 10000, 1000000, 10000);
//     assert!(lp_amount == 10000000, lp_amount);
// }


// #[test]
// fun test_get_fee() {
//     let fee = get_fee(1000000000, 250);
//     assert!(fee == 2500000, fee);

//     let fee = get_fee(1000000000, 50);
//     assert!(fee == 500000, fee);


//     let fee = get_fee(1000000000, 0);
//     assert!(fee == 0, fee);


//     let fee = get_fee(1000000000, 1);
//     assert!(fee == 10000, fee);


//     let fee = get_fee(1000000000, 1000);
//     assert!(fee == 10000000, fee);


//     let fee = get_fee(1000000000 * pow(10, 8), 1000);
//     assert!(fee == 10000000 * pow(10, 8), fee);


//     let fee = get_fee(1000000000 * pow(10, 8), 99);
//     assert!(fee == 990000 * pow(10, 8), fee);

//     let fee = get_fee(999999 * pow(10, 8), 99);
//     assert!(fee == 98999901000, fee);
// }