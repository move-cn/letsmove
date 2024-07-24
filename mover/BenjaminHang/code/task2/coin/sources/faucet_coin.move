module coin::my_faucet_coin {

    use sui::coin::create_currency;
    use sui::transfer::{public_freeze_object, public_share_object};

    public struct MY_FAUCET_COIN has drop {}

    fun init(witness: MY_FAUCET_COIN, ctx: &mut TxContext) {
        let icon_url = option::none();
        let (treasury_cap, coin_metadata) = create_currency(
            witness,
            8,
            b"BenjaminHangFaucet",
            b"BenjaminHangFaucet",
            b"BenjaminHang's faucet coin",
            icon_url,
            ctx
        );

        // 所有权共享出去，不可变
        public_freeze_object(coin_metadata);
        // 所有权共享出去
        public_share_object(treasury_cap);
    }
}
