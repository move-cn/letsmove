module my_coin::muet_faucet_coin {
    use sui::coin::create_currency;
    use std::option::{Self, none, some};
    use sui::transfer::{ public_share_object, public_freeze_object };
    use sui::url::{Self, Url};

    public struct MUET_FAUCET_COIN has drop {}

    fun init(muet_faucet_coin: MUET_FAUCET_COIN, ctx: &mut TxContext) {
        let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/195670331?v=4");
        let yes = some<Url>(url);
        let (treasury, coin_metadata) = create_currency(
            muet_faucet_coin,
            8,
            b"MUET_FAUCET_COIN",
            b"MUET_FAUCET_COIN",
            b"This is my faucet coin",
            yes,
            ctx
        );

        public_freeze_object(coin_metadata);
        public_share_object(treasury)
    }
}
