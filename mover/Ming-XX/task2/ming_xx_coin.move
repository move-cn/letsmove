module my_coin::ming_xx_coin;
use sui::coin::{create_currency, TreasuryCap};
use std::option::some;
use sui::coin;
use sui::transfer::{public_freeze_object, public_transfer};
use sui::url::Url;
use sui::url;

public struct MING_XX_COIN has drop{}

fun init(my_coin:MING_XX_COIN,ctx:&mut TxContext){

    let (treasury, coin_metadata)=create_currency(
        my_coin,
        8,
        b"MY_COIN",
        b"MING_XX",
        b"this is MYCOIN",
        some<Url>(url::new_unsafe_from_bytes(b"https://img1.baidu.com/it/u=22878553,612949489&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=1067")),
        ctx,
    );

    public_freeze_object(coin_metadata);
    public_transfer(treasury,ctx.sender());
}

public entry fun mint(treasury:&mut TreasuryCap<MING_XX_COIN>,amout:u64,recipient:address,ctx:&mut TxContext){
    coin::mint_and_transfer(treasury,amout,recipient,ctx);
}