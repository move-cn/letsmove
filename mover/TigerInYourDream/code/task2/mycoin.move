module task2::mycoin {
    use std::option;
    use sui::coin::{Self,Coin,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Url,Self};

    struct MYCOIN has drop {}

    fun init(waitness: MYCOIN, ctx: &mut sui::tx_context::TxContext) {
        let (treasury_cap, meta) = coin::create_currency(waitness,2,b"MYCOIN", b"M$N", b"", 
        option::some<Url>(url::new_unsafe_from_bytes(b"https://gravatar.com/avatar/28156c4954bb094df294c71730cfd71f?s=200&d=wavatar&r=pg")), ctx);

        transfer::public_freeze_object(meta);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(
        treasury_cap: &mut TreasuryCap<MYCOIN>, coin : Coin<MYCOIN>, _ctx: &mut TxContext
    ) {
        coin::burn(treasury_cap, coin);
    }
}
