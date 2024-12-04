module my_coin::cjw_coin {
    use sui::url::{Self, Url};
    use sui::coin::{Self, TreasuryCap};

    public struct CJW_COIN has drop {}

    fun init(witness: CJW_COIN, ctx: &mut TxContext) {
        let ( treasury, metadata ) = coin::create_currency(
            witness,
            9,
            b"CJWC",
            b"cjw-Coin",
            b"This is a coin for cuijiawei",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/44763220?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury: &mut TreasuryCap<CJW_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }
}