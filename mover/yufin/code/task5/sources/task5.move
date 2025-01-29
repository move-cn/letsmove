module task5::yufin{
    use std::u64;
    use sui::balance;
    use sui::balance::{Balance, Supply};
    use sui::coin;
    use sui::coin::Coin;
    use sui::math;
    use sui::transfer::{share_object, transfer, public_transfer};

    const EImbalanceLp: u64 = 0x90;
    const ESlippageExceeded: u64 = 0x91;
    const EOverflow: u64 = 0x92;
    const SCALING_6:u64 = 1000000;

    public struct Pool<phantom CoinA, phantom CoinB> has key {
        id: UID,
        coin_a: Balance<CoinA>,
        coin_b: Balance<CoinB>,
        lp: Supply<LpCoin<CoinA, CoinB>>,
        protocol_fee_a: Balance<CoinA>,
        protocol_fee_b: Balance<CoinB>,
        fee_rate: u64,
        fee_scale: u64,
        protocol_fee_share: u64,
    }

    public struct AdminCap has key {
        id: UID
    }

    public struct LpCoin<phantom CoinA, phantom CoinB> has drop {}

    fun safe_mul(a: u64, b: u64): u64 {
        assert!(a == 0 || (a * b) / a == b, EOverflow);
        a * b
    }

    fun safe_div(a: u64, b: u64): u64 {
        assert!(b != 0, EOverflow);
        a / b
    }

    public entry fun create_pool<CoinA, CoinB> (_: &AdminCap, fee_rate: u64, protocol_fee_share: u64, fee_scale: u64,ctx: &mut TxContext) {
        let pool = Pool<CoinA, CoinB>{
            id: object::new(ctx),
            coin_a: balance::zero(),
            coin_b: balance::zero(),
            lp: balance::create_supply<LpCoin<CoinA, CoinB>>(LpCoin<CoinA, CoinB>{}),
            protocol_fee_a: balance::zero(),
            protocol_fee_b: balance::zero(),
            fee_rate,
            fee_scale,
            protocol_fee_share,
        };
        share_object(pool);
    }

    fun init(ctx: &mut TxContext) {
        let admin_cap = AdminCap{
            id: object::new(ctx)
        };
        transfer(admin_cap, ctx.sender());
    }

    public entry fun add_liquidity<CoinA, CoinB>(pool: &mut Pool<CoinA, CoinB>, coin_a: Coin<CoinA>, coin_b: Coin<CoinB>, ctx: &mut TxContext) {

        if (balance::supply_value(&pool.lp) != 0) {
            assert!(pool.coin_a.value() * SCALING_6 / pool.coin_b.value() == coin_a.value() * SCALING_6 / coin_b.value(), EImbalanceLp)
        };

        let lp_coin_amount = math::sqrt(coin_a.value()) * math::sqrt(coin_b.value());
        let lp_coin = pool.lp.increase_supply(lp_coin_amount);
        public_transfer(coin::from_balance(lp_coin, ctx), ctx.sender());

        pool.coin_a.join(coin::into_balance(coin_a));
        pool.coin_b.join(coin::into_balance(coin_b));

    }

    public entry fun remove_liquidity<CoinA, CoinB>(pool: &mut Pool<CoinA,CoinB>, lp_coin: Coin<LpCoin<CoinA, CoinB>>, ctx: &mut TxContext) {
        let lp_coin_amount = lp_coin.value();
        let total_lp = balance::supply_value(&pool.lp);
        let out_amount_a = pool.coin_a.value() * SCALING_6 / total_lp * lp_coin_amount / SCALING_6;
        let out_amount_b = pool.coin_b.value() * SCALING_6 / total_lp * lp_coin_amount / SCALING_6;

        pool.lp.decrease_supply(coin::into_balance(lp_coin));

        let coin_a = coin::from_balance(pool.coin_a.split(out_amount_a), ctx);
        let coin_b = coin::from_balance(pool.coin_b.split(out_amount_b), ctx);

        public_transfer(coin_a, ctx.sender());
        public_transfer(coin_b, ctx.sender());

    }

    public entry fun swap_to_coinb<CoinA, CoinB>(pool: &mut Pool<CoinA, CoinB>, in_a: Coin<CoinA>, out_min: u64, ctx: &mut TxContext) {
        let input_amount = in_a.value();

        let total_fee = safe_mul(input_amount, pool.fee_rate);
        let total_fee = safe_div(total_fee, pool.fee_scale);

        let protocol_fee = safe_mul(total_fee, pool.protocol_fee_share);
        let protocol_fee = safe_div(protocol_fee, pool.fee_scale);

        let input_amount_after_fee = input_amount - total_fee;

        let numerator = safe_mul(pool.coin_b.value(), input_amount_after_fee);
        let denominator = pool.coin_a.value() + input_amount_after_fee;
        let out_amount = safe_div(numerator, denominator);

        assert!(out_amount >= out_min, ESlippageExceeded);

        let mut fee_balance = coin::into_balance(in_a);
        let protocol_fee_balance = fee_balance.split(protocol_fee);
        pool.protocol_fee_a.join(protocol_fee_balance);

        pool.coin_a.join(fee_balance);

        let out_b = pool.coin_b.split(out_amount);
        public_transfer(coin::from_balance(out_b, ctx), ctx.sender());
    }

    public entry fun swap_to_coina<CoinA, CoinB>(pool: &mut Pool<CoinA, CoinB>, in_b: Coin<CoinB>, out_min: u64, ctx: &mut TxContext) {
        let input_amount = in_b.value();

        let total_fee = safe_mul(input_amount, pool.fee_rate);
        let total_fee = safe_div(total_fee, pool.fee_scale);

        let protocol_fee = safe_mul(total_fee, pool.protocol_fee_share);
        let protocol_fee = safe_div(protocol_fee, pool.fee_scale);

        let input_amount_after_fee = input_amount - total_fee;

        let numerator = safe_mul(pool.coin_a.value(), input_amount_after_fee);
        let denominator = pool.coin_b.value() + input_amount_after_fee;
        let out_amount = safe_div(numerator, denominator);

        assert!(out_amount >= out_min, ESlippageExceeded);

        let mut fee_balance = coin::into_balance(in_b);
        let protocol_fee_balance = fee_balance.split(protocol_fee);
        pool.protocol_fee_b.join(protocol_fee_balance);

        pool.coin_b.join(fee_balance);

        let out_a = pool.coin_a.split(out_amount);
        public_transfer(coin::from_balance(out_a, ctx), ctx.sender());
    }

    public entry fun collect_protocol_fees<CoinA, CoinB>(_: &AdminCap, pool: &mut Pool<CoinA, CoinB>, ctx: &mut TxContext) {
        let fee_a_amount = pool.protocol_fee_a.value();
        let fee_b_amount = pool.protocol_fee_b.value();

        if (fee_a_amount > 0) {
            let fee_a = pool.protocol_fee_a.split(fee_a_amount);
            public_transfer(coin::from_balance(fee_a, ctx), ctx.sender());
        };

        if (fee_b_amount > 0) {
            let fee_b = pool.protocol_fee_b.split(fee_b_amount);
            public_transfer(coin::from_balance(fee_b, ctx), ctx.sender());
        };
    }

}

