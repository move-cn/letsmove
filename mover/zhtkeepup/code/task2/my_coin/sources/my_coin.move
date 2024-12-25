
/// Module: my_coin
module my_coin::my_coin;

use std::option::{none, some};
use sui::coin;
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_transfer, public_share_object};
use sui::url;
use sui::url::Url;

public struct MY_COIN has drop {

}

fun init(my_coin:MY_COIN, ctx: &mut TxContext) {

    let no:Option<Url> = none<Url>();
    let url = url::new_unsafe_from_bytes(b"https://etherscan.io/token/images/centre-usdc_28.png");
    let yes = some<Url>(url);

    let (treasury, coin_metadata) = create_currency(my_coin,8,b"MyCoin",b"MyCoin",b"my coin.",no,ctx);

    public_freeze_object(coin_metadata);

    // public_share_object(treasury);
    public_transfer(treasury, ctx.sender());
}