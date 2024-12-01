module my_coin::ming_xx_faucet_coin;
use sui::coin::{create_currency, TreasuryCap};
use sui::coin;
use std::option::some;
use sui::transfer::{public_freeze_object, public_share_object};
use sui::url::Url;
use sui::url;

public struct MING_XX_FAUCET_COIN has drop{}

fun init(my_faucet_coin:MING_XX_FAUCET_COIN,ctx:&mut TxContext){

    let (treasury, coin_metadata)=create_currency(
        my_faucet_coin,
        8,
        b"MY_FAUCET_COIN",
        b"MING_XX_FAUCET",
        b"this is FAUCETCOIN",
        some<Url>(url::new_unsafe_from_bytes(b"https://img2.baidu.com/it/u=3094430203,904462832&fm=253&fmt=auto&app=120&f=JPEG?w=600&h=556")),
        ctx,
    );

    public_freeze_object(coin_metadata);

    public_share_object(treasury);
}

public entry fun mint(treasury:&mut TreasuryCap<MING_XX_FAUCET_COIN>,amout:u64,recipient:address,ctx:&mut TxContext){
    coin::mint_and_transfer(treasury,amout,recipient,ctx);
}