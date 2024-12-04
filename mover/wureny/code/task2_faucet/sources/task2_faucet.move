module faucet::wureny_faucet {
    use sui::coin;
    use sui::transfer::{freeze_object, public_freeze_object, public_transfer,public_share_object};
    use sui::tx_context::sender;
    use sui::url::Url;

    public struct WURENY_FAUCET has drop {}

    fun init(witness: WURENY_FAUCET, ctx: &mut TxContext) {
        let icon_url=option::none<Url>();
        let (treasury_cap,coin_metadata) =coin::create_currency<WURENY_FAUCET>(witness,7,b"WLD",b"wld",b"world_coin",icon_url,ctx);

        public_freeze_object(coin_metadata);

        public_share_object(treasury_cap);
    }
}