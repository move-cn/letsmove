module swap::swap;

use faucetcoin::krypton_faucet_coin::KRYPTON_FAUCET_COIN;
use mycoin::krypton_coin::KRYPTON_COIN;
use sui::balance::{Self,Balance};
use sui::transfer::{transfer,share_object,public_transfer};
use sui::coin::{Self,Coin};
// 定义管理员能力
public struct AdminCap has key{
    id: UID
}

// 定义银行结构体
public struct Bank has key{
    id: UID,
    krypton:Balance<KRYPTON_COIN>,
    krypton_faucet_coin:Balance<KRYPTON_FAUCET_COIN>
}

fun init(ctx:&mut TxContext){
    let bank = Bank {
        id:object::new(ctx),
        krypton:balance::zero<KRYPTON_COIN>(),
        krypton_faucet_coin:balance::zero<KRYPTON_FAUCET_COIN>()
    };
    share_object(bank);
    let admin_cap = AdminCap { id:object::new(ctx) };
    transfer(admin_cap,ctx.sender());
}

public entry fun deposit(
    _:&AdminCap,
    bank:&mut Bank,
    krypton:Coin<KRYPTON_COIN>,
    _:&mut TxContext
    ){
    let krypton_balance = coin::into_balance(krypton);
    balance::join(&mut bank.krypton, krypton_balance);
}

public entry fun deposit_faucet(
    _:&AdminCap,
    bank:&mut Bank,
    krypton_faucet_coin:Coin<KRYPTON_FAUCET_COIN>,
    _:&mut TxContext
    ){
    let krypton_faucet_balance = coin::into_balance(krypton_faucet_coin);
    balance::join(&mut bank.krypton_faucet_coin, krypton_faucet_balance);
}

public entry fun withdraw(
    _:&AdminCap,
    bank:&mut Bank,
    amount:u64,
    ctx:&mut TxContext
    ){
    let krypton_balance = balance::split(&mut bank.krypton, amount);
    let krypton= coin::from_balance(krypton_balance, ctx);
    public_transfer(krypton,ctx.sender());
}

public entry fun withdraw_krypton_faucet(
    _:&AdminCap,
    bank:&mut Bank,
    amount:u64,
    ctx:&mut TxContext
    ){
    let krypton_faucet_balance = balance::split(&mut bank.krypton_faucet_coin, amount);
    let krypton_faucet_coin= coin::from_balance(krypton_faucet_balance, ctx);
    public_transfer(krypton_faucet_coin,ctx.sender());
}

public entry fun swap_a_to_b(
    bank:&mut Bank,
    krypton:Coin<KRYPTON_COIN>,
    ctx:&mut TxContext
    ){
    let amount = coin::value(&krypton);
    balance::join(&mut bank.krypton, coin::into_balance(krypton));

    let amount_end = amount * 2;
    let faucet = balance::split(&mut bank.krypton_faucet_coin, amount_end);
    public_transfer(coin::from_balance(faucet, ctx), ctx.sender());

}


public entry fun swap_b_to_a(
    bank:&mut Bank,
    krypton_faucet_coin:Coin<KRYPTON_FAUCET_COIN>,
    ctx:&mut TxContext
    ){
    let amount = coin::value(&krypton_faucet_coin);
    balance::join(&mut bank.krypton_faucet_coin, coin::into_balance(krypton_faucet_coin));

    let amount_end = amount / 2;
    let krypton = balance::split(&mut bank.krypton, amount_end);
    public_transfer(coin::from_balance(krypton, ctx), ctx.sender());

}