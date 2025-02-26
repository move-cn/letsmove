module taciturneyescoin::taciturneyescoin;

use sui::coin::create_currency;
use std::option::{none};
use sui::url::Url;
use sui::transfer::{public_freeze_object,public_transfer};


public struct TACIRUENEYESCOIN has drop {}

fun init(coin:TACIRURNENEYESCOIN , ctx:&mut TxContext){
    let (treasurycap,coin_metadata)  = create_currency(coin,
    3,
    b"TAC",
    b"TACITURNEYESCOIN",
    b"this is Taciturn Eyes Coin",
    none<Url>(),
    ctx
    );
    public_freeze_object(coin_metadata);
    public_transfer(treasurycap,ctx.sender());
}

/*
public fun create_currency<T: drop>(
    witness: T,
    decimals: u8,
    symbol: vector<u8>,
    name: vector<u8>,
    description: vector<u8>,
    icon_url: Option<Url>,
    ctx: &mut TxContext,
)
*/