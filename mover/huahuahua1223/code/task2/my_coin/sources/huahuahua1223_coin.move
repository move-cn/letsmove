module my_coin::huahuahua1223_coin{
    use sui::coin::create_currency;
    use std::option::{Self, none, some};
    use sui::transfer::{ public_transfer, public_freeze_object };
    use sui::url::{Self, Url};


    public struct HUAHUAHUA1223_COIN has drop {}

    fun init(huahuahua1223_coin: HUAHUAHUA1223_COIN, ctx: &mut TxContext) {
        let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/138219491");
        let yes = some<Url>(url);
        // let no = none<Url>();
        
        let (treasury, coin_metadata) = 
        create_currency(huahuahua1223_coin, 8, b"HUAHUAHUA1223_COIN", b"HUAHUAHUA1223_COIN", b"this is my coin", yes, ctx);

        public_freeze_object(coin_metadata);
        
        public_transfer(treasury, ctx.sender())
    }

}