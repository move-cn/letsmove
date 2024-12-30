module task2::faucet;
use std::option::{Option, none};
use sui::coin::{create_currency, mint_and_transfer} ;
use sui::transfer::{freeze_object, public_transfer, public_freeze_object, public_share_object};
use sui::url::Url;

public struct FAUCET has drop {}

fun init(faucet: FAUCET, ctx: &mut TxContext) {
    let no = none<Url>();
    // let url = url::new_unsafe_frome_bytes(b"");
    let (treasury, coin_metadata) = create_currency(
        faucet,
        8,
        b"FAUCET",
        b"faucet",
        b"faucet coin",
        no,
        ctx,
    );

    public_freeze_object(coin_metadata);
    public_share_object(treasury);
}