module my_coin::usd {


    use sui::coin::create_currency;
    use std::option::{none, some};
    use sui::url::{Self, Url};
    // use sui::transfer;

    public struct USD has drop {
    }

    fun init(usd: USD, ctx: &mut TxContext) {
        
        let no = none<Url>();
        let url = url::new_unsafe_from_bytes(b"");
        let _yes = some<Url>(url);
        let (treasury, coin_metadata) = 
            create_currency(usd, 8, b"USD", b"USD", b"my usd", no, ctx);
        
        transfer::public_freeze_object(coin_metadata);
        transfer::public_transfer(treasury, ctx.sender());
    }
}


