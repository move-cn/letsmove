module generate_coin::my_coin;
use sui::coin::{Self, TreasuryCap};
use sui::transfer;
use sui::tx_context::TxContext;

public struct MY_COIN has drop{}

public struct TreasuryCapHolder has key, store{
    id:UID,
    treasury_cap: TreasuryCap<MY_COIN>,
}

const Minter:address=@0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2;

fun init(otw:MY_COIN, ctx: &mut TxContext){
    let(treasury_cap, metadata)=coin::create_currency(
        otw,
        4,
        b"potato89757",
        b"fanshu",
        b"potato is fanshu",
        option::none(),
        ctx
    );

    sui::transfer::public_freeze_object(metadata);

    let treasury_cap_holder = TreasuryCapHolder{
        id: object::new(ctx),
        treasury_cap,
    };
    transfer::public_transfer(treasury_cap_holder,tx_context::sender(ctx));
}

public entry fun mint(treasury: &mut TreasuryCapHolder, minter:address, amount:u64, ctx: &mut TxContext){
    assert!(minter==Minter,0);
    let treasury_cap=&mut treasury.treasury_cap;
    let coin=coin::mint(treasury_cap,amount, ctx);//mint coin
    transfer::public_transfer(coin, minter);//transfer to specific add

}
