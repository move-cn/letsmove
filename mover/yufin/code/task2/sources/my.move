module task2::mycoin;
use std::option::{Option, none};
use sui::coin::{create_currency, mint_and_transfer} ;
use sui::transfer::{freeze_object, public_transfer, public_freeze_object};
use sui::url::Url;

public struct MYCOIN has drop {}

fun init(my_coin: MYCOIN, ctx: &mut TxContext) {
    let no = none<Url>();
    // let url = url::new_unsafe_frome_bytes(b"");

    let (treasury, coin_metadata) = create_currency(
        my_coin,
        8,
        b"MY",
        b"mycoin",
        b"my coin",
        no,
        ctx,
    );

    public_freeze_object(coin_metadata);
    public_transfer(treasury, ctx.sender());


}