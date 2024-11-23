module my_coin::LiGuoV_faucet_coin;
use std::option::some;
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_share_object};
use sui::url;
public struct LIGUOV_FAUCET_COIN has drop {

}
fun init(coin:LIGUOV_FAUCET_COIN,ctx:&mut TxContext){
    let url = url::new_unsafe_from_bytes(b"https://static.wikia.nocookie.net/sanrio/images/1/10/Hello-kitty.png/revision/latest/scale-to-width-down/280?cb=20171105235741");
    let url = some(url);
    let (treasury_cap,coin_metadata) = create_currency(
        coin,
        2,
        b"LiGuoV FAUCET Coin",b"liguowei faucet coin",b"玩玩",
        url,ctx
    );
    public_freeze_object(coin_metadata);
    public_share_object(treasury_cap);
}