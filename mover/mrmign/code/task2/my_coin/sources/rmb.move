module my_coin::rmb {


    use sui::coin::create_currency;
    use std::option::{none, some};
    use sui::url::{Self, Url};
    // use sui::transfer;

    public struct RMB has drop {
    }

    fun init(usd: RMB, ctx: &mut TxContext) {
        
        let no = none<Url>();
        let url = url::new_unsafe_from_bytes(b"");
        let _yes = some<Url>(url);
        let (treasury, coin_metadata) = 
            create_currency(usd, 8, b"RMB", b"RMB", b"this is RMB", no, ctx);
        
        transfer::public_freeze_object(coin_metadata);
        transfer::public_share_object(treasury);
    }
}


