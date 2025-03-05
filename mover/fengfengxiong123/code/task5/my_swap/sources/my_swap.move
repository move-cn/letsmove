module my_swap::my_swap;
use my_coin::dao::DAO;
use my_coin::faucetcoin::FAUCETCOIN;
use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::{into_balance, from_balance};
use sui::coin::Coin;

public struct MyBank has key, store {
    id: UID,
    doc_coin: Balance<DAO>,
    faucet_coin: Balance<FAUCETCOIN>
}

public struct AdminCap has key, store { id: UID }

fun init(ctx: &mut TxContext) {
    let bank = MyBank {
        id: object::new(ctx),
        doc_coin: balance::zero<DAO>(),
        faucet_coin: balance::zero<FAUCETCOIN>()
    };
    let admin = AdminCap { id: object::new(ctx) };
    transfer::public_share_object(bank);
    transfer::transfer(admin, ctx.sender())
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
    let dao_in = into_balance(in);
    let faucet = bank.faucet_coin.split(dao_in.value() * 7);
    bank.doc_coin.join(dao_in);
    let out_faucet = from_balance(faucet, ctx);
    transfer::public_transfer(out_faucet, ctx.sender())
}

public entry fun faucet_to_dao(bank: &mut MyBank, in: Coin<FAUCETCOIN>, ctx: &mut TxContext) {
    let faucet_in = into_balance(in);
    let dao = bank.doc_coin.split(faucet_in.value() / 7);
    bank.faucet_coin.join(faucet_in);
    let out_dao = from_balance(dao, ctx);
    transfer::public_transfer(out_dao, ctx.sender())
}

public entry fun remove_dao(_: &AdminCap, bank: &mut MyBank, dao_amt: u64, ctx: &mut TxContext) {
    if (bank.doc_coin.value() < dao_amt) {
        abort 101
    };
    let dao_coin = bank.doc_coin.split(dao_amt);
    let dao_ = coin::from_balance(dao_coin, ctx);
    transfer::public_transfer(dao_, ctx.sender());
}

public entry fun remove_faucet(_: &AdminCap, bank: &mut MyBank, faucet_amt: u64, ctx: &mut TxContext) {
    if (bank.faucet_coin.value() < faucet_amt) {
        abort 102
    };

    let faucet_coin = bank.faucet_coin.split(faucet_amt);
    let faucet_ = coin::from_balance(faucet_coin, ctx);
    transfer::public_transfer(faucet_, ctx.sender());
}