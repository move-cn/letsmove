module move_coin::hogan;

use std::option::{some};
use sui::url;
use sui::coin::{create_currency, mint, TreasuryCap};
use sui::transfer::{ public_transfer, public_freeze_object};

public struct HOGAN has drop{}

fun init(hogan: HOGAN, ctx: &mut TxContext){
    let url = url::new_unsafe_from_bytes(b"https://0xhogan.4everland.store/Logo.jpg");
    let yes = some<url::Url>(url);
    let (treasury, coin_metadata) = create_currency(
            hogan, 
            8,  
            b"0xHoGan",
            b"0xHoGan",
            b"this is 0xHoGan Coin",
            yes, 
            ctx
            );
    public_freeze_object(coin_metadata);
    public_transfer(treasury, ctx.sender());
}

public entry fun mint_my_coin(cap: &mut TreasuryCap<HOGAN>, amount: u64, recipient: address, ctx: &mut TxContext) {
    let hogan_coin = mint(cap, amount, ctx);
    public_transfer(hogan_coin, recipient);
}