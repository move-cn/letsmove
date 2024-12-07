module pebblerwon::pebblerwon_swap;

use whn_coin::whn_coin::WHN_COIN;
use whn_coin_facuet::whn_coin::WHN_COIN as WHN_COIN_FACUET;
use sui::balance::{Balance,zero};
use sui::coin;
use sui::coin::{Coin};


public struct AdminCap has key {
    id:UID
}

public struct Bank has key {
    id: UID,
    whn_coin: Balance<WHN_COIN>,
    whn_coin_facuet: Balance<WHN_COIN_FACUET>,
}
fun init(ctx: &mut TxContext){
    let bank = Bank{
        id:object::new(ctx),
        whn_coin:zero(),
        whn_coin_facuet:zero()
    };
    transfer::share_object(bank);
    let admin_cap = AdminCap{
        id: object::new(ctx)
    };
    transfer::transfer(admin_cap,ctx.sender())
}

public entry fun deposit_whn(bank: &mut Bank,in: Coin<WHN_COIN>, _:&mut TxContext){
    let balance = coin::into_balance(in);
    bank.whn_coin.join(balance);

}
public entry fun deposit_whn_facuet(bank: &mut Bank, in: Coin<WHN_COIN_FACUET>,_:&mut TxContext){
    let balance = coin::into_balance(in);
    bank.whn_coin_facuet.join(balance);
}
public entry fun withdraw_whn_coin(_: &AdminCap,bank:&mut Bank, amount:u64, ctx:&mut TxContext ){
    assert!(bank.whn_coin.value()>amount,0x100);
    let b = bank.whn_coin.split(amount);
    let c = coin::from_balance(b, ctx);
    transfer::public_transfer(c, ctx.sender());
}
public entry fun withdraw_whn_coin_facuet(_:&AdminCap,bank:&mut Bank,amount:u64, ctx: &mut TxContext){
    assert!(bank.whn_coin_facuet.value()>amount,0x101);
    let b = bank.whn_coin_facuet.split(amount);
    let c = coin::from_balance(b, ctx);
    transfer::public_transfer(c, ctx.sender());
}

public entry fun swap_coin_to_facuet(bank:&mut Bank,w: Coin<WHN_COIN>,ctx:&mut TxContext){
    let v = w.value();
    bank.whn_coin.join(coin::into_balance(w));



    let facuet_amount = v*1;
    let facuet_balance = bank.whn_coin_facuet.split(facuet_amount);

    let facuet_coin = coin::from_balance(facuet_balance, ctx);
    transfer::public_transfer(facuet_coin, ctx.sender());

}

public entry fun swap_facuet_to_coin(bank:&mut Bank,f: Coin<WHN_COIN_FACUET>,ctx:&mut TxContext){
    let v = f.value();
    bank.whn_coin_facuet.join(coin::into_balance(f));

    let coin_amount = v/1;

    let coin_balance = bank.whn_coin.split(coin_amount);
    let c = coin::from_balance(coin_balance, ctx);

    transfer::public_transfer(c, ctx.sender());
}