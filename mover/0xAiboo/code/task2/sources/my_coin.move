module task2::my_coin {
    use std::option;
    use sui::coin;
    use sui::transfer::{
        share_object,
        freeze_object,
        public_transfer,
        public_freeze_object
    };
    use sui::tx_context::sender;
    use sui::url::Url;

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let icon_url = option::none<Url>();
        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness,
            6,
            b"PEPE",
            b"RMB",
            b"this is qian",
            icon_url,
            ctx
        );

        public_freeze_object(coin_metadata);
        public_transfer(treasury_cap, sender(ctx));

    }
}
