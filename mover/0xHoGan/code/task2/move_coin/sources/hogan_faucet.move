module move_coin::hogan_faucet;

use std::option::{some};
use sui::url;
use sui::coin::{create_currency, mint, TreasuryCap};
use sui::transfer::{public_freeze_object, public_share_object, public_transfer};

public struct HOGAN_FAUCET has drop{}

fun init(hogan_faucet: HOGAN_FAUCET, ctx: &mut TxContext) {
    let url = url::new_unsafe_from_bytes(b"https://0xhogan.4everland.store/Logo.jpg");
    let yes = some<url::Url>(url);
    let (treasury, coin_metadata) = create_currency(
            hogan_faucet, 
            8,  
            b"0xHoGan Faucet",
            b"0xHoGan Faucet",
            b"this is 0xHoGan Faucet",
            yes, 
            ctx
            );
    public_freeze_object(coin_metadata);
    public_share_object(treasury);
}

public entry fun mint_faucet_coin(cap: &mut TreasuryCap<HOGAN_FAUCET>, amount: u64, recipient_one: address, recipient_two: address, ctx: &mut TxContext) {
    let hogan_faucet = mint(cap, amount, ctx);
    public_transfer(hogan_faucet,recipient_one);

    let hogan_faucet = mint(cap, amount, ctx);
    public_transfer(hogan_faucet,recipient_two);
}