/*
/// Module: coin_swap
module coin_swap::coin_swap;
*/
module coin_swap::coin_swap;

use sui::balance::{Self, Balance};
use sui::coin::{Self, Coin};
use task2::my_token::MY_TOKEN;
use task2::my_token_faucet::MY_TOKEN_FAUCET;

//兑换比
const RATE: u64 = 2;

//报错代码
const ENoBalance: u64 = 0x1111;

//交换代币池，用来中转
public struct CoinSwap has key {
    id: UID,
    coin_bal: Balance<MY_TOKEN>,
    faucet_coin_bal: Balance<MY_TOKEN_FAUCET>,
}

fun init(ctx: &mut TxContext) {
    let swap = CoinSwap {
        id: object::new(ctx),
        coin_bal: balance::zero(),
        faucet_coin_bal: balance::zero(),
    };
    transfer::share_object(swap);
}

//存入代币

public entry fun desipot_my_faucet_token(swap: &mut CoinSwap, faucet_coin: Coin<MY_TOKEN_FAUCET>) {
    let faucet_bal = coin::into_balance(faucet_coin);
    swap.faucet_coin_bal.join(faucet_bal);
}

public entry fun desipot_my_token(swap: &mut CoinSwap, coin: Coin<MY_TOKEN>) {
    let bal = coin::into_balance(coin);
    swap.coin_bal.join(bal);
}

//交换代币
public entry fun swap_token_to_faucet(
    swap: &mut CoinSwap,
    coin: &mut Coin<MY_TOKEN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let faucet = amount*RATE;
    assert!(faucet < swap.faucet_coin_bal.value(), ENoBalance);
    let split_coin_bal = coin::balance_mut(coin).split(amount);
    swap.coin_bal.join(split_coin_bal);
    let faucet = coin::take(
        &mut swap.faucet_coin_bal,
        amount*RATE,
        ctx,
    );
    transfer::public_transfer(faucet, ctx.sender());
}

public entry fun swap_faucet_to_token(
    swap: &mut CoinSwap,
    coin: &mut Coin<MY_TOKEN_FAUCET>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let token = amount/RATE;
    assert!(token < swap.faucet_coin_bal.value(), ENoBalance);

    let split_faucet_coin_bal = coin::balance_mut(coin).split(amount);
    swap.faucet_coin_bal.join(split_faucet_coin_bal);
    let token = coin::take(
        &mut swap.faucet_coin_bal,
        token,
        ctx,
    );
    transfer::public_transfer(token, ctx.sender());
}
