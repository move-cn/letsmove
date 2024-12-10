module task2::laolong1994_coin {

    use sui::coin::create_currency;
    use std::option::{none, some};
    use sui::transfer::{ public_transfer, public_freeze_object,public_share_object};
    use sui::url::Url;

    public struct LAOLONG1994_COIN has drop {}


    fun init(usd: LAOLONG1994_COIN, ctx: &mut TxContext) {

        let no = none<Url>();
        // let url = url::new_unsafe_from_bytes(b"https://q2.itc.cn/images01/20240223/cd0cd2f403d944fea1826a3df2f8d60d.png");
        // let yes = some<Url>(url);
        let (treasury, coin_metadata) =
            create_currency(usd, 8, b"Laolong1994_coin", b"Laolong1994_coin", b"this is Laolong1994_coin",no, ctx);

        public_freeze_object(coin_metadata);

        public_share_object(treasury);
    }


}


