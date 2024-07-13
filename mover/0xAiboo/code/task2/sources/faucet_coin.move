module task2::faucet_coin {
    use std::option;
    use sui::coin;
    use sui::transfer::{
        share_object,
        freeze_object,
        public_transfer,
        public_freeze_object,
        public_share_object
    };
    use sui::tx_context::sender;
    use sui::url::Url;

    public struct FAUCET_COIN has drop {}

    fun init(
        witness: FAUCET_COIN,
        ctx: &mut TxContext
    ) {
        let icon_url = option::none<Url>();
        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness,
            6,
            b"Faucet Coin",
            b"Faucet Coin",
            b"this is Faucet Coin",
            icon_url,
            ctx
        );

        // 所有权共享  不可变共享
        public_freeze_object(coin_metadata);
        public_share_object(treasury_cap);

    }
}
