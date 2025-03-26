
module hello_swap::hello_swap;

use handsomepuddingfaucet::handsomepuddingfaucet::{HANDSOMEPUDDINGFAUCET};
use handsomepudding::handsomepudding::{HANDSOMEPUDDING};
use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::Coin;
use sui::object;
use sui::transfer;

public struct AdminCap has key {
    id: UID
}

public struct Bank<phantom HANDSOMEPUDDING, phantom HANDSOMEPUDDINGFAUCET> has key{
    id : UID,
    coin_a: Balance<HANDSOMEPUDDING>,
    coin_b: Balance<HANDSOMEPUDDINGFAUCET>
}

fun init(ctx: &mut TxContext){
    let adminCap = AdminCap{id : object::new(ctx)};
    transfer::transfer(adminCap, ctx.sender());
}

public entry fun creatBank<HANDSOMEPUDDING, HANDSOMEPUDDINGFAUCET>(ctx: &mut TxContext){
    let bank = Bank<HANDSOMEPUDDING, HANDSOMEPUDDINGFAUCET>{
        id: object::new(ctx),
        coin_a: balance::zero(),
        coin_b: balance::zero()
    };
    transfer::share_object(bank);
}

public entry fun deposit_a<HANDSOMEPUDDING>(bank: &mut Bank<HANDSOMEPUDDING, HANDSOMEPUDDINGFAUCET>, a: Coin<HANDSOMEPUDDING>){
    let a_balance = coin::into_balance(a);
    balance::join(&mut bank.coin_a, a_balance);
}

public entry fun deposit_b<HANDSOMEPUDDINGFAUCET>(bank: &mut Bank<HANDSOMEPUDDING, HANDSOMEPUDDINGFAUCET>, b: Coin<HANDSOMEPUDDINGFAUCET>){
    let b_balance = coin::into_balance(b);
    balance::join(&mut bank.coin_b, b_balance);
}

public entry fun withdraw_a<HANDSOMEPUDDING>(_: &AdminCap,bank: &mut Bank<HANDSOMEPUDDING, HANDSOMEPUDDINGFAUCET>, amount: u64, ctx: &mut TxContext){
    let a_balance = balance::split(&mut bank.coin_a, amount);
    let coin_a = coin::from_balance(a_balance, ctx);
    transfer::public_transfer(coin_a, ctx.sender());
}

public entry fun withdraw_b<HANDSOMEPUDDINGFAUCET>(_: &AdminCap,bank: &mut Bank<HANDSOMEPUDDING, HANDSOMEPUDDINGFAUCET>, amount: u64, ctx: &mut TxContext){
    let b_balance = balance::split(&mut bank.coin_b, amount);
    let coin_b = coin::from_balance(b_balance, ctx);
    transfer::public_transfer(coin_b, ctx.sender());
}

public entry fun swap_a_to_b<HANDSOMEPUDDING, HANDSOMEPUDDINGFAUCET>(bank: &mut Bank<HANDSOMEPUDDING, HANDSOMEPUDDINGFAUCET>, a: Coin<HANDSOMEPUDDING>, ctx: &mut TxContext){
    let amt = coin::value(& a);
    balance::join(&mut bank.coin_a, coin::into_balance(a));
    let b_balance = balance::split(&mut bank.coin_b, amt);
    let coin_b = coin::from_balance(b_balance, ctx);
    transfer::public_transfer(coin_b, ctx.sender());
}

public entry fun swap_b_to_a<HANDSOMEPUDDING, HANDSOMEPUDDINGFAUCET>(bank: &mut Bank<HANDSOMEPUDDING, HANDSOMEPUDDINGFAUCET>, b: Coin<HANDSOMEPUDDINGFAUCET>, ctx: &mut TxContext){
    let amt = coin::value(& b);
    balance::join(&mut bank.coin_b, coin::into_balance(b));
    let a_balance = balance::split(&mut bank.coin_a, amt);
    let coin_a = coin::from_balance(a_balance, ctx);
    transfer::public_transfer(coin_a, ctx.sender());
}