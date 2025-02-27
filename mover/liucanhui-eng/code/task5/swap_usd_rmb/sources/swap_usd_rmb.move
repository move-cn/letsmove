module liucanhui_eng::swap_usd_rmb;
use sui::balance;
use rmb::rmb::RMB;
use my_coin::usd::USD;
use sui::balance::Balance;
use sui::coin::{Coin};
use sui::coin;
use sui::transfer::{share_object,transfer,public_transfer};
use sui::tx_context::{sender};


public struct Bank has key {
    id:UID,
    usd : Balance<USD>,
    rmb : Balance<RMB>,
}

public struct AdminCap has key{
    id:UID,
}

fun init(ctx:&mut TxContext){
    let bank = Bank{
        id:object::new(ctx),
        usd:balance::zero(),
        rmb:balance::zero(),
    };
    share_object(bank);
    let admin = AdminCap{
        id:object::new(ctx)
    };
    transfer(admin,sender(ctx));
}

//存钱
public fun deposit_usd(bank:&mut Bank,usd_coin:Coin<USD>,_:&mut TxContext){
    let usd_balance = coin::into_balance(usd_coin);
    bank.usd.join(usd_balance);
}


public fun deposit_rmb(bank:&mut Bank,usd_coin:Coin<RMB>,_:&mut TxContext){
    let rmb_balance = coin::into_balance(usd_coin);
    bank.rmb.join(rmb_balance);
}

//swap
#[allow(lint(self_transfer))]
public fun usd_swap_rmb(usd_coin:Coin<USD>,bank:&mut Bank,ctx:&mut TxContext){
    let usd_balance = coin::into_balance(usd_coin);
    let swap_rmb_value = usd_balance.value() * 72/10;
    assert!(swap_rmb_value < bank.rmb.value());
    let rmb_balance = bank.rmb.split(swap_rmb_value);
    bank.usd.join(usd_balance);
    public_transfer(coin::from_balance(rmb_balance,ctx),sender(ctx));
}

#[allow(lint(self_transfer))]
public fun rmb_swap_usd(rmb_coin:Coin<RMB>,bank:&mut Bank,ctx:&mut TxContext){
    let rmb_balance = coin::into_balance(rmb_coin);
    let swap_usd_value = rmb_balance.value() * 10/72;
    assert!(swap_usd_value < bank.usd.value());
    let usd_balance = bank.usd.split(swap_usd_value);
    bank.rmb.join(rmb_balance);
    public_transfer(coin::from_balance(usd_balance,ctx),sender(ctx));
}


//取钱
#[allow(lint(self_transfer))]
public fun withdraw_rmb(_:&AdminCap,amt:u64,bank:&mut Bank,ctx:&mut TxContext){
    assert!(amt < bank.rmb.value());
    let rmb_balance = bank.rmb.split(amt);
    public_transfer(coin::from_balance(rmb_balance,ctx),sender(ctx));
}


#[allow(lint(self_transfer))]
public fun withdraw_usd(_:&AdminCap,amt:u64,bank:&mut Bank,ctx:&mut TxContext){
    assert!(amt < bank.usd.value());
    let usd_balance = bank.usd.split(amt);
    public_transfer(coin::from_balance(usd_balance,ctx),sender(ctx));
}








