module my_coin::zeros;

use sui::coin::create_currency;
use std::option::{none, some};
use sui::transfer::{public_transfer, public_freeze_object};
use sui::url::Url;

public struct ZEROS has drop {}


fun init(otw: ZEROS, ctx: &mut TxContext) {

    // https://github.com/MystenLabs/sui/blob/main/crates/sui-framework/packages/sui-framework/sources/coin.move#L211
    
    // let icon_url = url::new_unsafe_from_bytes(b"https://0x-zeros.com");
    // let coin_icon = some<Url>(url);

    let icon_url = none<Url>();

    let (treasury_cap, coin_metadata) = 
        create_currency(otw, 6, b"ZEROS", b"ZEROS coin", b"ZEROS coin description", icon_url, ctx);

    public_freeze_object(coin_metadata);
    public_transfer(treasury_cap, ctx.sender());
}







