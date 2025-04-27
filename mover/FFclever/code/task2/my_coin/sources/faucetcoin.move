
module my_coin::faucetcoin;
use sui::coin::create_currency;
use std::option::{none, some};
use sui::transfer::{freeze_object, public_freeze_object, public_transfer, public_share_object};
use sui::url::Url;

public struct FAUCETCOIN has drop{}


fun init(rmb:FAUCETCOIN,ctx: &mut TxContext){

    let no = none<Url>();

    let (treasury,coin_metaData) = create_currency(rmb,8,b"FFclever",b"FFclever",b"This is FFclever faucetcoin",no,ctx);

    public_freeze_object(coin_metaData);

    public_share_object(treasury);
}

