/*
/// Module: swap
module swap::swap;
*/
module swap::swap;

use my_coin::jethro_coin::{JETHRO_COIN};
use sui::balance::{Balance};
use sui::coin::{Self, Coin};
use sui::transfer::{public_transfer, share_object, transfer};
use swap::HK::HK;

public struct AdminCap has key{
    id: UID,
}
public struct Swap has key,store{
    id:         UID,
    hk:        Balance<HK>,
    j_coin:        Balance<JETHRO_COIN>,
    j_coin_profit: Balance<JETHRO_COIN>,
    hk_prifit: Balance<HK>,
}

fun init(ctx: &mut TxContext){
    let _admin_cap = AdminCap{
        id:object::new(ctx),
    };
    transfer(_admin_cap,ctx.sender());

    let bank = Swap {
        id:         object::new(ctx),
        hk:        sui::balance::zero<HK>(),
        j_coin:        sui::balance::zero<JETHRO_COIN>(),
        j_coin_profit: sui::balance::zero<JETHRO_COIN>(),
        hk_prifit: sui::balance::zero<HK>(),
    };
    share_object(bank);
}

public entry fun deposit_hk(bank: &mut Swap, hk: Coin<HK>, _: &mut TxContext){
    //存HK
    let hk_balance = coin::into_balance(hk);
    bank.hk.join(hk_balance);
}

public entry fun deposit_jethro_coin(bank: &mut Swap, j_coin: Coin<JETHRO_COIN>, _: &mut TxContext){
    //存J_COIN
    let j_coin_balance = coin::into_balance(j_coin);
    bank.j_coin.join(j_coin_balance);
}

public entry fun withdraw_hk(_ : &AdminCap, bank: &mut Swap, amount: u64, ctx: &mut TxContext){
   let hk_balance = bank.hk.split(amount);
    //从balance 转换为coin
    let hk_coin = coin::from_balance(hk_balance, ctx);
    transfer::public_transfer(hk_coin,ctx.sender())
}

public entry fun withdraw_jethro_coin(_ : &AdminCap, bank: &mut Swap, amount: u64, ctx: &mut TxContext){
    let j_coin_balance = bank.j_coin.split(amount);
    //从balance 转换为coin
    let coin = coin::from_balance(j_coin_balance, ctx);
    transfer::public_transfer(coin,ctx.sender())
}


public entry fun withdraw_prifit(_:&AdminCap, bank: &mut Swap, ctx:&mut TxContext){
    let j_coin_coin = sui::coin::from_balance( bank.j_coin_profit.withdraw_all(),ctx);
    public_transfer(j_coin_coin,ctx.sender());
    let hk_coin = sui::coin::from_balance(bank.hk_prifit.withdraw_all(),ctx);
    public_transfer(hk_coin,ctx.sender());
}

public entry fun swap_hk(bank: &mut Swap, usd:&mut sui::coin::Coin<HK>, ctx:&mut TxContext){
    assert!(usd.value()>0,0x2);
    assert!(bank.hk.value()>0 && bank.j_coin.value()>0,0x3);

    let fee_amt = usd.value()/100;
    let fee_exclude_amt = usd.value()-fee_amt;

    let cofficient = bank.hk.value()*bank.j_coin.value();
    let expected_remain_eig = cofficient/(fee_exclude_amt+bank.hk.value());

    let user_get_amt = bank.j_coin.value() - expected_remain_eig;

    let user_eig_balance = bank.j_coin.split(user_get_amt);

    let use_eig_coin = sui::coin::from_balance(user_eig_balance,ctx);
    public_transfer(use_eig_coin,ctx.sender());

    let fee_coin = usd.split(fee_amt,ctx);
    let pool_coin = usd.split(fee_exclude_amt,ctx);
    bank.hk_prifit.join(sui::coin::into_balance(fee_coin));
    bank.hk.join(sui::coin::into_balance(pool_coin));
}

public entry fun swap_usd(bank: &mut Swap, eig:&mut sui::coin::Coin<JETHRO_COIN>, ctx:&mut TxContext){
    assert!(eig.value()>0,0x2);
    assert!(bank.hk.value()>0 && bank.j_coin.value()>0,0x3);

    let fee_amt = eig.value()/100;
    let fee_exclude_amt = eig.value()-fee_amt;

    let cofficient = bank.hk.value()*bank.j_coin.value();
    let expected_remain_usd = cofficient/(fee_exclude_amt+bank.j_coin.value());

    let user_get_amt = bank.hk.value() - expected_remain_usd;

    let user_usd_balance = bank.hk.split(user_get_amt);

    let user_usd_coin = sui::coin::from_balance(user_usd_balance,ctx);
    public_transfer(user_usd_coin,ctx.sender());

    let fee_coin = eig.split(fee_amt,ctx);
    let pool_coin = eig.split(fee_exclude_amt,ctx);
    bank.j_coin_profit.join(sui::coin::into_balance(fee_coin));
    bank.j_coin.join(sui::coin::into_balance(pool_coin));
}