module xiaxianlin::swap;

use sui::balance::{Self, Balance};
use sui::coin::Coin;
use task2::faucet_coin::FAUCET_COIN;
use task2::my_coin::MY_COIN;

public struct Bank has key {
    id: UID,
    my_coin: Balance<MY_COIN>,
    faucet_coin: Balance<FAUCET_COIN>,
}

public struct BankCap has key {
    id: UID,
}

fun init(ctx: &mut TxContext) {
    let bank = Bank {
        id: object::new(ctx),
        my_coin: balance::zero(),
        faucet_coin: balance::zero(),
    };

    transfer::share_object(bank);

    let bank_cap = BankCap { id: object::new(ctx) };
    transfer::transfer(bank_cap, ctx.sender());
}

public fun deposit_my_coin(bank: &mut Bank, in: Coin<MY_COIN>, _: &mut TxContext) {
    bank.my_coin.join(in.into_balance());
}

public fun deposit_faucet_coin(bank: &mut Bank, in: Coin<FAUCET_COIN>, _: &mut TxContext) {
    bank.faucet_coin.join(in.into_balance());
}

/// 1 MY_COIN = 10 FAUCET_COIN
#[allow(lint(self_transfer))]
public fun my_to_faucet(bank: &mut Bank, in: Coin<MY_COIN>, ctx: &mut TxContext) {
    let my_amount = in.value();
    let faucet_amount = my_amount * 10;

    bank.my_coin.join(in.into_balance());
    let faucet_balance = bank.faucet_coin.split(faucet_amount);

    transfer::public_transfer(faucet_balance.into_coin(ctx), ctx.sender());
}

#[allow(lint(self_transfer))]
public fun faucet_to_my(bank: &mut Bank, in: Coin<FAUCET_COIN>, ctx: &mut TxContext) {
    let faucet_amount = in.value();
    let my_amount = faucet_amount / 10;

    bank.faucet_coin.join(in.into_balance());
    let my_balance = bank.my_coin.split(my_amount);

    transfer::public_transfer(my_balance.into_coin(ctx), ctx.sender());
}

#[allow(lint(self_transfer))]
public fun withdraw_my_coin(_: &BankCap, bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
    let balance = bank.my_coin.split(amount);
    transfer::public_transfer(balance.into_coin(ctx), ctx.sender());
}

#[allow(lint(self_transfer))]
public fun withdraw_faucet_coin(_: &BankCap, bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
    let balance = bank.faucet_coin.split(amount);
    transfer::public_transfer(balance.into_coin(ctx), ctx.sender());
}
