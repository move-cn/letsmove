
///  x * y = k
module fantasy_move_swap::core_amm {

    use fantasy_move_swap::constants::{get_fee_base_of_percentage, get_min_lp_value};
    use sui::math::{Self, sqrt_u128};

    const ERR_INSUFFICIENT_INPUT_AMOUNT: u64 = 0x50001;
    const ERR_INSUFFICIENT_LIQUIDITY: u64 = 0x50002;
    const ERR_OUT_CANT_ZERO: u64 = 0x50003;
    const ERR_MIN_LP: u64 = 0x50004;
    const ERR_WRONG_AMOUNT: u64 = 0x50005;
    const ERR_WRONG_RESERVE: u64 = 0x50006;
    const ERR_INSUFFICIENT_X_AMOUNT: u64 = 0x50007;
    const ERR_INSUFFICIENT_Y_AMOUNT: u64 = 0x50008;
    const ERR_OVERLIMIT_X: u64 = 0x50009;

    /// for swap exact in
    public fun get_amount_out(amount_in_without_fee: u64, reserve_in: u64, reserve_out: u64): u64{
        assert!(amount_in_without_fee > 0, ERR_INSUFFICIENT_INPUT_AMOUNT);
        assert!(reserve_in > 0 && reserve_out > 0, ERR_INSUFFICIENT_LIQUIDITY);

        ///  infer from reserve_in * reserve_out = (amount_in_without_fee + reserve_in) * (reserve_out -  amount_out_without_fee)
        let numerator = (amount_in_without_fee as u128) * (reserve_out as u128);
        let denominator = (reserve_in as u128) + (amount_in_without_fee as u128);

        ((numerator / denominator) as u64)
    }

    /// get lp coin add liquidity
    public fun get_lp_coin_by_coinx_coiny_amount(coin_x_value: u64, coin_y_value: u64, total_supply: u128, reserve_x: u64, reserve_y: u64): u64{
        if(total_supply == 0){
            let lp = (sqrt_u128((coin_x_value as u128) * (coin_y_value as u128)) as u64);
            assert!(lp > get_min_lp_value(), ERR_MIN_LP);
            lp
        }else {
            let x_lp = total_supply * ((coin_x_value as u128) / (reserve_x as u128));
            let y_lp = total_supply * ((coin_y_value as u128) / (reserve_y as u128));
            math::min((x_lp as u64), (y_lp as u64))
        }
    }

    /// get coin x and coin y on remove liquidity
    public fun get_coinx_coiny_by_lp_coin(lp: u64, reserve_x: u64, reserve_y: u64, total_supply: u128): (u64, u64){
        let x = (lp as u128) * (reserve_x as u128) / total_supply;
        let y = (lp as u128) * (reserve_y as u128) / total_supply;
        assert!(x > 0 && y > 0, ERR_OUT_CANT_ZERO);
        ((x as u64), (y as u64))
    }


    /// add lp without any loss
    public fun get_no_loss_values(
        x_desired: u64,
        y_desired: u64,
        x_min: u64,
        y_min: u64,
        reserve_x: u64,
        reserve_y: u64
    ): (u64, u64){
        if(reserve_y == 0 && reserve_x == 0){
            (x_desired, y_desired)
        }else {
            let y_returnd = convert_current_price(x_desired, reserve_y, reserve_x);

            if (y_returnd <= y_desired){
                assert!(y_returnd >= y_min, ERR_INSUFFICIENT_Y_AMOUNT);
                (x_desired,y_returnd)
            }else {
                let x_returned = convert_current_price(y_desired, reserve_x, reserve_y);
                assert!(x_returned <= x_desired, ERR_OVERLIMIT_X);
                assert!(x_returned >= x_min, ERR_INSUFFICIENT_X_AMOUNT);
                (x_returned, y_desired)
            }
        }
    }

    public fun convert_current_price(coin_in: u64,
                                     reserve_in: u64,
                                     reserve_out: u64): u64{
        assert!(coin_in > 0, ERR_WRONG_AMOUNT);
        assert!(reserve_in > 0 && reserve_out > 0, ERR_WRONG_RESERVE);
        let res = (coin_in as u128) * (reserve_out as u128) / (reserve_in as u128);
        (res as u64)
    }

    /// get fee from amount
    public fun get_fee(amount: u64, fee: u64): u64{
        ((fee as u128) * (amount as u128) / (get_fee_base_of_percentage() as u128) as u64)
    }

    // get fee from amount(without fee)
    public fun get_fee_exact_out(amount: u64, fee: u64, total_fee_percentage: u64): u64 {
        ((fee as u128) * (amount as u128) / (get_fee_base_of_percentage() - total_fee_percentage as u128) as u64)
    }

}
