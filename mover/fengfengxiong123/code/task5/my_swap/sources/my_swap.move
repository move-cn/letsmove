/*
/// Module: my_swap
module my_swap::my_swap;
*/

module my_swap::my_swap;
use my_coin::dao::DAO;
use my_coin::faucetcoin::FAUCETCOIN;
use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::{into_balance, from_balance};
use sui::token::from_coin;
use sui::coin::Coin;

public struct MyBank has key {
    id: UID,
    doc_coin: Balance<DAO>,
    faucet_coin: Balance<FAUCETCOIN>
}

public struct AdminCap {}

public fun init(ctx: &mut TxContext) {
    let bank = MyBank {
        id: object::new(ctx),
        doc_coin: balance::zero<DAO>(),
        faucet_coin: balance::zero<FAUCETCOIN>()
    };
    transfer::public_share_object(bank, ctx.sender())
}

public entry fun in_dao(bank: &mut MyBank, in: Coin<DAO>, _: &mut TxContext) {
    let dao_coin = into_balance(in);
    bank.doc_coin.join(dao_coin);
}

public entry fun in_faucet(bank: &mut MyBank, in: Coin<FAUCETCOIN>, _: &mut TxContext) {
    let faucet_coin = into_balance(in);
    bank.faucet_coin.join(faucet_coin);
}

public entry fun dao_to_faucet(bank: &mut MyBank, in: Coin<DAO>, ctx: &mut TxContext) {
    let faucet = bank.faucet_coin.split(in.value() * 7);
    let out_faucet = from_balance(faucet, ctx);
    transfer::transfer(out_faucet, ctx::sender());
}