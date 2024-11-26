module my_coin::meme;

use sui::url::{Self, Url};
use sui::coin::{create_currency};
use std::option::{some};

use sui::transfer::{public_freeze_object, public_share_object};

public struct MEME has drop {}

fun init(witness: MEME, ctx: &mut TxContext) {
    // let no = none<Url>();
    let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/162699534");
    let icon_url = some<Url>(url);
    let (treasury, coin_meta) = create_currency(witness, 18, b"MEME", b"MEME", b"sahab's meme token", icon_url, ctx);

    public_freeze_object(coin_meta);

    public_share_object(treasury);
}