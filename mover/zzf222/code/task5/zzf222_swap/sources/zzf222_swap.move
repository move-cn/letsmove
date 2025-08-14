module zzf222_swap::zzf222_swap{
use sui::object::{Self,UID};
use sui::balance::{Self,Balance};
use sui::coin::{Self,Coin};
use mycoin::zzf222_coin::{Self,ZZF222_COIN};
use mycoin::zzf222_faucet_coin::{Self,ZZF222_FAUCET_COIN};
use sui::tx_context::{Self,TxContext};
use sui::transfer::{Self};
public struct AdminCap has key{id:UID}
public struct Bank has key{id:UID,
zzf222_coin:Balance<ZZF222_COIN>,
zzf222_faucet_coin:Balance<ZZF222_FAUCET_COIN>}
fun init(ctx:&mut TxContext){
    let bank=Bank{id:object::new(ctx),zzf222_coin:balance::zero<ZZF222_COIN>(),
    zzf222_faucet_coin:balance::zero<ZZF222_FAUCET_COIN>()};
    transfer::share_object(bank);
    let admin=AdminCap{id:object::new(ctx)};
    transfer::transfer(admin,tx_context::sender(ctx));
       
}
public entry fun deposit_zzf222_coin(bank:&mut Bank,zzf222_coin:Coin<ZZF222_COIN>,_:&mut TxContext){
        let zzf222_coin_balance = coin::into_balance(zzf222_coin);
        balance::join(&mut bank.zzf222_coin,zzf222_coin_balance);
    }
public entry fun deposit_zzf222_faucetcoin(bank:&mut Bank,zzf222_faucet_coin:Coin<ZZF222_FAUCET_COIN>,
_:&mut TxContext){
    let zzf222_faucet_coin_balance=coin::into_balance(zzf222_faucet_coin);
    balance::join(&mut bank.zzf222_faucet_coin,zzf222_faucet_coin_balance);
}
public entry fun withdraw_zzf222_coin(_:&AdminCap, bank:&mut Bank,amt:u64,ctx:&mut TxContext){
    let zzf222_coin_balance = balance::split(&mut bank.zzf222_coin,amt);
    let zzf222_coin = coin::from_balance(zzf222_coin_balance,ctx);
    transfer::public_transfer(zzf222_coin,tx_context::sender(ctx));
}
public entry fun withdraw_zzf222_faucet_coin(_:&AdminCap,bank:&mut Bank,amt:u64,ctx:&mut TxContext){
    let zzf222_faucet_coin_balance=balance::split(&mut bank.zzf222_faucet_coin,amt);
    let zzf222_faucet_coin=coin::from_balance(zzf222_faucet_coin_balance,ctx);
    transfer::public_transfer(zzf222_faucet_coin,tx_context::sender(ctx));
}
//zzf222_coin:zzf222_faucet_coin=1:2
public entry fun swap_zzf222_coin_to_zzf222_faucet_coin(bank:&mut Bank,zzf222_coin:Coin<ZZF222_COIN>,
ctx:&mut TxContext){
    let amt = coin::value(&zzf222_coin);//balance
    balance::join(&mut bank.zzf222_coin,coin::into_balance(zzf222_coin));//balance
    let amt_zzf222_faucet_coin=amt*1000/2000;//balance
    let zzf222_faucet_coin_balance=balance::split(&mut bank.zzf222_faucet_coin,amt_zzf222_faucet_coin);//balance
    let zzf222_faucet_coin=coin::from_balance(zzf222_faucet_coin_balance,ctx);//coin
    transfer::public_transfer(zzf222_faucet_coin,tx_context::sender(ctx));
}
public entry fun swap_zzf222_faucet_coin_to_zzf222_coin(bank:&mut Bank,zzf222_faucet_coin:Coin<ZZF222_FAUCET_COIN>,
ctx:&mut TxContext){
    let amt=coin::value(&zzf222_faucet_coin);
    balance::join(&mut bank.zzf222_faucet_coin,coin::into_balance(zzf222_faucet_coin));
    let amt_zzf222_coin_balannce=amt*2000/1000;
    let zzf222_coin_balance=balance::split(&mut bank.zzf222_coin,amt_zzf222_coin_balannce);
    let zzf222_coin=coin::from_balance(zzf222_coin_balance,ctx);
    transfer::public_transfer(zzf222_coin,tx_context::sender(ctx));
}
}
