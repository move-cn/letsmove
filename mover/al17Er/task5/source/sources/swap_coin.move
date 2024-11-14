module swap_coin::swap_coin;

use sui::balance::{Balance,zero,join,split};
use sui::coin;
use sui::balance;
use sui::coin::{Coin,into_balance,from_balance};
use sui::transfer::{share_object,transfer,public_transfer};
use al17er_coin::al17er_coin::{AL17ER_COIN};
use pixel_coin::pixel_coin::{PIXEL_COIN};
use sui::tx_context::{sender};

public struct BankAccount has key{
    id:UID,
    al17er_coin_balance: Balance<AL17ER_COIN>,
    pixel_coin_balance: Balance<PIXEL_COIN>,
}

public struct AdminCap has key{
    id:UID,
}

fun init(ctx: &mut TxContext){
    let admin_cap=AdminCap{
        id: object::new(ctx),
    };

    let bankaccount = BankAccount{
        id:object::new(ctx),
        al17er_coin_balance:zero<AL17ER_COIN>(),
        pixel_coin_balance:zero<PIXEL_COIN>(),
    };
    transfer(admin_cap,sender(ctx));
    share_object(bankaccount);
}

fun despoit_al17er_contact(bankaccount:&mut BankAccount,dcoins:coin::Coin<AL17ER_COIN>,ctx:&mut TxContext){
    let into_balance = into_balance(dcoins);
    balance::join(&mut bankaccount.al17er_coin_balance,into_balance);
}

fun despoit_pixel_contact(bankaccount:&mut BankAccount,dcoins:coin::Coin<PIXEL_COIN>,ctx:&mut TxContext){
    let into_balance = into_balance(dcoins);
    balance::join(&mut bankaccount.pixel_coin_balance,into_balance);
}

public entry fun despoit_al17er(bankaccount:&mut BankAccount,dcoins:coin::Coin<AL17ER_COIN>,ctx:&mut TxContext){
    let into_balance = into_balance(dcoins);
    balance::join(&mut bankaccount.al17er_coin_balance,into_balance);
}

public entry fun despoit_pixel(bankaccount:&mut BankAccount,dcoins:coin::Coin<PIXEL_COIN>,ctx:&mut TxContext){
    let into_balance = into_balance(dcoins);
    balance::join(&mut bankaccount.pixel_coin_balance,into_balance);
}

fun withdraw_al17er_contact(bankaccount: &mut BankAccount,amount:u64,to:address,ctx:&mut TxContext){
    let coin_balance=split(&mut bankaccount.al17er_coin_balance,amount);
    let coin=from_balance(coin_balance,ctx);
    public_transfer(coin,to);
}

fun withdraw_pixel_contact(bankaccount:&mut BankAccount,amount:u64,to:address,ctx:&mut TxContext){
    let coin_balance=split(&mut bankaccount.pixel_coin_balance,amount);
    let coin=from_balance(coin_balance,ctx);
    public_transfer(coin,to);
}


public entry fun swap_pixel(bankaccount:&mut BankAccount,swap_coin:coin::Coin<AL17ER_COIN>,ctx:&mut TxContext){
    let swapper_address = ctx.sender();
    let swap_value = swap_coin.value();
    despoit_al17er_contact(bankaccount,swap_coin,ctx);
    withdraw_pixel_contact(bankaccount,swap_value,swapper_address,ctx);
}

public entry fun swap_al17er(bankaccount:&mut BankAccount,swap_coin:coin::Coin<PIXEL_COIN>,ctx:&mut TxContext){
    let swapper_address = ctx.sender();
    let swap_value= swap_coin.value();
    despoit_pixel_contact(bankaccount,swap_coin,ctx);
    withdraw_al17er_contact(bankaccount,swap_value,swapper_address,ctx);
}