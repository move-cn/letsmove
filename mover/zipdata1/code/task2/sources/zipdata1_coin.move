module zipdata1::zipdata1_coin {
    public struct ZIPDATA1_COIN has drop {}
    fun init(w: ZIPDATA1_COIN, ctx: &mut sui::tx_context::TxContext) {
        let (treasury, metadata): (sui::coin::TreasuryCap<ZIPDATA1_COIN>, sui::coin::CoinMetadata<ZIPDATA1_COIN>) =
            sui::coin::create_currency<ZIPDATA1_COIN>(w, 9, b"ZIPDATA1", b"ZIPDATA1_COIN", b"ZIPDATA1 Coin", std::option::some<sui::url::Url>(sui::url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/0")), ctx);
        sui::transfer::public_freeze_object(metadata);
        sui::transfer::public_transfer(treasury, sui::tx_context::sender(ctx));
    }
    public fun mint(treasury: &mut sui::coin::TreasuryCap<ZIPDATA1_COIN>, amount: u64, recipient: address, ctx: &mut sui::tx_context::TxContext) {
        sui::coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }
    public fun burn(treasury: &mut sui::coin::TreasuryCap<ZIPDATA1_COIN>, c: sui::coin::Coin<ZIPDATA1_COIN>) {
        sui::coin::burn(treasury, c);
    }
}
