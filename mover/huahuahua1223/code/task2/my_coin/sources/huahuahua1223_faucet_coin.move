module my_coin::huahuahua1223_faucet_coin{
    use sui::coin::create_currency;
    use std::option::{Self, none, some};
    use sui::transfer::{ public_share_object, public_freeze_object };
    use sui::url::{Self, Url};


    public struct HUAHUAHUA1223_FAUCET_COIN has drop {}

    fun init(huahuahua1223_faucet_coin: HUAHUAHUA1223_FAUCET_COIN, ctx: &mut TxContext) {
        let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/138219491");
        let yes = some<Url>(url);
        // let no = none<Url>();
        
        let (treasury, coin_metadata) = 
        create_currency(huahuahua1223_faucet_coin,   8, b"HUAHUAHUA1223_FAUCET_COIN", b"HUAHUAHUA1223_FAUCET_COIN", b"this is my faucet coin", yes, ctx);

        public_freeze_object(coin_metadata);
        
        public_share_object(treasury)
    }

}