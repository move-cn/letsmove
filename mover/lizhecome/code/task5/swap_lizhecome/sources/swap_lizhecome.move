// Module: swap_lizhecome
module swap_lizhecome::swap_lizhecome;

use faucetcoin::lizhecome_faucet_coin::LIZHECOME_FAUCET_COIN;
use mycoin::lizhecome_coin::LIZHECOME_COIN;
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
    lizhecome:Balance<LIZHECOME_COIN>,
    lizhecome_faucet:Balance<LIZHECOME_FAUCET_COIN>
}

fun init(ctx:&mut TxContext){
    let bank = Bank {
        id:object::new(ctx),
        lizhecome:balance::zero<LIZHECOME_COIN>(),
        lizhecome_faucet:balance::zero<LIZHECOME_FAUCET_COIN>()
    };
    share_object(bank);
    let admin_cap = AdminCap { id:object::new(ctx) };
    transfer(admin_cap,ctx.sender());
}

public entry fun deposit_lizhecome(_:&AdminCap,bank:&mut Bank,lizhecome:Coin<LIZHECOME_COIN>,_:&mut TxContext){
    let lizhecome_balance = coin::into_balance(lizhecome);
    balance::join(&mut bank.lizhecome, lizhecome_balance);
}

public entry fun deposit_lizhecome_faucet(_:&AdminCap,bank:&mut Bank,lizhecome_faucet:Coin<LIZHECOME_FAUCET_COIN>,_:&mut TxContext){
    let lizhecome_faucet_balance = coin::into_balance(lizhecome_faucet);
    balance::join(&mut bank.lizhecome_faucet, lizhecome_faucet_balance);
}

public entry fun withdraw_lizhecome(_:&AdminCap,bank:&mut Bank,amount:u64,ctx:&mut TxContext){
    let lizhecome_balance = balance::split(&mut bank.lizhecome, amount);
    let lizhecome= coin::from_balance(lizhecome_balance, ctx);
    public_transfer(lizhecome,ctx.sender());
}

public entry fun withdraw_lizhecome_faucet(_:&AdminCap,bank:&mut Bank,amount:u64,ctx:&mut TxContext){
    let lizhecome_faucet_balance = balance::split(&mut bank.lizhecome_faucet, amount);
    let lizhecome_faucet= coin::from_balance(lizhecome_faucet_balance, ctx);
    public_transfer(lizhecome_faucet,ctx.sender());
}
// 1 lizhecome = 2 lizhecome_faucet
public entry fun swap_lizhecome_to_faucet(bank:&mut Bank,lizhecome:Coin<LIZHECOME_COIN>,ctx:&mut TxContext){
    let amount = coin::value(&lizhecome);
    balance::join(&mut bank.lizhecome, coin::into_balance(lizhecome));

    let amount_end = amount * 2;
    let faucet = balance::split(&mut bank.lizhecome_faucet, amount_end);
    public_transfer(coin::from_balance(faucet, ctx), ctx.sender());

}

// 1 lizhecome = 2 lizhecome_faucet
public entry fun swap_faucet_to_lizhecome(bank:&mut Bank,lizhecome_faucet:Coin<LIZHECOME_FAUCET_COIN>,ctx:&mut TxContext){
    let amount = coin::value(&lizhecome_faucet);
    balance::join(&mut bank.lizhecome_faucet, coin::into_balance(lizhecome_faucet));

    let amount_end = amount / 2;
    let lizhecome = balance::split(&mut bank.lizhecome, amount_end);
    public_transfer(coin::from_balance(lizhecome, ctx), ctx.sender());

}