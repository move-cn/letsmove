
/// Module: my_coin
module my_coin::faucet_coin;

use std::option::{none, some};
use sui::coin;
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_transfer, public_share_object};
use sui::url;
use sui::url::Url;

public struct FAUCET_COIN has drop {

}

fun init(faucet_coin:FAUCET_COIN, ctx: &mut TxContext) {

    let no:Option<Url> = none<Url>();
    let url = url::new_unsafe_from_bytes(b"https://etherscan.io/token/images/centre-usdc_28.png");
    let yes = some<Url>(url);

    let (treasury, coin_metadata) = create_currency(faucet_coin,8,b"FaucetCoin",b"FaucetCoin",b"faucet coin.",no,ctx);

    public_freeze_object(coin_metadata);

    public_share_object(treasury);
    // public_transfer(treasury, ctx.sender());
}