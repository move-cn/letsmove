module swap::swap;
use sui::balance::{Balance};
use faucet_coin::eig::{EIG};
use my_coin::usd::{USD};
use sui::transfer::{share_object, public_transfer,transfer};




public struct AdminCap has key{
    id:     UID
}

public struct Swap has key,store{
    id:         UID,
    usd:        Balance<USD>,
    eig:        Balance<EIG>,
    eig_profit: Balance<EIG>,
    usd_prifit: Balance<USD>,
}


fun init(ctx: &mut TxContext){
    let _admin_cap = AdminCap{
        id:object::new(ctx),
    };
    transfer(_admin_cap,ctx.sender());

    let mut bank = Swap {
        id:         object::new(ctx),
        usd:        sui::balance::zero<USD>(),
        eig:        sui::balance::zero<EIG>(),
        usd_prifit: sui::balance::zero<USD>(),
        eig_profit: sui::balance::zero<EIG>(),
    };
    share_object(bank);
}

public entry fun deposit_usd(_:&AdminCap, bank: &mut Swap, usd:sui::coin::Coin<USD>, _ctx: &mut TxContext){
    let usd_balance = sui::coin::into_balance(usd);
    bank.usd.join(usd_balance);
}


public entry fun deposit_eig(_:&AdminCap, bank: &mut Swap, eig:sui::coin::Coin<EIG>, _ctx: &mut TxContext){
    let eig_balance = sui::coin::into_balance(eig);
    bank.eig.join(eig_balance);
}

public entry fun withdraw_usd(_:&AdminCap, bank: &mut Swap, amount: u64, ctx:&mut TxContext){
    assert!(amount<=bank.usd.value(),0x1);
    let usd_balance =bank.usd.split(amount);
    let usd_coin = sui::coin::from_balance(usd_balance,ctx);
    public_transfer(usd_coin,ctx.sender());
}

public entry fun withdraw_eig(_:&AdminCap, bank: &mut Swap, amount: u64, ctx:&mut TxContext){
    assert!(amount<=bank.eig.value(),0x1);
    let eig_balance =bank.eig.split(amount);
    let eig_coin = sui::coin::from_balance(eig_balance,ctx);
    public_transfer(eig_coin,ctx.sender());
}

public entry fun withdraw_prifit(_:&AdminCap, bank: &mut Swap, ctx:&mut TxContext){
    let eig_coin = sui::coin::from_balance( bank.eig_profit.withdraw_all(),ctx);
    public_transfer(eig_coin,ctx.sender());
    let usd_coin = sui::coin::from_balance(bank.usd_prifit.withdraw_all(),ctx);
    public_transfer(usd_coin,ctx.sender());
}

public entry fun swap_eig(bank: &mut Swap, usd:&mut sui::coin::Coin<USD>, ctx:&mut TxContext){
    assert!(usd.value()>0,0x2);
    assert!(bank.usd.value()>0 && bank.eig.value()>0,0x3);

    let fee_amt = usd.value()/100;
    let fee_exclude_amt = usd.value()-fee_amt;

    let cofficient = bank.usd.value()*bank.eig.value();
    let expected_remain_eig = cofficient/(fee_exclude_amt+bank.usd.value());

    let user_get_amt = bank.eig.value() - expected_remain_eig;

    let user_eig_balance = bank.eig.split(user_get_amt);

    let use_eig_coin = sui::coin::from_balance(user_eig_balance,ctx);
    public_transfer(use_eig_coin,ctx.sender());

    let fee_coin = usd.split(fee_amt,ctx);
    let pool_coin = usd.split(fee_exclude_amt,ctx);
    bank.usd_prifit.join(sui::coin::into_balance(fee_coin));
    bank.usd.join(sui::coin::into_balance(pool_coin));
}

public entry fun swap_usd(bank: &mut Swap, eig:&mut sui::coin::Coin<EIG>, ctx:&mut TxContext){
    assert!(eig.value()>0,0x2);
    assert!(bank.usd.value()>0 && bank.eig.value()>0,0x3);

    let fee_amt = eig.value()/100;
    let fee_exclude_amt = eig.value()-fee_amt;

    let cofficient = bank.usd.value()*bank.eig.value();
    let expected_remain_usd = cofficient/(fee_exclude_amt+bank.eig.value());

    let user_get_amt = bank.usd.value() - expected_remain_usd;

    let user_usd_balance = bank.usd.split(user_get_amt);

    let user_usd_coin = sui::coin::from_balance(user_usd_balance,ctx);
    public_transfer(user_usd_coin,ctx.sender());

    let fee_coin = eig.split(fee_amt,ctx);
    let pool_coin = eig.split(fee_exclude_amt,ctx);
    bank.eig_profit.join(sui::coin::into_balance(fee_coin));
    bank.eig.join(sui::coin::into_balance(pool_coin));
}


