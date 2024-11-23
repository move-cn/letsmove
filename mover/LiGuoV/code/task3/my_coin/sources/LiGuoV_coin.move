module my_coin::LiGuoV_coin;
use std::option::some;
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_transfer};
use sui::url;
public struct LIGUOV_COIN has drop {

}
fun init(coin:LIGUOV_COIN,ctx:&mut TxContext){
    let url = url::new_unsafe_from_bytes(b"https://static.wikia.nocookie.net/sanrio/images/1/10/Hello-kitty.png/revision/latest/scale-to-width-down/280?cb=20171105235741");
    let url = some(url);
    let (treasury_cap,coin_metadata) = create_currency(
        coin,
        2,
        b"LiGuoVCoin",b"liguowei coin",b"玩玩",
        url,ctx
    );
    public_freeze_object(coin_metadata);
    public_transfer(treasury_cap,ctx.sender());
}