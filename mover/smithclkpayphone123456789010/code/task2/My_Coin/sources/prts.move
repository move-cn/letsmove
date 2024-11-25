module my_coin::prts;
use sui::coin::create_currency;
use std::option::{none, some};
use sui::transfer::{public_freeze_object, public_transfer};
use sui::url::Url;
use sui::url;

public struct PRTS has drop{}



fun init(prts:PRTS, ctx: &mut TxContext) {

    let no = none<Url>();         // "variable no means The set image is empty."
    let url = url::new_unsafe_from_bytes(b"https://patchwiki.biligame.com/images/arknights/thumb/0/0f/t5ygg18f380pcqvwt22rrplk11pv734.png/180px-%E9%BE%99%E9%97%A8%E5%B8%81.png"); // variable url is the url of picture you want
    let yes = some<Url>(url);     // The variable `yes` holds a `Some` variant containing the `Url` instance, which is the URL of the image you want to use.
    let(treasury,coin_metadata) =
        create_currency(prts,8,b"PRTS",b"Longmen_Coin",b"Currency issued by Longmen, with wide-ranging uses.",yes,ctx);

    public_freeze_object(coin_metadata); //The public_freeze_object method freezes the passed object,the object contains the data of your own coin .

    public_transfer(treasury,ctx.sender()); // The token is transferred from the transaction sender's account (ctx.sender()) to the target account (treasury).
}
/* Minting your own coin */