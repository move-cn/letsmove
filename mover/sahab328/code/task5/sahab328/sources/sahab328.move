module sahab328::swap;

use sui::balance::{Self, Balance, Supply};
use sui::coin::{Coin};

const EValueNotEqual:u64 = 0x1;

public struct Bank<phantom CoinA, phantom CoinB> has key {
    id: UID,
    a: Balance<CoinA>,
    b: Balance<CoinB>,
    lp:Supply<LPCoin<CoinA,CoinB>>,
    fee: u64,
    scaler: u64,
}

public struct LPCoin<phantom CoinA, phantom CoinB> has drop {}

fun init(ctx: &mut TxContext) {
    
}

public fun add_bank<CoinA, CoinB>(coin_a: Coin<CoinA>, coin_b: Coin<CoinB>, fee: u64, scaler:u64, ctx: &mut TxContext) {
    let a_value = coin_a.value();
    let b_value = coin_b.value();
    let mut bank = Bank<CoinA, CoinB> {
        id: object::new(ctx),
        a: coin_a.into_balance(),
        b: coin_b.into_balance(),
        lp: balance::create_supply(LPCoin<CoinA,CoinB>{}),
        fee: fee,
        scaler: scaler,
    };
    let lp_value =  std::u64::sqrt(a_value * b_value);
    let lp_balance = bank.lp.increase_supply(lp_value);
    transfer::public_transfer(lp_balance.into_coin(ctx), ctx.sender());
    transfer::share_object(bank);
}

public fun get_bank_price<CoinA, CoinB>(bank: &Bank<CoinA, CoinB>): u64 {
    let a_balance = bank.a.value();
    let b_balance = bank.b.value();
    bank.scaler * a_balance / b_balance
}

public fun get_price<CoinA, CoinB>(bank: &Bank<CoinA, CoinB>, a_value:u64, b_value:u64): u64 {
    bank.scaler * a_value / b_value
}

public fun add<CoinA, CoinB>(bank: &mut Bank<CoinA, CoinB>, coin_a: Coin<CoinA>, coin_b: Coin<CoinB>, ctx: &mut TxContext) {
    let bank_price = get_bank_price(bank);
    let a_value = coin_a.value();
    let b_value = coin_b.value();
    let price = get_price(bank, a_value, b_value);
    assert!(bank_price == price, EValueNotEqual);
    bank.a.join(coin_a.into_balance());
    bank.b.join(coin_b.into_balance());

    let lp_value =  std::u64::sqrt(a_value * b_value);
    let lp_balance = bank.lp.increase_supply(lp_value);
    transfer::public_transfer(lp_balance.into_coin(ctx), ctx.sender());
}

public fun remove<CoinA, CoinB>(bank: &mut Bank<CoinA, CoinB>, lp_coin: Coin<LPCoin<CoinA, CoinB>>, ctx: &mut TxContext) {
    let lp_value = lp_coin.value();
    let lp_balance = lp_coin.into_balance();
    bank.lp.decrease_supply(lp_balance); 
    let lp_scale = bank.scaler * lp_value / bank.lp.supply_value();
    let a_value = bank.a.value() * lp_scale / bank.scaler;
    let b_value = bank.b.value() * lp_scale / bank.scaler;
    let a_coin =  bank.a.split(a_value).into_coin(ctx);
    let b_coin =  bank.b.split(b_value).into_coin(ctx);
    transfer::public_transfer(a_coin, ctx.sender());
    transfer::public_transfer(b_coin, ctx.sender());
}


// 1 a = x/y b
public fun a_to_b<CoinA, CoinB>(bank: &mut Bank<CoinA, CoinB>, coin: Coin<CoinA>, ctx: &mut TxContext) {
    let a_before = bank.a.value();
    let b_before = bank.b.value();
    // 恒定乘积
    let product = a_before * b_before;
    
    
    // 手续费
    let a_value = coin.value();
    let a_fee_value = a_value  * bank.fee  / bank.scaler;
    
    let a_after = a_before + a_value - a_fee_value;
    let b_after = product / a_after;
    let b_value = b_before - b_after;

    bank.a.join(coin.into_balance());
    let out_coin = bank.b.split(b_value).into_coin(ctx);
    transfer::public_transfer(out_coin, ctx.sender());
}

// 1 b = y/x  a
public fun b_to_a<CoinA, CoinB>(bank: &mut Bank<CoinA, CoinB>, coin: Coin<CoinB>, ctx: &mut TxContext) {
    let a_before = bank.a.value();
    let b_before = bank.b.value();
    // 恒定乘积
    let product = a_before * b_before;
    
    // 手续费
    let b_value = coin.value();
    let b_fee_value = b_value  * bank.fee  / bank.scaler;

    let b_after = b_before + b_value - b_fee_value;
    let a_after = product / b_after;
    let a_value = a_before - a_after;
    bank.b.join(coin.into_balance());
    let out_coin = bank.a.split(a_value).into_coin(ctx);
    transfer::public_transfer(out_coin, ctx.sender());
}