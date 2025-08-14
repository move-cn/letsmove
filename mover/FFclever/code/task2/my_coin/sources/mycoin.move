
module my_coin::mycoin;
use sui::coin::create_currency;
use std::option::{none, some};
use sui::transfer::{freeze_object, public_freeze_object, public_transfer, public_share_object};
use sui::url::Url;

public struct MYCOIN has drop{}


fun init(usd:MYCOIN,ctx: &mut TxContext){

    let no = none<Url>();

    let (treasury,coin_metaData) = create_currency(usd,8,b"FFclever",b"FFclever",b"This is FFclever coin",no,ctx);

    public_freeze_object(coin_metaData);

    public_transfer(treasury,ctx.sender());
}
