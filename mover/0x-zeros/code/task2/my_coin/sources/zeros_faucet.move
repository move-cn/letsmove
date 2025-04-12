module my_coin::zeros_faucet;

use sui::coin::create_currency;
use std::option::{none, some};
use sui::transfer::{public_share_object, public_freeze_object};
use sui::url::Url;

public struct ZEROS_FAUCET has drop {}


fun init(otw: ZEROS_FAUCET, ctx: &mut TxContext) {

    // https://github.com/MystenLabs/sui/blob/main/crates/sui-framework/packages/sui-framework/sources/coin.move#L211
    
    // let icon_url = url::new_unsafe_from_bytes(b"https://0x-zeros.com");
    // let coin_icon = some<Url>(url);

    let icon_url = none<Url>();

    let (treasury_cap, coin_metadata) = 
        create_currency(otw, 6, b"ZEROS_F", b"ZEROS FAUCET coin", b"ZEROS FAUCET coin description", icon_url, ctx);

    public_freeze_object(coin_metadata);
    public_share_object(treasury_cap);
}







