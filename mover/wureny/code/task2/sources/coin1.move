module my_coin::wureny_coin {
    use sui::coin;
    use sui::transfer::{freeze_object, public_freeze_object, public_transfer};
    use sui::tx_context::sender;
    use sui::url::Url;

    public struct WURENY_COIN has drop {}

    fun init(witness: WURENY_COIN, ctx: &mut TxContext) {
        let icon_url=option::none<Url>();
        let (treasury_cap,coin_metadata) =coin::create_currency<WURENY_COIN>(witness,7,b"USD",b"usd",b"money",icon_url,ctx);

        public_freeze_object(coin_metadata);

        public_transfer(treasury_cap,sender(ctx));
    }
}