module zipdata1::zipdata1_faucet_coin {
    public struct ZIPDATA1_FAUCET_COIN has drop {}
    public struct Faucet has key, store {
        id: sui::object::UID,
        cap: sui::coin::TreasuryCap<ZIPDATA1_FAUCET_COIN>,
        per_tx_limit: u64
    }
    fun init(w: ZIPDATA1_FAUCET_COIN, ctx: &mut sui::tx_context::TxContext) {
        let (cap, metadata): (sui::coin::TreasuryCap<ZIPDATA1_FAUCET_COIN>, sui::coin::CoinMetadata<ZIPDATA1_FAUCET_COIN>) =
            sui::coin::create_currency<ZIPDATA1_FAUCET_COIN>(w, 9, b"Z1F", b"ZIPDATA1_FAUCET_COIN", b"ZIPDATA1 Faucet Coin", std::option::none<sui::url::Url>(), ctx);
        let faucet = Faucet { id: sui::object::new(ctx), cap: cap, per_tx_limit: 1_000_000_000 };
        sui::transfer::public_share_object(faucet);
        sui::transfer::public_freeze_object(metadata);
    }
    public fun claim(f: &mut Faucet, amount: u64, ctx: &mut sui::tx_context::TxContext) {
        assert!(amount <= f.per_tx_limit, 1);
        sui::coin::mint_and_transfer(&mut f.cap, amount, sui::tx_context::sender(ctx), ctx);
    }
}
