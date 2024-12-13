module generate_coin::faucet_coin;
use sui::coin::{Self, TreasuryCap};
use sui::tx_context::TxContext;
use sui::transfer::public_freeze_object;

public struct FAUCET_COIN has drop{}

public struct TreasuryCapHolder has key, store{
    id:UID,
    treasury_cap: TreasuryCap<FAUCET_COIN>,
}

fun init(otw:FAUCET_COIN, ctx: &mut TxContext){
    let (treasury_cap, metadata) = coin::create_currency(
        otw,
        4,
        b"potato89757_faucet",
        b"fanshuF",
        b"potato is fanshu yeah :3",
        option::none(),
        ctx,
    );
    public_freeze_object(metadata);

    let treasury_cap_holder = TreasuryCapHolder{
        id: object::new(ctx),
        treasury_cap
    };
    transfer::share_object(treasury_cap_holder)
}

public entry fun mint(treasury: &mut TreasuryCapHolder, ctx: &mut TxContext){
    let sender= tx_context::sender(ctx);
    let treasury_cap= &mut treasury.treasury_cap;
    let coin= coin::mint(treasury_cap,10, ctx);//mint coin
    transfer::public_transfer(coin, sender);//transfer to specific add
}

