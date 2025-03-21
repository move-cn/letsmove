module my_coin::mycoinFaucet;
use std::option::{Option,none,some};
use sui::coin::create_currency;

use sui::transfer::{public_freeze_object, public_share_object};
use sui::url;

use sui::url::Url;

public struct MYCOINFAUCET has drop {}

fun init(coin:MYCOINFAUCET, ctx: &mut TxContext) {
let no: Option<Url> = none<Url>();
let url: Url = url::new_unsafe_from_bytes(b"");
let yes: Option<Url> = some<Url>(url);
let (treasury, coin_metadata) =
create_currency(coin, 8, b"Banksy-w Faucet", b"Banksy-w Faucet", b"This is Banksy-w Faucet coin", no, ctx);

public_freeze_object(coin_metadata);
public_share_object(treasury)







}
