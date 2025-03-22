/*
/// Module: myswap
module myswap::myswap;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module myswap::myswap {
    use sui::balance::{Balance,Supply,create_supply};
    use sui::transfer::{share_object,public_transfer};
    use sui::coin::{Coin,into_balance,from_balance};
    use std::u64;

    const EInvalidRatio: u64 = 0x901;
    const EInvalidInsufficientBalance: u64 = 0x902;

    public struct SWAPBANK<phantom CoinA, phantom CoinB> has key, store {
        id: UID,
        coin_a_balance: Balance<CoinA>,
        coin_b_balance: Balance<CoinB>,
        lp: Supply<LPCOUPON<CoinA, CoinB>>,
        scale: u64,
    }

    public struct LPCOUPON<phantom CoinA, phantom CoinB> has store, drop {}

    public entry fun add_bank<CoinA, CoinB>(coin_a: Coin<CoinA>, coin_b: Coin<CoinB>, ctx: &mut TxContext) {
        let coin_a_val = coin_a.value();
        let coin_b_val = coin_b.value();
        let mut bank = SWAPBANK<CoinA, CoinB> {
            id: object::new(ctx),
            coin_a_balance: into_balance(coin_a),
            coin_b_balance: into_balance(coin_b),
            lp: create_supply(LPCOUPON<CoinA, CoinB>{}),
            scale: 10000000000,
        };

        let lp_amt = u64::sqrt( coin_a_val * coin_b_val);
        let lp_obj = bank.lp.increase_supply(lp_amt);
        public_transfer(from_balance(lp_obj, ctx), ctx.sender());

        share_object(bank);
    }

    public entry fun swapCoinA<CoinA, CoinB> (bank: &mut SWAPBANK<CoinA, CoinB>, coin: Coin<CoinA>, ctx: &mut TxContext) {
        assert!(bank.coin_a_balance.value() >= coin.value(), EInvalidInsufficientBalance);
        let in_amt = coin.value();
        let sum = bank.coin_a_balance.value() * bank.coin_b_balance.value(); 
        let out_amt = bank.coin_b_balance.value() - (sum / (in_amt + bank.coin_a_balance.value()));

        bank.coin_a_balance.join(into_balance(coin));
        let to_balance = bank.coin_b_balance.split(out_amt);

        let coin_b = from_balance(to_balance, ctx);
        public_transfer(coin_b, ctx.sender());
    }

    public entry fun swapCoinB<CoinA, CoinB> (bank: &mut SWAPBANK<CoinA, CoinB>, coin: Coin<CoinB>, ctx: &mut TxContext) {
        let in_amt = coin.value();
        let sum = bank.coin_a_balance.value() * bank.coin_b_balance.value(); 
        let out_amt = bank.coin_a_balance.value() - (sum / (in_amt + bank.coin_b_balance.value()));

        bank.coin_b_balance.join(into_balance(coin));
        let to_balance = bank.coin_a_balance.split(out_amt);

        let coin_a = from_balance(to_balance, ctx);
        public_transfer(coin_a, ctx.sender());
    }

    public entry fun deposit<CoinA, CoinB>(bank: &mut SWAPBANK<CoinA, CoinB>, coin_a: Coin<CoinA>, coin_b: Coin<CoinB>, ctx: &mut TxContext) {
        // 汇率变化后，无法存入
        let ratio = coin_a.value() / coin_b.value();
        let bank_ratio = bank.coin_a_balance.value() / bank.coin_b_balance.value();

        assert!(ratio == bank_ratio, EInvalidRatio);

        let lp_amt = u64::sqrt( coin_a.value() * coin_b.value());
        let lp_obj = bank.lp.increase_supply(lp_amt);
        public_transfer(from_balance(lp_obj, ctx), ctx.sender());
        
        bank.coin_b_balance.join(into_balance(coin_b));
        bank.coin_a_balance.join(into_balance(coin_a));
    }

    public entry fun withdraw<CoinA, CoinB>(bank: &mut SWAPBANK<CoinA, CoinB>, lpcoin: &Coin<LPCOUPON<CoinA, CoinB>>, ctx: &mut TxContext) {
        let ratio = u64::pow(lpcoin.value(), 2) / (bank.coin_a_balance.value() * bank.coin_b_balance.value());
        let out_amt_a = bank.coin_a_balance.value() * ratio;
        let out_amt_b = bank.coin_b_balance.value() * ratio;
        let out_coin_a = from_balance(bank.coin_a_balance.split(out_amt_a), ctx);
        let out_coin_b = from_balance(bank.coin_b_balance.split(out_amt_b), ctx);
        // 存钱增加的 supply 需要减去吗？
        
        public_transfer(out_coin_a, ctx.sender());
        public_transfer(out_coin_b, ctx.sender());
    }
}
