module mycoin::mycoin {
    use std::option;
    use sui::coin::{Self,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Url,Self};

    struct MYCOIN has drop {}

    fun init(waitness: MYCOIN, ctx: &mut sui::tx_context::TxContext) {
        let (treasury_cap, meta) = coin::create_currency(waitness,2,b"MYCOIN", b"MYCOIN", b"", 
        option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/164833890")), ctx);

        transfer::public_freeze_object(meta);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}