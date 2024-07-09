module coin::my_coin {

    use sui::coin::create_currency;
    use sui::transfer::{public_transfer, public_freeze_object};
    use sui::tx_context::sender;

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let icon_url = option::none();
        let (treasury_cap, coin_metadata) = create_currency(
            witness,
            8,
            b"BenjaminHang",
            b"BenjaminHang",
            b"BenjaminHang's coin",
            icon_url,
            ctx
        );

        // 所有权共享出去，不可变
        public_freeze_object(coin_metadata);
        // 所有权发送给合约部署者
        public_transfer(treasury_cap, sender(ctx));
    }
}
