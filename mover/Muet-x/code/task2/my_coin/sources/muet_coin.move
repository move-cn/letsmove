module my_coin::muet_coin {
    use sui::coin::create_currency;
    use std::option::{Self, none, some};
    use sui::transfer::{ public_transfer, public_freeze_object };
    use sui::url::{Self, Url};

    public struct MUET_COIN has drop {}

    fun init(muet_coin: MUET_COIN, ctx: &mut TxContext) {
        let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/195670331?v=4");
        let yes = some<Url>(url);


        let (treasury, coin_metadata) = create_currency(
            muet_coin,
            8,
            b"MUET_COIN",
            b"MUET_COIN",
            b"This is my coin",
            yes,
            ctx
        );
        public_freeze_object(coin_metadata);
        public_transfer(treasury, ctx.sender())
    }
}
